/*
Você ficou responsável pelo controle de produtos da empresa e deverá fazer uma análise da
quantidade de produtos por Marca.
A divisão das marcas em categorias deverá ser a seguinte:
CATEGORIA A: Mais de 500 produtos
CATEGORIA B: Entre 100 e 500 produtos
CATEGORIA C: Menos de 100 produtos
Faça uma consulta à tabela DimProduct e retorne uma tabela com um agrupamento de Total de
Produtos por Marca, além da coluna de Categoria, conforme a regra acima.
*/


SELECT
	BrandName,
	COUNT(ProductKey) AS 'Total de Produtos',
	CASE
		WHEN COUNT(ProductKey) > 500 THEN 'Categoria A'
		WHEN COUNT(ProductKey) >= 100 THEN 'Categoria B'
		ELSE 'Categoria C'
	END AS 'Categoria'
FROM
	DimProduct
WHERE Status = 'On'
GROUP BY BrandName
ORDER BY COUNT(ProductKey) DESC
