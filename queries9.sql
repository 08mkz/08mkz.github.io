	SELECT cases.number, cases.client, lawyers.name
	FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id
	
	SELECT cases.number, lawyers.name FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id
	WHERE lawyers.name = 'Мария Ким';
	
	SELECT cases.number, lawyers.name FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id
	WHERE cases.status = 'в работе' ORDER BY lawyers.name;
	
	SELECT COUNT (*) FROM cases
	
	SELECT COUNT (*) FROM cases WHERE status = 'в работе'
	
	SELECT SUM (amount) FROM cases WHERE client = 'ТОО Альфа'
	
	SELECT AVG (amount) from cases;
	
	SELECT MAX (amount), MIN(amount) FROM cases;
	
	SELECT MAX(amount), MIN(amount) FROM cases;
	
	SELECT court, SUM(amount) FROM cases GROUP BY SUM(amount) DESC;
	
	SELECT lawyers.name, COUNT(*) FROM cases
	JOIN lawyers ON cases.lawyer_id = lawyer_id GROUP BY lawyers.name
	
	 SELECT client, COUNT (*) FROM cases GROUP BY client
	 
	 