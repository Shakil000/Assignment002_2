
✅ 1. What is PostgreSQL?

PostgreSQL is an advanced, open-source, relational database management system (RDBMS) known for:
	ACID compliance (reliable transactions)
	Support for complex queries, joins, indexing, and data types
	Extensibility (custom functions, data types)
	It is widely used in web, enterprise, and analytical applications.


✅ 2. What is the purpose of a database schema in PostgreSQL?

A schema in PostgreSQL is like a namespace inside a database. It
	Organizes tables, views, functions, etc.
	Helps avoid name conflicts.
	Allows multiple users or apps to use the same database with separate structures.

✅ 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key:
	Uniquely identifies each row in a table.
	Cannot be NULL.
	Example: ranger_id in a `rangers` table.

Foreign Key:
	Creates a relationship between two tables.
	Refers to a primary key in another table.
	Ensures referential integrity (you can't reference something that doesn't exist).




✅ 4. What is the difference between the `VARCHAR` and `CHAR` data types?

Data Type	Description
CHAR(n)	Fixed-length string. Always stores n characters, padding with spaces if shorter.
VARCHAR(n)	Variable-length string up to n characters. More efficient for text of unpredictable length.


✅ 5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.

The `WHERE` clause filters rows based on a condition.
Example:
SELECT * FROM rangers 
WHERE region = 'Mountain Range';

✅ 6. What are the `LIMIT` and `OFFSET` clauses used for?

LIMIT: Specifies the maximum number of rows to return.
OFFSET: Skips a given number of rows before starting to return rows.
Example:
sql
SELECT * FROM sightings ORDER BY sighting_time DESC LIMIT 5 OFFSET 10;


✅ 7. How can you modify data using `UPDATE` statements?

Use UPDATE to change existing records.
Example:
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

✅ 8. What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?

JOIN is used to combine rows from two or more tables based on a related column.
Types:
	INNER JOIN: Matches only where both tables have matching keys.
	LEFT JOIN: All rows from the left table + matched rows from the right.
	RIGHT JOIN, `FULL JOIN`, etc.

Example:
SELECT r.name, sp.common_name
FROM sightings si
JOIN rangers r ON si.ranger_id = r.ranger_id
JOIN species sp ON si.species_id = sp.species_id;

✅ 9. Explain the `GROUP BY` clause and its role in aggregation operations.

GROUP BY groups rows with the same values into summary rows, often used with aggregate functions.
Example:
SELECT ranger_id, COUNT(*) FROM sightings GROUP BY ranger_id;


✅ 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

COUNT(): Counts rows.
SUM(): Adds values.
AVG(): Computes the average.
Example:
SELECT 
  COUNT(*) AS total_sightings,
  AVG(EXTRACT(HOUR FROM sighting_time)) AS avg_hour
FROM sightings;
