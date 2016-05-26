
/*
�������� � ������� "������" ������� "���� �����������", 
����� ��������� ������ ������ ����������� �������� � ��� ����.
����������� ��� ������ ��������
*/

/*��������� �������*/
ALTER TABLE Tasks ADD LastUpdate DATE;
GO

/*����� ��������� �������� ��������� ���� �� ��� ������� � ����� ������ � ���� ���� �������*/
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