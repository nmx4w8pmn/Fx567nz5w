
/*��������� ���������� ����� ��� ������� ����� ����������*/

SELECT Tasks.Deadline, COUNT(*) AS TasksPerDate FROM Tasks GROUP BY Tasks.Deadline;