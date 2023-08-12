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
ORDER BY 
    Average_Percentage_Achieving_The_Provincial_Standard DESC,
    Total_Involved_Schools DESC
