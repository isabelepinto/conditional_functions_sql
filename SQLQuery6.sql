/*
Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa
consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo.
Atenção: lembre-se que existem lojas que foram fechadas.
*/

SELECT
	StoreKey,
	StoreName,
	DATEDIFF(DAY,OpenDate,GETDATE()) AS 'Dias em atividade'
FROM
	DimStore
WHERE CloseDate IS NULL
ORDER BY DATEDIFF(DAY,OpenDate,GETDATE()) DESC