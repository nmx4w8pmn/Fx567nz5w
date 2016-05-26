
/*Связать таблицы внешними ключами*/

ALTER TABLE Tasks ADD CONSTRAINT FK_Tasks_To_Projects FOREIGN KEY (Project_id) REFERENCES Projects (Project_id);

CREATE TABLE Tasks_Link_Tags
(
Task_id INT NOT NULL,
Tag_id INT NOT NULL

CONSTRAINT FK_Tasks_Link_Tags_To_Tasks FOREIGN KEY (Task_id) REFERENCES Tasks (Task_id),
CONSTRAINT FK_Tasks_Link_Tags_To_Tags FOREIGN KEY (Tag_id) REFERENCES Tags (Tag_id)
);