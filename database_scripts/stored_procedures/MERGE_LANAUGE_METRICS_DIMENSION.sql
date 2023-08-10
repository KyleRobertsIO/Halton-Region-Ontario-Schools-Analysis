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
END