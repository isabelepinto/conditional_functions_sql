/*
O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O
percentual aplicado deverá ser de:
Economy -> 5%
Regular -> 7%
Deluxe -> 9%
a) Faça uma consulta à tabela DimProduct que retorne as seguintes colunas: ProductKey,
ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com
desconto.
b) Faça uma adaptação no código para que os % de desconto de 5%, 7% e 9% sejam facilmente
modificados (dica: utilize variáveis).
*/

DECLARE 
	@desconto_economy FLOAT = 0.05,
	@desconto_regular FLOAT = 0.07,
	@desconto_deluxe FLOAT = 0.09

SELECT
	ProductKey,
	ProductName,
	UnitPrice,
	ClassName,
	CASE
		WHEN ClassName = 'Economy' THEN FORMAT(@desconto_economy, '0%')
		WHEN ClassName = 'Regular' THEN FORMAT(@desconto_regular, '0%')
		WHEN ClassName = 'Deluxe' THEN FORMAT(@desconto_deluxe, '0%')
	END AS 'Desconto',
	CASE
		WHEN ClassName = 'Economy' THEN FORMAT((1-@desconto_economy) * UnitPrice, 'C', 'en-US')
		WHEN ClassName = 'Regular' THEN FORMAT((1-@desconto_regular) * UnitPrice, 'C', 'en-US')
		WHEN ClassName = 'Deluxe' THEN FORMAT((1-@desconto_deluxe) * UnitPrice, 'C', 'en-US')
	END AS 'UnitPrice com Desconto'
FROM
	DimProduct