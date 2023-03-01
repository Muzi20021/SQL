
# Æwiczenie 1

SELECT        
dbo.FactInternetSales.SalesOrderNumber, COUNT(dbo.FactInternetSales.SalesOrderLineNumber) AS Liczba_pozycji, dbo.DimCustomer.Gender, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.HouseOwnerFlag, 
                         dbo.DimCustomer.FrenchOccupation, dbo.DimCustomer.EnglishEducation, dbo.DimCustomer.SpanishEducation, dbo.DimCustomer.FrenchEducation, dbo.DimCustomer.EnglishOccupation, dbo.DimCustomer.SpanishOccupation, 
                         dbo.DimCustomer.NumberCarsOwned, SUM(dbo.FactInternetSales.SalesAmount) AS Razem
FROM            dbo.DimCustomer INNER JOIN
                         dbo.FactInternetSales ON dbo.DimCustomer.CustomerKey = dbo.FactInternetSales.CustomerKey
GROUP BY dbo.FactInternetSales.SalesOrderNumber, dbo.DimCustomer.Gender, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.HouseOwnerFlag, dbo.DimCustomer.FrenchOccupation, dbo.DimCustomer.EnglishEducation, 
                         dbo.DimCustomer.SpanishEducation, dbo.DimCustomer.FrenchEducation, dbo.DimCustomer.EnglishOccupation, dbo.DimCustomer.SpanishOccupation, dbo.DimCustomer.NumberCarsOwned



Create view sprzedaz_klient_058 as
SELECT        dbo.FactInternetSales.SalesOrderNumber, COUNT(dbo.FactInternetSales.SalesOrderLineNumber) AS Liczba_pozycji, dbo.DimCustomer.Gender, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.HouseOwnerFlag, 
                         dbo.DimCustomer.FrenchOccupation, dbo.DimCustomer.EnglishEducation, dbo.DimCustomer.SpanishEducation, dbo.DimCustomer.FrenchEducation, dbo.DimCustomer.EnglishOccupation, dbo.DimCustomer.SpanishOccupation, 
                         dbo.DimCustomer.NumberCarsOwned, SUM(dbo.FactInternetSales.SalesAmount) AS Razem
FROM            dbo.DimCustomer INNER JOIN
                         dbo.FactInternetSales ON dbo.DimCustomer.CustomerKey = dbo.FactInternetSales.CustomerKey
GROUP BY dbo.FactInternetSales.SalesOrderNumber, dbo.DimCustomer.Gender, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.HouseOwnerFlag, dbo.DimCustomer.FrenchOccupation, dbo.DimCustomer.EnglishEducation, 
                         dbo.DimCustomer.SpanishEducation, dbo.DimCustomer.FrenchEducation, dbo.DimCustomer.EnglishOccupation, dbo.DimCustomer.SpanishOccupation, dbo.DimCustomer.NumberCarsOwned


Æwiczenie 2

SELECT        NumberChildrenAtHome AS Liczba_dzieci, SUM(Razem) AS Wartosc_zamowien, COUNT(SalesOrderNumber) AS Liczba_zamowien
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome
Æwiczenie 3

SELECT        NumberChildrenAtHome AS Liczba_dzieci, SUM(Razem) AS Wartosc_zamowien, COUNT(SalesOrderNumber) AS Liczba_zamowien, MIN(Razem) AS Minimalna_wartosc_zamowienia, MAX(Razem) 
                         AS Maksymalna_wartosc_zamowienia
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome

Æwiczenie 4

SELECT        NumberChildrenAtHome AS Liczba_dzieci, COUNT(SalesOrderNumber) AS [Liczba zamowien_o_wartosci_2.29]
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome, Razem
HAVING        (Razem = 2.29)
ORDER BY Liczba_dzieci

Æwiczenie 5
SELECT        NumberChildrenAtHome AS Liczba_dzieci, COUNT(SalesOrderNumber) AS [Liczba zamowien o wartosci 3578.27]
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome, Razem
HAVING        (Razem = 3578.27)
ORDER BY Liczba_dzieci

Æwiczenie 6 - widok
Create view dzieci_min_zam_058 as
SELECT        NumberChildrenAtHome AS Liczba_dzieci, COUNT(SalesOrderNumber) AS [Liczba zamowien_o_wartosci_2.29]
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome, Razem
HAVING        (Razem = 2.29)


SELECT        Liczba_dzieci, [Liczba zamowien_o_wartosci_2.29], ROUND (CAST(([Liczba zamowien_o_wartosci_2.29]* 100) As float) /
(SELECT SUM([Liczba zamowien_o_wartosci_2.29]) FROM dzieci_min_zam_058),2) AS Procent
FROM            dzieci_min_zam_058 
GROUP BY Liczba_dzieci, [Liczba zamowien_o_wartosci_2.29]

Æwiczenie 7
Create view dzieci_max_zam_058 as
SELECT        NumberChildrenAtHome AS Liczba_dzieci, COUNT(SalesOrderNumber) AS [Liczba zamowien o wartosci 3578.27]
FROM            schw_058.sprzedaz_klient_058
GROUP BY NumberChildrenAtHome, Razem
HAVING        (Razem = 3578.27)

SELECT        Liczba_dzieci, [Liczba zamowien o wartosci 3578.27], ROUND (CAST(([Liczba zamowien o wartosci 3578.27]* 100) As float) /
(SELECT SUM([Liczba zamowien o wartosci 3578.27]) FROM dzieci_max_zam_058),2) AS Procent
FROM            dzieci_max_zam_058 
GROUP BY Liczba_dzieci, [Liczba zamowien o wartosci 3578.27]

Æwiczenie 8
Create view dzieci_min_058 as
SELECT        Liczba_dzieci, [Liczba zamowien_o_wartosci_2.29], ROUND (CAST(([Liczba zamowien_o_wartosci_2.29]* 100) As float) /
(SELECT SUM([Liczba zamowien_o_wartosci_2.29]) FROM dzieci_min_zam_058),2) AS Procent
FROM            dzieci_min_zam_058 
GROUP BY Liczba_dzieci, [Liczba zamowien_o_wartosci_2.29]

Create view dzieci_max_058 as
SELECT        Liczba_dzieci, [Liczba zamowien o wartosci 3578.27], ROUND (CAST(([Liczba zamowien o wartosci 3578.27]* 100) As float) /
(SELECT SUM([Liczba zamowien o wartosci 3578.27]) FROM dzieci_max_zam_058),2) AS Procent
FROM            dzieci_max_zam_058 
GROUP BY Liczba_dzieci, [Liczba zamowien o wartosci 3578.27]

SELECT dzieci_max_058.Liczba_dzieci AS dzieci, dzieci_max_058.[Liczba zamowien o wartosci 3578.27], dzieci_max_058.Procent AS udzia³, dzieci_min_058.[Liczba zamowien_o_wartosci_2.29], dzieci_min_058.Procent AS udzia³
FROM     dzieci_max_058 INNER JOIN
                  dzieci_min_058 ON dzieci_max_058.Liczba_dzieci = dzieci_min_058.Liczba_dzieci
ORDER BY dzieci

Æwiczenie 9
Drop view dzieci_min_058, dzieci_max_058, dzieci_max_zam_058, dzieci_min_zam_058

Æwiczenie 10
SELECT        COUNT(dbo.FactInternetSales.SalesOrderNumber) AS Liczba_zamówieñ, SUM(dbo.FactInternetSales.SalesAmount) AS Wartoœæ_zamówieñ, dbo.DimCustomer.NumberCarsOwned AS Posiadane_samochody
FROM            dbo.FactInternetSales INNER JOIN
                         dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = dbo.DimCustomer.CustomerKey
GROUP BY dbo.DimCustomer.NumberCarsOwned
ORDER BY Posiadane_samochody


SELECT        COUNT(dbo.FactInternetSales.SalesOrderNumber) AS Liczba_zamówieñ, SUM(dbo.FactInternetSales.SalesAmount) AS Wartoœæ_zamówieñ, dbo.DimCustomer.EnglishEducation, dbo.DimCustomer.SpanishEducation, 
                         dbo.DimCustomer.FrenchEducation
FROM            dbo.FactInternetSales INNER JOIN
                         dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = dbo.DimCustomer.CustomerKey
GROUP BY dbo.DimCustomer.EnglishEducation, dbo.DimCustomer.SpanishEducation, dbo.DimCustomer.FrenchEducation


SELECT        COUNT(dbo.FactInternetSales.SalesOrderNumber) AS Liczba_zamówieñ, SUM(dbo.FactInternetSales.SalesAmount) AS Wartoœæ_zamówieñ, dbo.DimCustomer.Gender
FROM            dbo.FactInternetSales INNER JOIN
                         dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = dbo.DimCustomer.CustomerKey
GROUP BY dbo.DimCustomer.Gender

#cwiczenie 11

SELECT        dbo.DimSalesReason.SalesReasonName, SUM(dbo.FactInternetSales.SalesAmount) AS [Wartoœæ sprzeda¿y]
FROM            dbo.FactInternetSales INNER JOIN
                         dbo.FactInternetSalesReason ON dbo.FactInternetSales.SalesOrderNumber = dbo.FactInternetSalesReason.SalesOrderNumber AND 
                         dbo.FactInternetSales.SalesOrderLineNumber = dbo.FactInternetSalesReason.SalesOrderLineNumber RIGHT OUTER JOIN
                         dbo.DimSalesReason ON dbo.FactInternetSalesReason.SalesReasonKey = dbo.DimSalesReason.SalesReasonKey
GROUP BY dbo.DimSalesReason.SalesReasonName
ORDER BY [Wartoœæ sprzeda¿y] DESC


# æwiczenie 12

SELECT        dbo.DimDate.CalendarYear, dbo.DimDate.DayNumberOfWeek, dbo.DimDate.EnglishDayNameOfWeek, SUM(dbo.FactInternetSales.SalesAmount) AS Expr1
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey
						 GROUP BY dbo.DimDate.EnglishDayNameOfWeek, dbo.DimDate.DayNumberOfWeek, dbo.DimDate.CalendarYear
						 ORDER BY dbo.DimDate.CalendarYear,DimDate.DayNumberOfWeek



# æwiczenie 13
# miasta

SELECT        dbo.DimGeography.City, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimGeography ON dbo.DimCustomer.GeographyKey =  dbo.DimGeography.GeographyKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimGeography.City
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC

SELECT        dbo.DimGeography.EnglishCountryRegionName, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimGeography ON dbo.DimCustomer.GeographyKey =  dbo.DimGeography.GeographyKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimGeography.EnglishCountryRegionName
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC


SELECT        dbo.DimSalesTerritory.SalesTerritoryRegion, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimSalesTerritory ON dbo.DimCustomer.GeographyKey =  dbo.DimSalesTerritory.SalesTerritoryKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimSalesTerritory.SalesTerritoryRegion
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC




SELECT        dbo.DimSalesTerritory.SalesTerritoryGroup, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimSalesTerritory ON dbo.FactInternetSales.SalesTerritoryKey =  dbo.DimSalesTerritory.SalesTerritoryKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimSalesTerritory.SalesTerritoryGroup
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC



### æwiczenie14

Select * From
(
SELECT TOP (5)   dbo.DimGeography.City, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimGeography ON dbo.DimCustomer.GeographyKey =  dbo.DimGeography.GeographyKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimGeography.City
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC
)
as max


UNION ALL

Select * From
(

SELECT TOP (5)   dbo.DimGeography.City, SUM(dbo.FactInternetSales.SalesAmount) AS Sprzedaz
FROM            dbo.DimDate INNER JOIN
                         dbo.FactInternetSales ON dbo.DimDate.DateKey = dbo.FactInternetSales.OrderDateKey INNER JOIN
						 dbo.DimCustomer ON dbo.FactInternetSales.CustomerKey = DimCustomer.CustomerKey INNER JOIN
						 
                         dbo.DimGeography ON dbo.DimCustomer.GeographyKey =  dbo.DimGeography.GeographyKey
GROUP BY  dbo.DimDate.CalendarYear, dbo.DimGeography.City
HAVING        (dbo.DimDate.CalendarYear = 2012)
ORDER BY Sprzedaz DESC
)
AS min
order by Sprzedaz desc