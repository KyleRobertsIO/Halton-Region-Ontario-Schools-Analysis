CREATE OR ALTER PROCEDURE [dbo].[MERGE_BOARD_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Board] AS TARGET
    USING (
        SELECT 
            Board_Number,
            Board_Name,
            Board_Type,
            Board_Website
        FROM [staging].[ontario_school_demographics]
    ) AS SRC
    ON SRC.Board_Number = TARGET.Board_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.Board_Number = SRC.Board_Number,
            TARGET.Name = SRC.Board_Name,
            TARGET.Type = SRC.Board_Type,
            TARGET.Website = SRC.Board_Website
    WHEN NOT MATCHED THEN
        INSERT
        (
            Board_Number,
            Name,
            Type,
            Website
        )
        VALUES
        (
            SRC.Board_Number,
            SRC.Board_Name,
            SRC.Board_Type,
            SRC.Board_Website
        );
END