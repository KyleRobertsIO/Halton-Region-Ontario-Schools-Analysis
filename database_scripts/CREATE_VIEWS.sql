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

/*************************************************
    Board Based Grade 3 Math Skills Passing 
    Province Standard
*************************************************/

CREATE OR ALTER VIEW [dbo].[Board_Grade_3_Math_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_3_MATH_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        'Math' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON
        star.School_Year = g3m.School_Year
        AND star.School_Number = g3m.School_Number
),
CTE_BOARD_MATH_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_MATH_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_3_MATH_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_MATH_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_3_Reading_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_3_READING_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        'Reading' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON
        star.School_Year = g3m.School_Year
        AND star.School_Number = g3m.School_Number
),
CTE_BOARD_READING_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_READING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_3_READING_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_READING_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_3_Writing_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_3_WRITING_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        'Writing' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g3m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_3_Metrics] g3m
    ON
        star.School_Year = g3m.School_Year
        AND star.School_Number = g3m.School_Number
),
CTE_BOARD_WRITING_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_WRITING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_3_WRITING_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_WRITING_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_3_Skill_Average]
AS

SELECT
    Board_Name,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Writing_Skill_Average]
UNION
SELECT
    Board_Name,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Reading_Skill_Average]
UNION
SELECT
    Board_Name,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Math_Skill_Average]
GO