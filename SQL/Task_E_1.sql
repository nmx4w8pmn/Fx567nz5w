/*
	При помощи системных представлений (sys.*) получить все индексы в базе данных
	и информацию о них в следующем виде: Имя таблицы, на которой висит индекс;
	имя индекса; количество строк в индексе, общий размер в мегабайтах,
	используемый размер в мегабайтах, неиспользуемый размер в мегабайтах.
*/

SELECT
		t.name AS TableName,
		i.name AS IndexName,
		p.rows AS RowsCount,
		8 * SUM (a.total_pages)  AS 'TotalIndexSize (KB)',
		8 * SUM (a.used_pages) AS 'IndexUsedSpace (KB)',
		8 * (SUM (a.total_pages) - SUM (a.used_pages)) AS 'IndexUnusedSpace (KB)'
		
FROM
		sys.tables AS t
		JOIN sys.indexes AS i ON t.object_id = i.object_id
		JOIN sys.partitions AS p ON p.object_id = i.object_id AND p.index_id = i.index_id
		JOIN sys.allocation_units AS a ON a.container_id = p.partition_id
GROUP BY
		t.name,
		i.name,
		p.rows;
GO