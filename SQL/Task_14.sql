
/*
Добавить в таблицу "Задачи" столбец "Дата модификации", 
любое изменение записи должно проставлять значение в это поле.
Реализовать при помощи триггера
*/

/*Добавляем столбец*/
ALTER TABLE Tasks ADD LastUpdate DATE;
GO

/*Перед созаднием триггера проверяем есть ли уже триггер с таким именем и если есть удаляем*/
IF OBJECT_ID ('date_update_tr', 'TR') IS NOT NULL
	DROP TRIGGER date_update_tr;
GO

CREATE TRIGGER date_update_tr
ON Tasks
AFTER INSERT, UPDATE
AS
BEGIN
	
	IF @@ROWCOUNT = 0
		RETURN;
	
	/*
	UPDATE Tasks
	SET Tasks.LastUpdate = GETDATE ()
	FROM inserted
	WHERE Tasks.Task_id = inserted.Task_id;
	*/
	
	UPDATE Tasks
	SET Tasks.LastUpdate = GETDATE ()
	WHERE Tasks.Task_id IN (SELECT Task_id FROM inserted);
END