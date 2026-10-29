DROP TABLE IF EXISTS cases;
DROP TABLE IF EXISTS lawyers;
 
CREATE TABLE lawyers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT
) STRICT;
 
INSERT INTO lawyers (name, city) VALUES ('Айгерим Касымова', 'Алматы');
INSERT INTO lawyers (name, city) VALUES ('Данияр Ермеков', 'Астана');
INSERT INTO lawyers (name, city) VALUES ('Мария Ким', 'Караганда');
 
CREATE TABLE cases (
  id INTEGER PRIMARY KEY,
  number TEXT NOT NULL UNIQUE,
  client TEXT NOT NULL,
  subject TEXT NOT NULL,
  amount INTEGER,
  filed TEXT,
  court TEXT,
  status TEXT,
  lawyer_id INTEGER REFERENCES lawyers(id)
) STRICT;
 
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-101/2026', 'ТОО Альфа', 'взыскание долга', 1500000, '2026-01-15', 'Алматы', 'выиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-102/2026', 'АО Бета', 'расторжение договора', 800000, '2026-02-03', 'Астана', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-103/2026', 'ИП Сапаров', 'защита прав потребителей', 250000, '2026-03-10', 'Алматы', 'выиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-104/2026', 'ТОО Альфа', 'взыскание неустойки', 640000, '2026-03-22', 'Алматы', 'проиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-105/2026', 'ТОО Гамма Строй', 'взыскание долга', 4200000, '2026-04-05', 'Караганда', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-106/2026', 'ИП Ахметова', 'трудовой спор', 380000, '2026-04-18', 'Астана', 'выиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-107/2026', 'АО Бета', 'возмещение ущерба', 2750000, '2026-05-02', 'Астана', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-108/2026', 'ТОО Альфа', 'взыскание долга', 12000000, '2026-05-20', 'Алматы', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-109/2026', 'ИП Нурланов', 'защита прав потребителей', 150000, '2026-06-11', 'Шымкент', 'проиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-110/2026', 'ТОО Омега', 'признание сделки недействительной', 5600000, '2026-06-29', 'Алматы', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-111/2026', 'АО Дельта Логистик', 'взыскание неустойки', 920000, '2026-07-14', 'Караганда', 'выиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-112/2026', 'ИП Сапаров', 'взыскание долга', 470000, '2026-08-03', 'Шымкент', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-113/2026', 'ТОО Гамма Строй', 'расторжение договора', 1100000, '2026-08-27', 'Караганда', 'проиграно');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-114/2026', 'ИП Ахметова', 'возмещение ущерба', 300000, '2026-09-15', 'Астана', 'в работе');
INSERT INTO cases (number, client, subject, amount, filed, court, status) VALUES ('2-115/2026', 'ТОО Омега', 'взыскание долга', 2300000, '2026-10-01', 'Алматы', 'в работе');
 
UPDATE cases SET lawyer_id = 1 WHERE court = 'Алматы';
UPDATE cases SET lawyer_id = 2 WHERE court = 'Астана';
UPDATE cases SET lawyer_id = 3 WHERE court = 'Караганда' OR court = 'Шымкент';
 
SELECT * FROM cases;