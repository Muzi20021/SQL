#Æwiczenie 1

SELECT        dbo.DimProduct.EnglishProductName
FROM            dbo.DimProduct INNER JOIN
                         dbo.FactInternetSales ON dbo.DimProduct.ProductKey = dbo.FactInternetSales.ProductKey
GROUP BY dbo.DimProduct.EnglishProductName
ORDER BY dbo.DimProduct.EnglishProductName

#Æwiczenie 2

SELECT        dbo.DimSalesTerritory.SalesTerritoryCountry, dbo.DimGeography.StateProvinceName, SUM(dbo.FactInternetSales.SalesAmount) AS [Wartoœæ sprzeda¿y]
FROM            dbo.DimSalesTerritory INNER JOIN
                         dbo.FactInternetSales ON dbo.DimSalesTerritory.SalesTerritoryKey = dbo.FactInternetSales.SalesTerritoryKey INNER JOIN
                         dbo.DimGeography ON dbo.DimSalesTerritory.SalesTerritoryKey = dbo.DimGeography.SalesTerritoryKey
GROUP BY dbo.DimSalesTerritory.SalesTerritoryCountry, dbo.DimGeography.StateProvinceName
ORDER BY dbo.DimSalesTerritory.SalesTerritoryCountry

#Cwiczenie 3
SELECT        dbo.DimSalesTerritory.SalesTerritoryCountry, dbo.DimGeography.StateProvinceName, SUM(dbo.FactInternetSales.SalesAmount) AS Suma
FROM            dbo.DimSalesTerritory INNER JOIN
                         dbo.FactInternetSales ON dbo.DimSalesTerritory.SalesTerritoryKey = dbo.FactInternetSales.SalesTerritoryKey INNER JOIN
                         dbo.DimGeography ON dbo.DimSalesTerritory.SalesTerritoryKey = dbo.DimGeography.SalesTerritoryKey
GROUP BY ROLLUP (dbo.DimSalesTerritory.SalesTerritoryCountry, dbo.DimGeography.StateProvinceName)

#Cwiczenie 4

SELECT        dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, SUM(dbo.FactInternetSales.SalesAmount) AS Suma
FROM            dbo.DimProductSubcategory INNER JOIN
                         dbo.DimProduct ON dbo.DimProductSubcategory.ProductSubcategoryKey = dbo.DimProduct.ProductSubcategoryKey INNER JOIN
                         dbo.DimProductCategory ON dbo.DimProductSubcategory.ProductCategoryKey = dbo.DimProductCategory.ProductCategoryKey INNER JOIN
                         dbo.FactInternetSales ON dbo.DimProduct.ProductKey = dbo.FactInternetSales.ProductKey INNER JOIN
                         dbo.DimSalesTerritory ON dbo.FactInternetSales.SalesTerritoryKey = dbo.DimSalesTerritory.SalesTerritoryKey
WHERE        (dbo.DimSalesTerritory.SalesTerritoryCountry = N'United States')
GROUP BY dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, dbo.DimSalesTerritory.SalesTerritoryCountry


#Cwiczenie 5

Create VIEW USA_058 AS
SELECT        dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, SUM(dbo.FactInternetSales.SalesAmount) AS Expr1, 
                         dbo.DimSalesTerritory.SalesTerritoryCountry
FROM            dbo.DimProductSubcategory INNER JOIN
                         dbo.DimProduct ON dbo.DimProductSubcategory.ProductSubcategoryKey = dbo.DimProduct.ProductSubcategoryKey INNER JOIN
                         dbo.DimProductCategory ON dbo.DimProductSubcategory.ProductCategoryKey = dbo.DimProductCategory.ProductCategoryKey INNER JOIN
                         dbo.FactInternetSales ON dbo.DimProduct.ProductKey = dbo.FactInternetSales.ProductKey INNER JOIN
                         dbo.DimSalesTerritory ON dbo.FactInternetSales.SalesTerritoryKey = dbo.DimSalesTerritory.SalesTerritoryKey
WHERE        (dbo.DimSalesTerritory.SalesTerritoryCountry = N'United States')
GROUP BY dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, dbo.DimSalesTerritory.SalesTerritoryCountry

SELECT        EnglishProductCategoryName, EnglishProductSubcategoryName, EnglishProductName, SUM(Expr1) AS Suma
FROM            USA_058
GROUP BY ROLLUP (EnglishProductCategoryName, EnglishProductSubcategoryName, EnglishProductName)

#Cwiczenie 6

SELECT        dbo.DimDate.WeekNumberOfYear, dbo.FactCallCenter.WageType, dbo.FactCallCenter.Shift, SUM(dbo.FactCallCenter.Orders) AS LiczbaZamowien
FROM            dbo.FactCallCenter INNER JOIN
                         dbo.DimDate ON dbo.FactCallCenter.DateKey = dbo.DimDate.DateKey
GROUP BY dbo.DimDate.WeekNumberOfYear, dbo.FactCallCenter.WageType, dbo.FactCallCenter.Shift
HAVING        (dbo.DimDate.WeekNumberOfYear = 19) OR
                         (dbo.DimDate.WeekNumberOfYear = 20)


#Cwiczenie 7

Create view cw_7_058 as 
SELECT        dbo.DimDate.WeekNumberOfYear, dbo.FactCallCenter.WageType, dbo.FactCallCenter.Shift, SUM(dbo.FactCallCenter.Orders) AS LiczbaZamowien
FROM            dbo.FactCallCenter INNER JOIN
                         dbo.DimDate ON dbo.FactCallCenter.DateKey = dbo.DimDate.DateKey
GROUP BY dbo.DimDate.WeekNumberOfYear, dbo.FactCallCenter.WageType, dbo.FactCallCenter.Shift
HAVING        (dbo.DimDate.WeekNumberOfYear = 19) OR
                         (dbo.DimDate.WeekNumberOfYear = 20)


SELECT        WeekNumberOfYear, WageType, Shift,Sum( LiczbaZamowien) as Liczbazamowien
FROM            cw_7_058
GROUP BY Rollup( WeekNumberOfYear, WageType, Shift)


#Cwiczenie 8

SELECT        WeekNumberOfYear, WageType, Shift,Sum( LiczbaZamowien) as Liczbazamowien
FROM            cw_7_058
GROUP BY Cube( WeekNumberOfYear, WageType, Shift)

#Cwiczenie 9

SELECT        WeekNumberOfYear, WageType, Shift,Sum( LiczbaZamowien) as Liczbazamowien
FROM            cw_7_058
GROUP BY Grouping sets ( (), WeekNumberOfYear, (WageType, Shift))

#Cwiczenie 10 

SELECT        dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, dbo.DimProduct.Weight
FROM            dbo.DimProductSubcategory INNER JOIN
                         dbo.DimProduct ON dbo.DimProductSubcategory.ProductSubcategoryKey = dbo.DimProduct.ProductSubcategoryKey INNER JOIN
                         dbo.DimProductCategory ON dbo.DimProductSubcategory.ProductCategoryKey = dbo.DimProductCategory.ProductCategoryKey
WHERE        (dbo.DimProductCategory.EnglishProductCategoryName = N'Components') AND (dbo.DimProductSubcategory.EnglishProductSubcategoryName = N'Wheels')
GROUP BY Rollup( dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, dbo.DimProduct.Weight)



#Æwiczenie 11
Create view cw_11_058 as 
SELECT dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, SUM(dbo.DimProduct.Weight) AS Weight
FROM     dbo.DimProductCategory INNER JOIN
                  dbo.DimProductSubcategory ON dbo.DimProductCategory.ProductCategoryKey = dbo.DimProductSubcategory.ProductCategoryKey INNER JOIN
                  dbo.DimProduct ON dbo.DimProductSubcategory.ProductSubcategoryKey = dbo.DimProduct.ProductSubcategoryKey
GROUP BY dbo.DimProductCategory.EnglishProductCategoryName, dbo.DimProductSubcategory.EnglishProductSubcategoryName, dbo.DimProduct.EnglishProductName, dbo.DimProduct.Weight
HAVING (dbo.DimProductCategory.EnglishProductCategoryName = 'Components' and dbo.DimProductSubcategory.EnglishProductSubcategoryName = N'Wheels')

SELECT EnglishProductCategoryName, EnglishProductSubcategoryName, EnglishProductName, 
GROUPING_ID (EnglishProductCategoryName, EnglishProductSubcategoryName, EnglishProductName) AS 'Group',
SUM (Weight) as Weight
FROM     cw_11_047
GROUP by Rollup (EnglishProductCategoryName, EnglishProductSubcategoryName, EnglishProductName)


#Æwiczenie 12

Drop View cw_11_058, cw_7_058, USA_058 
