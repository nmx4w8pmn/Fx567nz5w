/*
	ѕри помощи системных представлений (sys.*) получить информацию об 
	использовании индексов вида: »м€ таблицы, »м€ индекса, количество поисков (seek),
	количество сканирований (scan), количество обновлений (updates).
*/

SELECT
		t.name AS TableName,
		i.name AS IndexName,
		SUM (ius.user_seeks) AS SeekCount,
		SUM (ius.user_scans) AS ScanCount,
		SUM (ius.user_updates) AS Updates
FROM
		sys.tables AS t
		JOIN sys.indexes AS i ON t.object_id = i.object_id
		JOIN sys.dm_db_index_usage_stats AS ius ON ius.object_id = t.object_id
GROUP BY
		t.name,
		i.name
ORDER BY
		t.name; 
GO