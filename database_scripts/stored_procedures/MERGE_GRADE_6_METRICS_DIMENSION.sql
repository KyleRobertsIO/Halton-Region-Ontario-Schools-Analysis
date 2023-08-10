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
END