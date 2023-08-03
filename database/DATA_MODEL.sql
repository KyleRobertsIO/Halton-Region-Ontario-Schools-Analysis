DROP TABLE IF EXISTS [dbo].[Board];
CREATE TABLE [dbo].[Board] (
    Board_Number NVARCHAR(6) NOT NULL PRIMARY KEY,
    Name NVARCHAR(35) NOT NULL,
    Type NVARCHAR(35) NOT NULL,
    Website NVARCHAR(125) NULL
)

DROP TABLE IF EXISTS [dbo].[School];
CREATE TABLE [dbo].[School] (
    School_Number NVARCHAR(6) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Type NVARCHAR(7) NOT NULL,
    Special_Condition_Code NVARCHAR(25) NOT NULL,
    Level NVARCHAR(9) NOT NULL,
    Langauge NVARCHAR(7) NOT NULL,
    Grade_Range NVARCHAR(4) NOT NULL,
    Phone_Number NVARCHAR(12) NULL,
    Fax_Number NVARCHAR(12) NULL,
    School_Website NVARCHAR(125) NULL
)

DROP TABLE IF EXISTS [dbo].[Location];
CREATE TABLE [dbo].[Location] (
    Building_Suite NVARCHAR(50) NULL,
    PO_Box NVARCHAR(15) NULL,
    Street_Address NVARCHAR(50) NOT NULL,
    Municipaliy NVARCHAR(50) NOT NULL,
    Province NVARCHAR(6) NOT NULL,
    Postal_Code NVARCHAR(6) NULL,
    Latitude DECIMAL(12, 6) NOT NULL,
    Longitude DECIMAL(12, 6) NOT NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_3_Metrics];
CREATE TABLE [dbo].[Grade_3_Metrics] (
    School_Year NVARCHAR(9) PRIMARY KEY,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading INT NULL,
    Percentage_Of_Reading_Achievement_Over_3_Years INT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing INT,
    Change_In_Writing_Achievement_Over_3_Years INT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math INT NULL,
    Change_In_Math_Achievement_Over_3_years INT NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_6_Metrics];
CREATE TABLE [dbo].[Grade_6_Metrics] (
    School_Year NVARCHAR(9) PRIMARY KEY,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading INT NULL,
    Percentage_Of_Reading_Achievement_Over_3_Years INT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing INT,
    Change_In_Writing_Achievement_Over_3_Years INT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math INT NULL,
    Change_In_Math_Achievement_Over_3_years INT NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_9_Metrics];
CREATE TABLE [dbo].[Grade_9_Metrics] (
    School_Year NVARCHAR(9) PRIMARY KEY,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math INT NULL,
    Change_In_Math_Achievement_Over_3_years INT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math INT NULL,
    Change_In_Applied_Math_Achievement_Over_3_Years INT NULL
)

DROP TABLE [dbo].[Grade_10_Metrics];
CREATE TABLE [dbo].[Grade_10_Metrics] (
    Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt INT NULL,
    Change_In_OSSLT_Literacy_Achievement_Over_Three_Years INT NULL,
)

DROP TABLE IF EXISTS [dbo].[Star] (
    Fact_Id INT IDENTITY(1,1) PRIMARY KEY,
    Extract_Date DATE NOT NULL,
    School_Year NVARCHAR(9) NOT NULL,
    Student_Enrolment INT NOT NULL DEFAULT 0
    -- Provided Aggregations
    Percentage_Of_Students_Whose_First_Lang_Is_Not_English DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_French DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Receiving_Special_Education_Services DECIMAL(4, 1) NOT NULL,
    Percentage_Of_Students_Identifed_As_Gifted DECIMAL(4, 1) NOT NULL,

    Percentage_Of_Children_Who_Live_In_Low_Income_Households DECIMAL(4, 1) NULL,
    Percentage_Of_Students_Whose_Parents_Have_Home_University_Education DECIMAL(4, 1) NULL

)