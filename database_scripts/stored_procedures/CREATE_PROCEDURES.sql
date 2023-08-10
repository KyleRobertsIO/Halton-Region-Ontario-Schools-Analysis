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
        WHERE Staging_Id = @STAGING_ID
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
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_GRADE_3_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Grade_3_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            G3_Percentage_Of_Reading_Achievement_Over_3_Years,
            G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            G3_Change_In_Writing_Achievement_Over_3_Years,
            G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            G3_Change_In_Math_Achievement_Over_3_Years
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = TARGET.School_Year,
            TARGET.School_Number = TARGET.School_Number,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading = SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            TARGET.Percentage_Of_Reading_Achievement_Over_3_Years = SRC.G3_Percentage_Of_Reading_Achievement_Over_3_Years,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing = SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            TARGET.Change_In_Writing_Achievement_Over_3_Years = SRC.G3_Change_In_Writing_Achievement_Over_3_Years,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math = SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            TARGET.Change_In_Math_Achievement_Over_3_Years = SRC.G3_Change_In_Math_Achievement_Over_3_Years
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            Percentage_Of_Reading_Achievement_Over_3_Years,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            Change_In_Writing_Achievement_Over_3_Years,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            Change_In_Math_Achievement_Over_3_Years
        )
        VALUES
        (
            School_Year,
            School_Number,
            SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            SRC.G3_Percentage_Of_Reading_Achievement_Over_3_Years,
            SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            SRC.G3_Change_In_Writing_Achievement_Over_3_Years,
            SRC.G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            SRC.G3_Change_In_Math_Achievement_Over_3_Years
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_GRADE_6_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Grade_6_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            G6_Percentage_Of_Reading_Achievement_Over_3_Years,
            G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            G6_Change_In_Writing_Achievement_Over_3_Years,
            G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            G6_Change_In_Math_Achievement_Over_3_Years
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = TARGET.School_Year,
            TARGET.School_Number = TARGET.School_Number,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading = SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            TARGET.Percentage_Of_Reading_Achievement_Over_3_Years = SRC.G6_Percentage_Of_Reading_Achievement_Over_3_Years,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing = SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            TARGET.Change_In_Writing_Achievement_Over_3_Years = SRC.G6_Change_In_Writing_Achievement_Over_3_Years,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math = SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            TARGET.Change_In_Math_Achievement_Over_3_Years = SRC.G6_Change_In_Math_Achievement_Over_3_Years
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            Percentage_Of_Reading_Achievement_Over_3_Years,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            Change_In_Writing_Achievement_Over_3_Years,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            Change_In_Math_Achievement_Over_3_Years
        )
        VALUES
        (
            School_Year,
            School_Number,
            SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading,
            SRC.G6_Percentage_Of_Reading_Achievement_Over_3_Years,
            SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing,
            SRC.G6_Change_In_Writing_Achievement_Over_3_Years,
            SRC.G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math,
            SRC.G6_Change_In_Math_Achievement_Over_3_Years
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_GRADE_9_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Grade_9_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math,
            G9_Change_In_Math_Achievement_Over_3_Years,
            G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math,
            G9_Change_In_Applied_Math_Achievement_Over_3_Years
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = TARGET.School_Year,
            TARGET.School_Number = TARGET.School_Number,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math = SRC.G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math,
            TARGET.Change_In_Math_Achievement_Over_3_Years = SRC.G9_Change_In_Math_Achievement_Over_3_Years,
            TARGET.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math = SRC.G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math,
            TARGET.Change_In_Applied_Math_Achievement_Over_3_Years = SRC.G9_Change_In_Applied_Math_Achievement_Over_3_Years
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math,
            Change_In_Math_Achievement_Over_3_Years,
            Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math,
            Change_In_Applied_Math_Achievement_Over_3_Years
        )
        VALUES
        (
            School_Year,
            School_Number,
            SRC.G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math,
            SRC.G9_Change_In_Math_Achievement_Over_3_Years,
            SRC.G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math,
            SRC.G9_Change_In_Applied_Math_Achievement_Over_3_Years
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_GRADE_10_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Grade_10_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt,
            G10_Change_In_OSSLT_Literacy_Achievement_Over_3_Years
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = TARGET.School_Year,
            TARGET.School_Number = TARGET.School_Number,
            TARGET.Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt = SRC.G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt,
            TARGET.Change_In_OSSLT_Literacy_Achievement_Over_3_Years = SRC.G10_Change_In_OSSLT_Literacy_Achievement_Over_3_Years
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt,
            Change_In_OSSLT_Literacy_Achievement_Over_3_Years
        )
        VALUES
        (
            School_Year,
            School_Number,
            SRC.G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt,
            SRC.G10_Change_In_OSSLT_Literacy_Achievement_Over_3_Years
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_LANGAUGE_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Language_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            Percentage_Of_Students_Whose_First_Lang_Is_Not_English,
            Percentage_Of_Students_Whose_First_Lang_Is_Not_French,
            Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country,
            Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = SRC.School_Year,
            TARGET.School_Number = SRC.School_Number,
            TARGET.Percentage_Of_Students_Whose_First_Lang_Is_Not_English = SRC.Percentage_Of_Students_Whose_First_Lang_Is_Not_English,
            TARGET.Percentage_Of_Students_Whose_First_Lang_Is_Not_French = SRC.Percentage_Of_Students_Whose_First_Lang_Is_Not_French,
            TARGET.Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country = SRC.Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country,
            TARGET.Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country = SRC.Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Percentage_Of_Students_Whose_First_Lang_Is_Not_English,
            Percentage_Of_Students_Whose_First_Lang_Is_Not_French,
            Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country,
            Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country
        )
        VALUES
        (
            SRC.School_Year,
            SRC.School_Number,
            SRC.Percentage_Of_Students_Whose_First_Lang_Is_Not_English,
            SRC.Percentage_Of_Students_Whose_First_Lang_Is_Not_French,
            SRC.Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country,
            SRC.Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_SCHOOL_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[School] AS TARGET
    USING (
        SELECT DISTINCT
            School_Number,
            School_Name,
            School_Type,
            Special_Condition_Code,
            School_Level,
            School_Langauge,
            Grade_Range,
            Phone_Number,
            Fax_Number,
            School_Website
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Number = SRC.School_Number,
            TARGET.Name = SRC.School_Name,
            TARGET.Type = SRC.School_Type,
            TARGET.Special_Condition_Code = SRC.Special_Condition_Code,
            TARGET.Level = SRC.School_Level,
            TARGET.School_Langauge = SRC.School_Langauge,
            TARGET.Grade_Range = SRC.Grade_Range,
            TARGET.Phone_Number = SRC.Phone_Number,
            TARGET.Fax_Number = SRC.Fax_Number,
            TARGET.Website = SRC.School_Website
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Number,
            Name,
            Type,
            Special_Condition_Code,
            Level,
            School_Langauge,
            Grade_Range,
            Phone_Number,
            Fax_Number,
            Website
        )
        VALUES
        (
            SRC.School_Number,
            SRC.School_Name,
            SRC.School_Type,
            SRC.Special_Condition_Code,
            SRC.School_Level,
            SRC.School_Langauge,
            SRC.Grade_Range,
            SRC.Phone_Number,
            SRC.Fax_Number,
            SRC.School_Website
        );
END;
GO
CREATE OR ALTER PROCEDURE [dbo].[MERGE_STUDENT_METRICS_DIMENSION]
    @STAGING_ID INT
AS
BEGIN
    MERGE [dbo].[Student_Metrics] AS TARGET
    USING (
        SELECT 
            School_Year,
            School_Number,
            Student_Enrolment,
            Percentage_Of_Students_Receiving_Special_Education_Services,
            Percentage_Of_Students_Identifed_As_Gifted,
            Percentage_Of_Children_Who_Live_In_Low_Income_Households,
            Percentage_Of_Students_Whose_Parents_Have_Some_University_Education
        FROM [staging].[ontario_school_demographics]
        WHERE Staging_Id = @STAGING_ID
    ) AS SRC
    ON 
        SRC.School_Year = TARGET.School_Year
        AND SRC.School_Number = TARGET.School_Number
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.School_Year = SRC.School_Year,
            TARGET.School_Number = SRC.School_Number,
            TARGET.Student_Enrolment = SRC.Student_Enrolment,
            TARGET.Percentage_Of_Students_Receiving_Special_Education_Services = SRC.Percentage_Of_Students_Receiving_Special_Education_Services,
            TARGET.Percentage_Of_Students_Identifed_As_Gifted = SRC.Percentage_Of_Students_Identifed_As_Gifted,
            TARGET.Percentage_Of_Children_Who_Live_In_Low_Income_Households = SRC.Percentage_Of_Children_Who_Live_In_Low_Income_Households,
            TARGET.Percentage_Of_Students_Whose_Parents_Have_Some_University_Education = SRC.Percentage_Of_Students_Whose_Parents_Have_Some_University_Education
    WHEN NOT MATCHED THEN
        INSERT
        (
            School_Year,
            School_Number,
            Student_Enrolment,
            Percentage_Of_Students_Receiving_Special_Education_Services,
            Percentage_Of_Students_Identifed_As_Gifted,
            Percentage_Of_Children_Who_Live_In_Low_Income_Households,
            Percentage_Of_Students_Whose_Parents_Have_Some_University_Education
        )
        VALUES
        (
            SRC.School_Year,
            SRC.School_Number,
            SRC.Student_Enrolment,
            SRC.Percentage_Of_Students_Receiving_Special_Education_Services,
            SRC.Percentage_Of_Students_Identifed_As_Gifted,
            SRC.Percentage_Of_Children_Who_Live_In_Low_Income_Households,
            SRC.Percentage_Of_Students_Whose_Parents_Have_Some_University_Education
        );
END;
GO
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
END;