
/*Поставить ограничение на поле "крайний срок" в таблице задач - вставляемое значение не может быть меньше текущей даты*/

ALTER TABLE Tasks ADD CONSTRAINT chk_dateValid CHECK (Deadline >= GETDATE ());