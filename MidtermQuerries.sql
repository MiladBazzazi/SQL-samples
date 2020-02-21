--Declare a variable of type date and set it to some value of your choice.
--Write a query that has a column for each of the following:othe date 28 days
--from the dateothe date 1 year + 1 day from the dateohow many days between
--the day and Christmas 2017othe name of the day your date falls on (Wednesday for example)
DECLARE @myDate DATE
SET @myDate = '1980-11-01'

SELECT
    DATEADD(DAY, 28, @myDate) [28 Days ],
    DATEADD(DAY, 366, @myDate) [1yr + 1day],
    DATEDIFF(DAY, @myDate, '2017-12-25') [To Christmas 2017],
    DATENAME(WEEKDAY, @myDate) [Name Of Day]


-- Write a query that returns how many customers we have in each state.  Customers
-- can be found in the Sales.Customers database, city and state information in the Application.StateProvinces
-- and Application.Cities tables.  Use the DeliveryCityID column in Customers to make your joins.
--Your query should return all states – 53 records and should be ordered from the most to
--the least number of customers.  Return the full state name, not the two-letter code
SELECT
    ASP.StateProvinceName,
    COUNT(SC.DeliveryCityID) AS CustomerCount
FROM
    Application.StateProvinces ASP
    LEFT OUTER JOIN
    Application.Cities AC
    ON ASP.StateProvinceID = AC.StateProvinceID
    LEFT OUTER JOIN
    Sales.Customers SC
    ON SC.DeliveryCityID = AC.CityID
GROUP BY
ASP.StateProvinceName
ORDER BY
CustomerCount DESC


-- Write a query that brings back all the stock items (in warehouse.StockItems).  
-- Provide a column that totals sales for each for 2013, 2014, 2015, and 2016.
-- Include the StockItemName and StockItemID.
-- Sort the list from largest overall sales to the smallest.
SELECT
    PVT.StockItemID,
    PVT.StockItemName,
    PVT.[2013] AS [2013Sales],
    PVT.[2014] AS [2014Sales],
    PVT.[2015] AS [2015Sales],
    PVT.[2016] AS [2016Sales]
FROM
    (
	SELECT
        IL.StockItemID,
        SI.StockItemName,
        YEAR(I.InvoiceDate) AS [YearOfSale],
        SUM(IL.ExtendedPrice) AS [InvoiceTotal]
    FROM
        Warehouse.StockItems SI
        INNER JOIN
        Sales.InvoiceLines IL
        ON SI.StockItemID = IL.StockItemID
        INNER JOIN
        Sales.Invoices I
        ON I.InvoiceID = IL.InvoiceID
    GROUP BY
		IL.StockItemID,
        SI.StockItemName,
		YEAR(I.InvoiceDate)
	) X
	PIVOT (SUM(X.InvoiceTotal)
		FOR YearOfSale IN ([2013], [2014], [2015], [2016])
	 ) AS PVT
ORDER by PVT.[2013] DESC
