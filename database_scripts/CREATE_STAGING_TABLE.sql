DROP TABLE IF EXISTS [staging].[ontario_school_demographics];
CREATE TABLE [staging].[ontario_school_demographics] (
    Staging_Id INT IDENTITY(1,1) PRIMARY KEY,
    /*
        School Board
    */
    Board_Number NVARCHAR(6) NULL,
    Board_Name NVARCHAR(max) NULL,
    Board_Type NVARCHAR(35) NULL,
    Board_Website NVARCHAR(max) NULL,
    /*
        School
    */
    School_Number NVARCHAR(6) NULL,
    School_Name NVARCHAR(max) NULL,
    School_Type NVARCHAR(19) NULL,
    Special_Condition_Code NVARCHAR(25) NULL,
    School_Level NVARCHAR(10) NULL,
    School_Langauge NVARCHAR(7) NULL,
    Grade_Range NVARCHAR(4) NULL,
    Phone_Number NVARCHAR(12) NULL,
    Fax_Number NVARCHAR(12) NULL,
    School_Website NVARCHAR(max) NULL,
    /*
        School Location
    */
    Building_Suite NVARCHAR(50) NULL,
    PO_Box NVARCHAR(16) NULL,
    Street_Address NVARCHAR(50) NULL,
    Municipality NVARCHAR(50) NULL,
    City NVARCHAR(50) NULL,
    Province NVARCHAR(7) NULL,
    Postal_Code NVARCHAR(6) NULL,
    Latitude DECIMAL(14, 12) NULL,
    Longitude DECIMAL(14, 12) NULL,
    /*
        Grade 3 Metrics
    */
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading NVARCHAR(6) NULL,
    G3_Percentage_Of_Reading_Achievement_Over_3_Years NVARCHAR(6) NULL,
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing NVARCHAR(6),
    G3_Change_In_Writing_Achievement_Over_3_Years NVARCHAR(6) NULL,
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math NVARCHAR(6) NULL,
    G3_Change_In_Math_Achievement_Over_3_years NVARCHAR(6) NULL,
    /*
        Grade 6 Metrics
    */
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading NVARCHAR(6) NULL,
    G6_Percentage_Of_Reading_Achievement_Over_3_Years NVARCHAR(6) NULL,
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing NVARCHAR(6),
    G6_Change_In_Writing_Achievement_Over_3_Years NVARCHAR(6) NULL,
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math NVARCHAR(6) NULL,
    G6_Change_In_Math_Achievement_Over_3_years NVARCHAR(6) NULL,
    /*
        Grade 9 Metrics
    */
    G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math NVARCHAR(6) NULL,
    G9_Change_In_Math_Achievement_Over_3_years NVARCHAR(6) NULL,
    G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math NVARCHAR(6) NULL,
    G9_Change_In_Applied_Math_Achievement_Over_3_Years NVARCHAR(6) NULL,
    /*
        Grade 10 Metrics
    */
    G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt NVARCHAR(6) NULL,
    G10_Change_In_OSSLT_Literacy_Achievement_Over_Three_Years NVARCHAR(6) NULL,
    /*
        General Metrics
    */
    Student_Enrolment NVARCHAR(6) NULL DEFAULT 0,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_English NVARCHAR(5) NULL,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_French NVARCHAR(5) NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country NVARCHAR(5) NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country NVARCHAR(5) NULL,
    Percentage_Of_Students_Receiving_Special_Education_Services NVARCHAR(5) NULL,
    Percentage_Of_Students_Identifed_As_Gifted NVARCHAR(5) NULL,
    Percentage_Of_Children_Who_Live_In_Low_Income_Households NVARCHAR(5) NULL,
    Percentage_Of_Students_Whose_Parents_Have_Home_University_Education NVARCHAR(5) NULL
)