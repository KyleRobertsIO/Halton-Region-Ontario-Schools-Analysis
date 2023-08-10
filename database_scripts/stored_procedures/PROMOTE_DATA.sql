CREATE OR ALTER PROCEDURE [dbo].[PROMOTE_DATA]
AS
BEGIN
    DECLARE @STAGING_ID INT;
    DECLARE @SCHOOL_YEAR NVARCHAR(9);
    DECLARE @SCHOOL_NUMBER NVARCHAR(6);
    DECLARE @BOARD_NUMBER NVARCHAR(6);

    DECLARE stg_cursor CURSOR FOR 
    SELECT 
        Staging_Id,
        School_Year,
        School_Number,
        Board_Number
    FROM [staging].[ontario_school_demographics];

    OPEN stg_cursor;

    FETCH NEXT FROM stg_cursor INTO 
        @STAGING_ID,
        @SCHOOL_YEAR,
        @SCHOOL_NUMBER,
        @BOARD_NUMBER;
    WHILE @@FETCH_STATUS = 0
    BEGIN

        EXEC [dbo].[MERGE_BOARD_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_SCHOOL_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_GRADE_3_METRICS_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_GRADE_6_METRICS_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_GRADE_9_METRICS_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_GRADE_10_METRICS_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_LANGAUGE_METRICS_DIMENSION] @STAGING_ID;
        EXEC [dbo].[MERGE_STUDENT_METRICS_DIMENSION] @STAGING_ID;

        INSERT INTO [dbo].[Star]
        (
            School_Year,
            School_Number,
            Board_Number,
            Extract_Date
        )
        VALUES
        (
            @SCHOOL_YEAR,
            @SCHOOL_NUMBER,
            @BOARD_NUMBER,
            '2019-07-01'
        )

        FETCH NEXT FROM stg_cursor INTO
            @STAGING_ID,
            @SCHOOL_YEAR,
            @SCHOOL_NUMBER,
            @BOARD_NUMBER;
    END
    CLOSE stg_cursor;
    DEALLOCATE stg_cursor;
END