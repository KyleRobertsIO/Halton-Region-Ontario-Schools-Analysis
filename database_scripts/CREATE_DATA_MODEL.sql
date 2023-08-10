DROP TABLE IF EXISTS [dbo].[Board];
CREATE TABLE [dbo].[Board] (
    Board_Number NVARCHAR(6) NOT NULL PRIMARY KEY,
    Name NVARCHAR(max) NOT NULL,
    Type NVARCHAR(35) NOT NULL,
    Website NVARCHAR(max) NULL
)

DROP TABLE IF EXISTS [dbo].[School];
CREATE TABLE [dbo].[School] (
    School_Number NVARCHAR(6) NOT NULL,
    Name NVARCHAR(max) NOT NULL,
    Type NVARCHAR(19) NOT NULL,
    Special_Condition_Code NVARCHAR(25) NOT NULL,
    Level NVARCHAR(10) NOT NULL,
    School_Langauge NVARCHAR(7) NOT NULL,
    Grade_Range NVARCHAR(4) NOT NULL,
    Phone_Number NVARCHAR(12) NULL,
    Fax_Number NVARCHAR(12) NULL,
    Website NVARCHAR(max) NULL
)

DROP TABLE IF EXISTS [dbo].[Location];
CREATE TABLE [dbo].[Location] (
    Building_Suite NVARCHAR(50) NULL,
    PO_Box NVARCHAR(16) NULL,
    Street_Address NVARCHAR(50) NOT NULL,
    Municipaliy NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NULL,
    Province NVARCHAR(7) NOT NULL,
    Postal_Code NVARCHAR(6) NULL,
    Latitude DECIMAL(14, 12) NOT NULL,
    Longitude DECIMAL(14, 12) NOT NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_3_Metrics];
CREATE TABLE [dbo].[Grade_3_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading NVARCHAR(6) NULL,
    Percentage_Of_Reading_Achievement_Over_3_Years NVARCHAR(6) NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing NVARCHAR(6),
    Change_In_Writing_Achievement_Over_3_Years NVARCHAR(6) NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math NVARCHAR(6) NULL,
    Change_In_Math_Achievement_Over_3_Years NVARCHAR(6) NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_6_Metrics];
CREATE TABLE [dbo].[Grade_6_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading NVARCHAR(6) NULL,
    Percentage_Of_Reading_Achievement_Over_3_Years NVARCHAR(6) NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing NVARCHAR(6),
    Change_In_Writing_Achievement_Over_3_Years NVARCHAR(6) NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math NVARCHAR(6) NULL,
    Change_In_Math_Achievement_Over_3_Years NVARCHAR(6) NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_9_Metrics];
CREATE TABLE [dbo].[Grade_9_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math NVARCHAR(6) NULL,
    Change_In_Math_Achievement_Over_3_Years NVARCHAR(6) NULL,
    Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math NVARCHAR(6) NULL,
    Change_In_Applied_Math_Achievement_Over_3_Years NVARCHAR(6) NULL
)

DROP TABLE IF EXISTS [dbo].[Grade_10_Metrics];
CREATE TABLE [dbo].[Grade_10_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Percentage_Of_Students_That_Passed_The_OSSLT_On_First_Attempt NVARCHAR(6) NULL,
    Change_In_OSSLT_Literacy_Achievement_Over_3_Years NVARCHAR(6) NULL
)

DROP TABLE IF EXISTS [dbo].[Language_Metrics];
CREATE TABLE [dbo].[Language_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_English NVARCHAR(5) NULL,
    Percentage_Of_Students_Whose_First_Lang_Is_Not_French NVARCHAR(5) NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country NVARCHAR(5) NULL,
    Percentage_Of_Students_New_To_Canada_From_Non_French_Speaking_Country NVARCHAR(5) NULL
)

DROP TABLE IF EXISTS [dbo].[Student_Metrics];
CREATE TABLE [dbo].[Student_Metrics] (
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Student_Enrolment NVARCHAR(6) NULL DEFAULT 0,
    Percentage_Of_Students_Receiving_Special_Education_Services NVARCHAR(5) NULL,
    Percentage_Of_Students_Identifed_As_Gifted NVARCHAR(5) NULL,
    Percentage_Of_Children_Who_Live_In_Low_Income_Households NVARCHAR(5) NULL,
    Percentage_Of_Students_Whose_Parents_Have_Some_University_Education NVARCHAR(5) NULL
)

DROP TABLE IF EXISTS [dbo].[Star];
CREATE TABLE [dbo].[Star] (
    Fact_Id INT IDENTITY(1,1) PRIMARY KEY,
    Extract_Date DATE NOT NULL,
    School_Year NVARCHAR(9) NOT NULL,
    School_Number NVARCHAR(6) NOT NULL,
    Board_Number NVARCHAR(6) NOT NULL
)