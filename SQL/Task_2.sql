
/*
Выбрать типы данных и создать таблицы для следующей бизнесс-задачи. Есть система
управления проектами. У проекта есть имя. В каждом проекте может быть множество задач.
Каждая задача имеет имя, описание, признак, закрыта ли она, крайний срок (дата) и список тегов. каждый тег имеет имя.
*/

CREATE TABLE Projects
(
	Project_id int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	Name nvarchar (400) NOT NULL
);

CREATE TABLE Tasks
(
	Task_id int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	Project_id int NOT NULL,
	Name nvarchar (400) NOT NULL,
	Description nvarchar (MAX),
	IsClose bit  NOT NULL DEFAULT 0,
	Deadline date,
);

CREATE TABLE Tags
(
	Tag_id int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	Name nvarchar (400) NOT NULL
);