/*
Добавить имена тех проектов имен которых либо не существует в таблице Tasks 
либо они существуют но индекс не соответствует индексу проекта "список проектов"
*/

IF NOT EXISTS (SELECT Name FROM Projects WHERE Name = 'Projects_List')
BEGIN
	INSERT INTO Projects (Name) VALUES ('Projects_List');
END

DECLARE @Projects_List_id INT;
SELECT @Projects_List_id = Project_id FROM Projects WHERE Name = 'Projects_List';

INSERT INTO Tasks (Project_id, Name)
	   SELECT @Projects_List_id, p.Name 
	   FROM Projects p
	   WHERE p.Name NOT IN
			 (SELECT Name 
			FROM Tasks t
			  WHERE t.Project_id = @Projects_List_id);