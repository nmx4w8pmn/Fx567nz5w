
/*��������� ����������� �� ���� "������� ����" � ������� ����� - ����������� �������� �� ����� ���� ������ ������� ����*/

ALTER TABLE Tasks ADD CONSTRAINT chk_dateValid CHECK (Deadline >= GETDATE ());