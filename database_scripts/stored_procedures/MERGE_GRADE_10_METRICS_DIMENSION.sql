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
END