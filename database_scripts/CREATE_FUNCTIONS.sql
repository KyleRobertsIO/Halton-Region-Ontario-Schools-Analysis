CREATE OR ALTER FUNCTION [staging].[UDF_PERCENTAGE_CLEAN_UP] (
    @COL_VALUE NVARCHAR(5)
)
RETURNS DECIMAL(5, 2) AS
BEGIN
    DECLARE @RESULT_VALUE DECIMAL(5, 2);
    SET @RESULT_VALUE = (
        SELECT
        percentage = CASE @COL_VALUE
            WHEN 'NA' THEN NULL
            WHEN 'SP' THEN NULL
            WHEN 'N/D' THEN NULL
            WHEN 'N/R' THEN NULL
            ELSE CAST(REPLACE(@COL_VALUE, '%', '') AS DECIMAL(5, 2))
        END
    )
    RETURN @RESULT_VALUE
END;
GO

CREATE OR ALTER FUNCTION [dbo].[Grade_Count] (
    @GRADE_RANGE NVARCHAR(4)
)
RETURNS INT AS
BEGIN
    DECLARE @TOTAL INT;
    SET @TOTAL = (
        SELECT
        amount = CASE @GRADE_RANGE
            WHEN '1-5' THEN 5
            WHEN '1-8' THEN 8
            WHEN '4-8' THEN 5
            WHEN '5-8' THEN 4
            WHEN '6-8' THEN 3
            WHEN '7-8' THEN 2
            WHEN '9-12' THEN 4
            WHEN 'JK-2' THEN 4
            WHEN 'JK-3' THEN 5
            WHEN 'JK-4' THEN 6
            WHEN 'JK-5' THEN 7
            WHEN 'JK-6' THEN 8
            WHEN 'JK-8' THEN 10
            WHEN 'K-5' THEN 6
            WHEN 'K-8' THEN 9
            ELSE NULL
        END
    )
    RETURN @TOTAL
END;
GO
