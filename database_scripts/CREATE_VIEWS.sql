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
    Board Based Grade 3 Skills Passing 
    Province Standard
*************************************************/

CREATE OR ALTER VIEW [dbo].[Board_Grade_3_Math_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_3_MATH_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
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
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_MATH_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
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
    bma.School_Year,
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
        star.School_Year,
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
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_READING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
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
    bma.School_Year,
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
        star.School_Year,
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
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_3_WRITING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
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
    bma.School_Year,
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
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Writing_Skill_Average]
UNION
SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Reading_Skill_Average]
UNION
SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_3_Math_Skill_Average]
GO

/*************************************************
    Board Based Grade 6 Skills Passing 
    Province Standard
*************************************************/

CREATE OR ALTER VIEW [dbo].[Board_Grade_6_Math_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_6_MATH_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
        'Math' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Math
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON
        star.School_Year = g6m.School_Year
        AND star.School_Number = g6m.School_Number
),
CTE_BOARD_MATH_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_6_MATH_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_6_MATH_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.School_Year,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_MATH_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_6_Reading_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_6_READING_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
        'Reading' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Reading
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON
        star.School_Year = g6m.School_Year
        AND star.School_Number = g6m.School_Number
),
CTE_BOARD_READING_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_6_READING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_6_READING_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.School_Year,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_READING_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_6_Writing_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_6_WRITING_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
        'Writing' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g6m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Writing
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_6_Metrics] g6m
    ON
        star.School_Year = g6m.School_Year
        AND star.School_Number = g6m.School_Number
),
CTE_BOARD_WRITING_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_6_WRITING_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_6_WRITING_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.School_Year,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_WRITING_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_6_Skill_Average]
AS

SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_6_Writing_Skill_Average]
UNION
SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_6_Reading_Skill_Average]
UNION
SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_6_Math_Skill_Average]
GO
/*************************************************
    Board Based Grade 9 Math Skills Passing 
    Province Standard
*************************************************/

CREATE OR ALTER VIEW [dbo].[Board_Grade_9_Applied_Math_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_9_APPLIED_MATH_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
        'Applied Math' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g9m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Applied_Math
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_9_Metrics] g9m
    ON
        star.School_Year = g9m.School_Year
        AND star.School_Number = g9m.School_Number
),
CTE_BOARD_MATH_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_9_APPLIED_MATH_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_9_APPLIED_MATH_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.School_Year,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_MATH_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_9_Academic_Math_Skill_Average]
AS

WITH CTE_SCHOOL_GRADE_9_ACADEMIC_MATH_RESULTS
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        star.School_Year,
        'Academic Math' AS Skill,
        CAST(
            [staging].[UDF_PERCENTAGE_CLEAN_UP](
                g9m.Percentage_Of_Students_Achieving_The_Provincial_Standard_In_Academic_Math
            ) AS DECIMAL(5, 2)
        ) AS Percentage_Achieving_The_Provincial_Standard 
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Grade_9_Metrics] g9m
    ON
        star.School_Year = g9m.School_Year
        AND star.School_Number = g9m.School_Number
),
CTE_BOARD_MATH_RESULT_AVERAGES AS (
    SELECT
        Board_Name,
        School_Year,
        Skill,
        AVG(Percentage_Achieving_The_Provincial_Standard) AS Average_Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SCHOOL_GRADE_9_ACADEMIC_MATH_RESULTS
    WHERE Percentage_Achieving_The_Provincial_Standard IS NOT NULL
    GROUP BY
        Board_Name,
        School_Year,
        Skill
),
CTE_SCHOOLS_INVOLVED AS (
    SELECT
        Board_Name,
        COUNT(*) AS Total_Involved_Schools
    FROM [CTE_SCHOOL_GRADE_9_ACADEMIC_MATH_RESULTS]
    GROUP BY Board_Name
)
SELECT
    bma.Board_Name,
    bma.School_Year,
    bma.Skill,
    bma.Average_Percentage_Achieving_The_Provincial_Standard,
    si.Total_Involved_Schools
FROM CTE_BOARD_MATH_RESULT_AVERAGES bma
JOIN CTE_SCHOOLS_INVOLVED si
ON
    bma.Board_Name = si.Board_Name
GO

CREATE OR ALTER VIEW [dbo].[Board_Grade_9_Math_Skill_Average]
AS

SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_9_Applied_Math_Skill_Average]
UNION
SELECT
    Board_Name,
    School_Year,
    Skill,
    Average_Percentage_Achieving_The_Provincial_Standard,
    Total_Involved_Schools
FROM [dbo].[Board_Grade_9_Academic_Math_Skill_Average]
GO

/*************************************************
    Board Based Student Metrics
*************************************************/

CREATE OR ALTER VIEW [dbo].[Board_Student_Enrolment]
AS

WITH CTE_SCHOOL_ENROLMENT
AS (
    SELECT
        b.Name AS Board_Name,
        s.Name AS School_Name,
        s.Grade_Range,
        sm.School_Year,
        CAST(sm.Student_Enrolment AS INT) AS Student_Enrolment
    FROM [dbo].[Star] star
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
    JOIN [dbo].[Student_Metrics] sm
    ON
        star.School_Number = sm.School_Number
        AND star.School_Year = sm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE
        sm.Student_Enrolment != 'NA'
),
CTE_SCHOOLS_PER_BOARD AS (
    SELECT
        Board_Name,
        Grade_Range,
        COUNT(*) AS Schools_In_Board
    FROM CTE_SCHOOL_ENROLMENT
    GROUP BY
        Board_Name,
        Grade_Range
),
CTE_BOARD_ENROLMENT AS (
    SELECT
        Board_Name,
        School_Year,
        Grade_Range,
        SUM(Student_Enrolment) AS Student_Enrolment
    FROM CTE_SCHOOL_ENROLMENT
    GROUP BY
        Board_Name,
        School_Year,
        Grade_Range
),
CTE_MEAN_SCHOOL_ENROLMENT AS (
    SELECT
        be.Board_Name,
        be.School_Year,
        be.Student_Enrolment,
        be.Grade_Range,
        [dbo].[Grade_Count](be.Grade_Range) AS Grades_To_Manage,
        spb.Schools_In_Board,
        ROUND(
            (be.Student_Enrolment / spb.Schools_In_Board),
            0
        ) AS Mean_School_Enrolment
    FROM CTE_BOARD_ENROLMENT be
    JOIN CTE_SCHOOLS_PER_BOARD spb
    ON
        be.Board_Name = spb.Board_Name
        AND be.Grade_Range = spb.Grade_Range
)
SELECT
    Board_Name,
    School_Year,
    Student_Enrolment,
    Grade_Range,
    Grades_To_Manage,
    Schools_In_Board,
    Mean_School_Enrolment,
    ROUND(
        (Mean_School_Enrolment / Grades_To_Manage),
        0
    ) AS Mean_Grade_Size
FROM CTE_MEAN_SCHOOL_ENROLMENT