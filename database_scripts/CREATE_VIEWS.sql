CREATE OR ALTER VIEW [dbo].[Geo_Classified_Schools]
AS

WITH CTE_NORTHERN_SCHOOLS
AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude > 45.3739621 -- North of Parry Sound
),
CTE_SOUTHERN_SCHOOLS AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude < 45.3739621 -- North of Parry Sound
)
SELECT
    School_Year,
    School,
    'Northern' AS Geo_Classification
FROM CTE_NORTHERN_SCHOOLS
UNION
SELECT
    School_Year,
    School,
    'Southern' AS Geo_Classification
FROM CTE_SOUTHERN_SCHOOLS
GO

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

CREATE OR ALTER VIEW [dbo].[Grade_6_School_Skills_Passing_Standard_Percentages_Geo_Classification]
AS

WITH CTE_NORTHERN_SCHOOLS
AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude > 45.3739621 -- North of Parry Sound
),
CTE_NORTHERN_SCHOOLS_SKILLS AS (
    SELECT
        ns.School_Year,
        ns.School,
        g6s.Skill,
        g6s.Percentage_Achieving_The_Provincial_Standard
    FROM CTE_NORTHERN_SCHOOLS ns
    JOIN [dbo].[Grade_6_School_Skills_Passing_Standard_Percentages] g6s
    ON
        ns.School_Year = g6s.School_Year
        AND ns.School = g6s.School
),
CTE_SOUTHERN_SCHOOLS AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude < 45.3739621 -- North of Parry Sound
),
CTE_SOUTHERN_SCHOOLS_SKILLS AS (
    SELECT
        ss.School_Year,
        ss.School,
        g6s.Skill,
        g6s.Percentage_Achieving_The_Provincial_Standard
    FROM CTE_SOUTHERN_SCHOOLS ss
    JOIN [dbo].[Grade_6_School_Skills_Passing_Standard_Percentages] g6s
    ON
        ss.School_Year = g6s.School_Year
        AND ss.School = g6s.School
)
SELECT
    School_Year,
    'Northern' AS Geo_Classification,
    School,
    Skill,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_NORTHERN_SCHOOLS_SKILLS
UNION
SELECT
    School_Year,
    'Southern' AS Geo_Classification,
    School,
    Skill,
    Percentage_Achieving_The_Provincial_Standard
FROM CTE_SOUTHERN_SCHOOLS_SKILLS
GO

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
        s.Level AS School_Type,
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
        School_Type,
        Grade_Range,
        SUM(Student_Enrolment) AS Student_Enrolment
    FROM CTE_SCHOOL_ENROLMENT
    GROUP BY
        Board_Name,
        School_Year,
        School_Type,
        Grade_Range
),
CTE_MEAN_SCHOOL_ENROLMENT AS (
    SELECT
        be.Board_Name,
        be.School_Year,
        be.School_Type,
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
    School_Type,
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
GO

CREATE OR ALTER VIEW [dbo].[Board_Student_Enrolment_Share_By_Level]
AS

WITH CTE_ELEMENTARY_SCHOOL_ENROLMENT
AS (
    SELECT
        Board_Name,
        School_Type,
        SUM(Student_Enrolment) AS Enrolment
    FROM [dbo].[Board_Student_Enrolment]
    WHERE
        School_Type = 'Elementary'
    GROUP BY
        Board_Name,
        School_Type
),
CTE_SECONDARY_SCHOOL_ENROLMENT AS (
    SELECT
        Board_Name,
        School_Type,
        SUM(Student_Enrolment) AS Enrolment
    FROM [dbo].[Board_Student_Enrolment]
    WHERE
        School_Type = 'Secondary'
    GROUP BY
        Board_Name,
        School_Type
),
CTE_JOINED_ENROLMENTS AS (
    SELECT
        e.Board_Name,
        e.Enrolment AS Elementary_Enrolment,
        s.Enrolment AS Secondary_Enrolment,
        (e.Enrolment + s.Enrolment) AS Total_Enrolment
    FROM CTE_ELEMENTARY_SCHOOL_ENROLMENT e
    JOIN CTE_SECONDARY_SCHOOL_ENROLMENT s
    ON
        e.Board_Name = s.Board_Name
)
SELECT
    Board_Name,
    Elementary_Enrolment,
    Secondary_Enrolment,
    (CAST(Elementary_Enrolment AS FLOAT)/CAST(Total_Enrolment AS FLOAT) * 100) AS Elementary_Percentage,
    (CAST(Secondary_Enrolment AS FLOAT)/CAST(Total_Enrolment AS FLOAT) * 100) AS Secondary_Percentage
FROM CTE_JOINED_ENROLMENTS
GO

/*************************************************
    School Based Student Metrics
*************************************************/

CREATE OR ALTER VIEW [dbo].[School_Type_Enrolment]
AS

WITH CTE_SCHOOL_TYPE_POPULATION
AS (
    SELECT
        star.School_Year,
        s.Name,
        s.Type,
        CAST(sm.Student_Enrolment AS INT) AS Student_Enrolment
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Student_Metrics] sm
    ON
        star.School_Year = sm.School_Year
        AND star.School_Number = sm.School_Number
    WHERE 
        Student_Enrolment != 'NA'
)
SELECT
    School_Year,
    Type,
    SUM(Student_Enrolment) AS Total_Students
FROM CTE_SCHOOL_TYPE_POPULATION
GROUP BY
    School_Year,
    Type
GO

CREATE OR ALTER VIEW [dbo].[Schools_EN_Or_FR_Not_First_Language_Percentages]
AS

WITH CTE_SCHOOLS_ENGLISH_NOT_FIRST_LANGUAGE
AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School_Name,
        s.Level AS School_Level,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            lm.Percentage_Of_Students_Whose_First_Lang_Is_Not_English
        ) AS Percentage_Not_First_Language
    FROM [dbo].[Star] star
    JOIN [dbo].[Language_Metrics] lm
    ON
        star.School_Number = lm.School_Number
        AND star.School_Year = lm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
),
CTE_SCHOOLS_FRENCH_NOT_FIRST_LANGUAGE AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School_Name,
        s.Level AS School_Level,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            lm.Percentage_Of_Students_Whose_First_Lang_Is_Not_French
        ) AS Percentage_Not_First_Language
    FROM [dbo].[Star] star
    JOIN [dbo].[Language_Metrics] lm
    ON
        star.School_Number = lm.School_Number
        AND star.School_Year = lm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
)
SELECT
    School_Year,
    School_Name,
    School_Level,
    'English' AS Language,
    Percentage_Not_First_Language
FROM CTE_SCHOOLS_ENGLISH_NOT_FIRST_LANGUAGE
WHERE 
    Percentage_Not_First_Language IS NOT NULL
UNION
SELECT
    School_Year,
    School_Name,
    School_Level,
    'French' AS Language,
    Percentage_Not_First_Language
FROM CTE_SCHOOLS_FRENCH_NOT_FIRST_LANGUAGE
WHERE 
    Percentage_Not_First_Language IS NOT NULL
GO


CREATE OR ALTER VIEW [dbo].[Schools_English_Not_First_Lanague_Involvement]
AS

WITH CTE_RESULT_INVOLVEMENT
AS (
    SELECT
        star.School_Year,
        Involvement_Status = CASE lm.Percentage_Of_Students_Whose_First_Lang_Is_Not_English
            WHEN 'SP' THEN 'Suppressed'
            WHEN 'NA' THEN 'Not Available'
            ELSE 'Recorded'
        END
    FROM [dbo].[Star] star
    JOIN [dbo].[Language_Metrics] lm
    ON
        star.School_Number = lm.School_Number
        AND star.School_Year = lm.School_Year
)
SELECT
    School_Year,
    Involvement_Status,
    COUNT(*) AS Involved
FROM CTE_RESULT_INVOLVEMENT
GROUP BY
    School_Year,
    Involvement_Status
GO

CREATE OR ALTER VIEW [dbo].[Schools_French_Not_First_Lanague_Involvement]
AS

WITH CTE_RESULT_INVOLVEMENT
AS (
    SELECT
        star.School_Year,
        Involvement_Status = CASE lm.Percentage_Of_Students_Whose_First_Lang_Is_Not_French
            WHEN 'SP' THEN 'Suppressed'
            WHEN 'NA' THEN 'Not Available'
            ELSE 'Recorded'
        END
    FROM [dbo].[Star] star
    JOIN [dbo].[Language_Metrics] lm
    ON
        star.School_Number = lm.School_Number
        AND star.School_Year = lm.School_Year
)
SELECT
    School_Year,
    Involvement_Status,
    COUNT(*) AS Involved
FROM CTE_RESULT_INVOLVEMENT
GROUP BY
    School_Year,
    Involvement_Status
GO

CREATE OR ALTER VIEW [dbo].[Schools_EN_Or_FR_Not_First_Language]
AS

SELECT
    School_Year,
    'English' AS Not_First_Langauge,
    Involvement_Status,
    Involved
FROM [dbo].[Schools_English_Not_First_Lanague_Involvement]
UNION
SELECT
    School_Year,
    'French' AS Not_First_Langauge,
    Involvement_Status,
    Involved
FROM [dbo].[Schools_French_Not_First_Lanague_Involvement]
GO

CREATE OR ALTER VIEW [dbo].[Schools_Students_New_To_Canada_Not_From_English_Speaking_Country_Percentages]
AS

WITH CTE_SCHOOLS_STUDENTS_NEW_TO_CANADA_FROM_NON_ENGLISH_SPEAKING_COUNTRY
AS (
    SELECT
        star.School_Year,
        b.Name AS Board_Name,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School_Name,
        s.Level AS School_Level,
        s.City,
        [staging].[UDF_PERCENTAGE_CLEAN_UP](
            lm.Percentage_Of_Students_New_To_Canada_From_Non_English_Speaking_Country
        ) AS Percentage_New_To_Canada_From_Non_English_Speaking_Country
    FROM [dbo].[Star] star
    JOIN [dbo].[Language_Metrics] lm
    ON
        star.School_Number = lm.School_Number
        AND star.School_Year = lm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
)
SELECT
    School_Year,
    Board_Name,
    School_Name,
    School_Level,
    City,
    'English' AS Language,
    Percentage_New_To_Canada_From_Non_English_Speaking_Country
FROM CTE_SCHOOLS_STUDENTS_NEW_TO_CANADA_FROM_NON_ENGLISH_SPEAKING_COUNTRY
WHERE 
    Percentage_New_To_Canada_From_Non_English_Speaking_Country IS NOT NULL
GO

CREATE OR ALTER VIEW [dbo].[Schools_Students_New_To_Canada_Not_From_English_Speaking_Country_Enrolment_Count]
AS

WITH CTE_STUDENT_ENROLMENT_BY_SCHOOL
AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School_Name,
        sm.Student_Enrolment
    FROM [dbo].[Star] star
    JOIN [dbo].[Student_Metrics] sm
    ON
        star.School_Number = sm.School_Number
        AND star.School_Year = sm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE sm.Student_Enrolment != 'NA'
)
SELECT
    enc.School_Year,
    enc.Board_Name,
    enc.School_Name,
    enc.School_Level,
    enc.City,
    enc.Language,
    sebs.Student_Enrolment,
    enc.Percentage_New_To_Canada_From_Non_English_Speaking_Country,
    CAST(
        ROUND(
        (CAST(sebs.Student_Enrolment AS FLOAT) / 100 * enc.Percentage_New_To_Canada_From_Non_English_Speaking_Country),
        0
    ) AS INT
    ) AS Enrolment_New_To_Canada
FROM [dbo].[Schools_Students_New_To_Canada_Not_From_English_Speaking_Country_Percentages] enc
JOIN CTE_STUDENT_ENROLMENT_BY_SCHOOL sebs
ON
    enc.School_Name = sebs.School_Name
GO

CREATE OR ALTER VIEW [dbo].[Schools_Students_New_To_Canada_Not_From_English_Speaking_Country_Enrolment_Count_With_Geo_Classification]
AS

WITH CTE_NORTHERN_SCHOOLS
AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude > 45.3739621 -- North of Parry Sound
),
CTE_SOUTHERN_SCHOOLS AS (
    SELECT
        star.School_Year,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School
    FROM [dbo].[Star] star
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    WHERE Latitude < 45.3739621 -- North of Parry Sound
),
CTE_SCHOOL_GEO_CLASSIFICATION AS (
    SELECT
        School_Year,
        School,
        'Northern' AS Geo_Classification
    FROM CTE_NORTHERN_SCHOOLS
    UNION
    SELECT
        School_Year,
        School,
        'Southern' AS Geo_Classification
    FROM CTE_SOUTHERN_SCHOOLS
)
SELECT
    ncsec.School_Year,
    ncsec.Board_Name,
    ncsec.School_Name,
    ncsec.School_Level,
    sgc.Geo_Classification,
    ncsec.City,
    ncsec.Language,
    ncsec.Student_Enrolment,
    ncsec.Percentage_New_To_Canada_From_Non_English_Speaking_Country,
    ncsec.Enrolment_New_To_Canada
FROM [dbo].[Schools_Students_New_To_Canada_Not_From_English_Speaking_Country_Enrolment_Count] ncsec
JOIN CTE_SCHOOL_GEO_CLASSIFICATION sgc
ON
    ncsec.School_Year = sgc.School_Year
    AND ncsec.School_Name = sgc.School
GO

CREATE OR ALTER VIEW [dbo].[Schools_Students_Living_In_Low_Income_Households]
AS

WITH CTE_SCHOOL_CHILDREN_WHO_LIVE_IN_LOW_INCOME_HOUSEHOLDS
AS (
    SELECT
        star.School_Year,
        b.Name AS Board_Name,
        CONCAT(s.Name, ' - ', s.Level, ' - ', s.City) AS School_Name,
        s.City,
        [staging].[UDF_PERCENTAGE_CLEAN_UP] (
            sm.Percentage_Of_Children_Who_Live_In_Low_Income_Households
        ) AS Percentage_Of_Children_Who_Live_In_Low_Income_Households,
        sm.Student_Enrolment
    FROM [dbo].[Star] star
    JOIN [dbo].[Student_Metrics] sm
    ON
        star.School_Number = sm.School_Number
        AND star.School_Year = sm.School_Year
    JOIN [dbo].[School] s
    ON
        star.School_Number = s.School_Number
    JOIN [dbo].[Board] b
    ON
        star.Board_Number = b.Board_Number
),
CTE_CTE_SCHOOL_CHILDREN_WHO_LIVE_IN_LOW_INCOME_HOUSEHOLDS_NO_NULLS AS (
    SELECT
        School_Year,
        Board_Name,
        School_Name,
        City,
        Percentage_Of_Children_Who_Live_In_Low_Income_Households,
        Student_Enrolment,
        CAST(
            ROUND(
                ((CAST(Student_Enrolment AS FLOAT) / 100) * Percentage_Of_Children_Who_Live_In_Low_Income_Households),
                2
            ) AS INT
        ) AS Student_Enrolment_In_Low_Income_Households
    FROM CTE_SCHOOL_CHILDREN_WHO_LIVE_IN_LOW_INCOME_HOUSEHOLDS
    WHERE
        Percentage_Of_Children_Who_Live_In_Low_Income_Households IS NOT NULL
        AND Student_Enrolment != 'NA'
)
SELECT
    slillh.School_Year,
    slillh.Board_Name,
    slillh.School_Name,
    slillh.City,
    gcs.Geo_Classification,
    slillh.Percentage_Of_Children_Who_Live_In_Low_Income_Households,
    slillh.Student_Enrolment,
    slillh.Student_Enrolment_In_Low_Income_Households
FROM CTE_CTE_SCHOOL_CHILDREN_WHO_LIVE_IN_LOW_INCOME_HOUSEHOLDS_NO_NULLS slillh
JOIN [dbo].[Geo_Classified_Schools] gcs
ON
    slillh.School_Year = gcs.School_Year
    AND slillh.School_Name = gcs.School
GO