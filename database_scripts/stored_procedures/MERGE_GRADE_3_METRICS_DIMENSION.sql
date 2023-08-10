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
END