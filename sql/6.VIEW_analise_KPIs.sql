-- Criação VIEW para análise dos KPIs

CREATE OR ALTER VIEW VENDAS_INTERNET AS
SELECT
SalesOrderNumber AS 'Nº PEDIDO',
FORMAT(OrderDate,'dd/MM/yyyy') AS 'DATA',
YEAR(OrderDate) AS 'ANO',
EnglishProductCategoryName AS 'CATEGORIA PRODUTO',
FirstName + ' ' + LastName AS 'NOME CLIENTE',
REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino')  AS 'GÊNERO',
SalesTerritoryCountry AS 'PAÍS',
OrderQuantity AS 'QTD. VENDIDA',
ROUND(TotalProductCost, 2) AS 'CUSTO VENDA',
ROUND(SalesAmount,2) AS 'RECEITA VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
			INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
				INNER JOIN DimSalesTerritory dst ON fis.SalesTerritoryKey = dst.SalesTerritoryKey

