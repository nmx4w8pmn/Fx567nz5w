
/*Создать проект с именем "Интенсив", создать задачу "Изучение sql", 
поставить крайний срок "текущая дата + 3 дня"*/

INSERT INTO Projects (Name) 
VALUES 
		('Intensive');

INSERT INTO Tasks (Project_id, Name, Deadline)
VALUES
		(1, 'Learning_SQL', DATEADD (DAY, +3, GETDATE()));