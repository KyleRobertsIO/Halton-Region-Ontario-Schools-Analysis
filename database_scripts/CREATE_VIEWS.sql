/*************************************************
    Grade 3 Skills Passing Province Standard
*************************************************/
CREATE OR ALTER VIEW [dbo].[Grade_3_School_Reading_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON 
        star.School_Number = g3m.School_Number
        AND star.School_Year = g3m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Reading' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_3_School_Writing_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON 
        star.School_Number = g3m.School_Number
        AND star.School_Year = g3m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Writing' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_3_School_Math_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON 
        star.School_Number = g3m.School_Number
        AND star.School_Year = g3m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Math' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_3_School_Skills_Passing_Standard_Percentages]
AS

SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_3_School_Math_Skill_Passing_Standard_Percentages]
UNION
SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_3_School_Reading_Skill_Passing_Standard_Percentages]
UNION
SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_3_School_Writing_Skill_Passing_Standard_Percentages]
GO

/*************************************************
    Grade 6 Skills Passing Province Standard
*************************************************/
CREATE OR ALTER VIEW [dbo].[Grade_6_School_Reading_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON 
        star.School_Number = g6m.School_Number
        AND star.School_Year = g6m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Reading' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_6_School_Writing_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON 
        star.School_Number = g6m.School_Number
        AND star.School_Year = g6m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Writing' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_6_School_Math_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON 
        star.School_Number = g6m.School_Number
        AND star.School_Year = g6m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Math' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

------------------------------------

CREATE OR ALTER VIEW [dbo].[Grade_6_School_Skills_Passing_Standard_Percentages]
AS

SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_6_School_Math_Skill_Passing_Standard_Percentages]
UNION
SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_6_School_Reading_Skill_Passing_Standard_Percentages]
UNION
SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_6_School_Writing_Skill_Passing_Standard_Percentages]

/*************************************************
    Grade 9 Math Skills Passing Province Standard
*************************************************/

CREATE OR ALTER VIEW [dbo].[Grade_9_School_Applied_Math_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g9m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_9_Metrics] g9m
    ON 
        star.School_Number = g9m.School_Number
        AND star.School_Year = g9m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Applied Math' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO

CREATE OR ALTER VIEW [dbo].[Grade_9_School_Academic_Math_Skill_Passing_Standard_Percentages]
AS

WITH CTE_VALID_PERCENTAGES
AS (
    SELECT 
        star.School_Year,
        CONCAT(Name, ' - ', Level, ' - ', City) AS School,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            g9m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math
        ) Percentage_Achieving_The_Provincial_Standard
    FROM [dbo].[Star]
    JOIN [dbo].[Grade_9_Metrics] g9m
    ON 
        star.School_Number = g9m.School_Number
        AND star.School_Year = g9m.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)

SELECT
    'Academic Math' Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_VALID_PERCENTAGES
WHERE 
    Percentage_Achieving_The_Provincial_Standard IS NOT NULL
GO


CREATE OR ALTER VIEW [dbo].[Grade_9_School_Math_Skills_Passing_Standard_Percentages]
AS

SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_9_School_Applied_Math_Skill_Passing_Standard_Percentages]
UNION
SELECT
    Skill,
    School_Year,
    School,
    Percentage_Achieving_The_Provincial_Standard
FROM [dbo].[Grade_9_School_Academic_Math_Skill_Passing_Standard_Percentages]
GO