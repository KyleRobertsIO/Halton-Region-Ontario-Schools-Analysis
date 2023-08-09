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
END