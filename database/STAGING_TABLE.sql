DROP TABLE IF EXISTS [staging].[ontario_school_demographics];
CREATE TABLE [staging].[ontario_school_demographics] (
    /*
        School Board
    */
    Board_Number NVARCHAR(6) NOT NULL PRIMARY KEY,
    Name NVARCHAR(35) NOT NULL,
    Type NVARCHAR(35) NOT NULL,
    Website NVARCHAR(125) NULL,
    /*
        School
    */
    School_Number NVARCHAR(6) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Type NVARCHAR(7) NOT NULL,
    Special_Condition_Code NVARCHAR(25) NOT NULL,
    Level NVARCHAR(9) NOT NULL,
    Langauge NVARCHAR(7) NOT NULL,
    Grade_Range NVARCHAR(4) NOT NULL,
    Phone_Number NVARCHAR(12) NULL,
    Fax_Number NVARCHAR(12) NULL,
    School_Website NVARCHAR(125) NULL,
    /*
        School Location
    */
    Building_Suite NVARCHAR(50) NULL,
    PO_Box NVARCHAR(15) NULL,
    Street_Address NVARCHAR(50) NOT NULL,
    Municipaliy NVARCHAR(50) NOT NULL,
    Province NVARCHAR(6) NOT NULL,
    Postal_Code NVARCHAR(6) NULL,
    Latitude DECIMAL(12, 6) NOT NULL,
    Longitude DECIMAL(12, 6) NOT NULL,
    /*
        Grade 3 Metrics
    */
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading INT NULL,
    G3_Percentage_Of_Reading_Achievement_Over_3_Years INT NULL,
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing INT,
    G3_Change_In_Writing_Achievement_Over_3_Years INT NULL,
    G3_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math INT NULL,
    G3_Change_In_Math_Achievement_Over_3_years INT NULL,
    /*
        Grade 6 Metrics
    */
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading INT NULL,
    G6_Percentage_Of_Reading_Achievement_Over_3_Years INT NULL,
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing INT,
    G6_Change_In_Writing_Achievement_Over_3_Years INT NULL,
    G6_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math INT NULL,
    G6_Change_In_Math_Achievement_Over_3_years INT NULL,
    /*
        Grade 9 Metrics
    */
    G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math INT NULL,
    G9_Change_In_Math_Achievement_Over_3_years INT NULL,
    G9_Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math INT NULL,
    G9_Change_In_Applied_Math_Achievement_Over_3_Years INT NULL
    /*
        Grade 10 Metrics
    */
    G10_Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt INT NULL,
    G10_Change_In_OSSLT_Literacy_Achievement_Over_Three_Years INT NULL
    /*
        General Metrics
    */
    Student_Enrolment INT NOT NULL DEFAULT 0,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_English DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_French DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Receiving_Special_Education_Services DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Identifed_As_Gifted DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Children_Who_Live_In_Low_Income_Households DECIMAL(4, 1) NULL,
    Percentage_Of_Students_Whose_Parents_Have_Home_University_Education DECIMAL(4, 1) NULL
)