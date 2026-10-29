DROP TABLE IF EXISTS cases;
CREATE TABLE cases (
 
  id INTEGER PRIMARY KEY,
  number TEXT NOT NULL UNIQUE,
  client TEXT NOT NULL,
  subject TEXT NOT NULL,
  amount INTEGER,
  filed TEXT
) STRICT;
 
INSERT INTO cases (number, client, subject, amount, filed) VALUES ('2-101/2026', 'ТОО Альфа', 'взыскание долга', 1500000, '2026-01-15');
INSERT INTO cases (number, client, subject, amount, filed) VALUES ('2-102/2026', 'АО Бета', 'расторжение договора', 800000, '2026-02-03');
INSERT INTO cases (number, client, subject, amount, filed) VALUES ('2-103/2026', 'ИП Сапаров', 'защита прав потребителей', 250000, '2026-03-10');
SELECT* FROM cases;
 
 