
/*�������� ������ ���������� ��� ������ � ��� �������, � ������� ��� ���������*/

SELECT Tasks.Name AS TaskName, Projects.Name AS ProjectName FROM Tasks LEFT JOIN Projects ON Tasks.Project_id = Projects.Project_id;