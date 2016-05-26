
/*Посчитать количество задач для каждого срока исполнения*/

SELECT Tasks.Deadline, COUNT(*) AS TasksPerDate FROM Tasks GROUP BY Tasks.Deadline;