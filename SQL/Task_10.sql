
/*������� ������ � ������ "��������", ������� ������ "�������� sql", 
��������� ������� ���� "������� ���� + 3 ���"*/

INSERT INTO Projects (Name) 
VALUES 
		('Intensive');

INSERT INTO Tasks (Project_id, Name, Deadline)
VALUES
		(1, 'Learning_SQL', DATEADD (DAY, +3, GETDATE()));