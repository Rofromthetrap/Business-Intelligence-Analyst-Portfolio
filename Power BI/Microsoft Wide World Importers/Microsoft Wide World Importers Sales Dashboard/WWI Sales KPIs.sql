---------------------------WWI KPIs-------------------------------------------

--KPI 1--

--What were total sales by month for the last 24 months?--

SELECT
    A.Months,
    Sale_exc_tax
FROM
(
SELECT
    CAST(DATEADD(month, DATEDIFF(month, 0, Dimension.Date.Date), 0) AS DATE) AS Months
FROM
    Dimension.Date
GROUP BY
    CAST(DATEADD(month, DATEDIFF(month, 0, Dimension.Date.Date), 0) AS DATE)
    ) A
INNER JOIN
(
SELECT
    CAST(DATEADD(month, DATEDIFF(month, 0, Fact.Sale.[Delivery Date Key]), 0) AS DATE) AS Months,
    SUM(Sale.[Total Excluding Tax]) Sale_exc_tax
FROM
    Fact.Sale
GROUP BY
    CAST(DATEADD(month, DATEDIFF(month, 0, Fact.Sale.[Delivery Date Key]), 0) AS DATE)
) B
ON
A.Months = B.Months
ORDER BY
    A.Months ASC;


--Top performing Sales person/department per region--

SELECT
    *
FROM
    DIMENSION.Employee
WHERE
    DIMENSION.Employee.IsSalesperson = true

WITH SALES_EMPLOYEE AS (
SELECT DISTINCT
    [Employee Key] ,
    [Employee],
    [Preferred Name]
FROM
    DIMENSION.Employee
WHERE
    DIMENSION.Employee.[Is Salesperson] = 1)
SELECT
    [Employee],
    [Preferred Name],
    SUM([Total Excluding Tax]) [Total Excluding Tax],
    RANK() OVER (ORDER BY SUM([Total Excluding Tax]) DESC) [Rank]
FROM
    SALES_EMPLOYEE
LEFT JOIN
    Fact.Sale
ON
    [Employee Key] =[Salesperson Key]
GROUP BY
    [Employee],
    [Preferred Name]
ORDER BY
    [Total Excluding Tax] DESC

