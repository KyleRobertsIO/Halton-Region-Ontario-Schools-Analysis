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
END