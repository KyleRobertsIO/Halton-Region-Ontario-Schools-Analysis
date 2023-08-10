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
END