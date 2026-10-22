-- SELECT:
    SELECT * FROM table_name; -- select all column
    SELECT cloumn_name FROM table_name;
    SELECT column_1, column_2 FROM table_name;

-- SELECT DISTINCT:
    -- The DISTINCT keyword can be used to return only the distinct values in a column, remove duplicate values from column. Return unique values inside of a column.
    SELECT DISTINCT column_name FROM table;
    SELECT DISTINCT(column_name) FROM table;

-- COUNT:
    -- COUNT function returns the number of input rows that match a specific condition of a query. We can apply COUNT on a specific column or just pass COUNT(*).
    SELECT COUNT(column_name) FROM table_name;
    SELECT COUNT(*) FROM table_name;

    -- COUNT is much more useful when combined with other commands, such as DISTINCT
    SELECT COUNT(DISTINCT amount) FROM payment; -- returns the number of unique payment amounts from the payment table

-- SELECT WHERE:
    -- The WHERE statement allows us to specify conditions on columns for the row to be returned. Conditions are used to filter the rows returned from the SELECT statement.
    -- Comparison Operators: =, >, <, >=, <=, <> or !=
    -- Logical Operators: AND, OR, NOT
    SELECT column_name, column_name2 FROM table_name WHERE conditions;

    SELECT column_name, column_name2
    FROM table_name
    WHERE conditions;

    SELECT names, choice FROM tables
    WHERE names = 'SAM';

    SELECT names, choice FROM tables
    WHERE choice = 'Green';

    SELECT names, choice FROM tables
    WHERE names = 'SAM' AND choice = 'Green';

    SELECT COUNT(*) FROM tables
    WHERE age >= 18 AND country = 'BD';

    SELECT * FROM tables
    WHERE country = 'BD' OR country = 'AUS';

-- ORDER BY:
    -- ORDER BY used to sort rows based on a column value, in either ascending or descending order. Always placed at the end of the main query (after WHERE, GROUP BY, and HAVING), but before LIMIT or OFFSET.
    -- ASC = ascending order
    -- DESC = descending order
    -- blank = ASC by default
    SELECT column_1, column_2 FROM tables
    ORDER BY column_1 ASC/DESC;

    -- ORDER BY with Multiple Columns:
    -- Sorts primarily by the first column. If there are duplicate entries, 
    -- it sorts those ties using the next columns in order.
    SELECT first_name, last_name, department, salary
    FROM employees
    ORDER BY department ASC, salary DESC;

-- LIMIT:
    -- LIMIT allows us to limit the number of rows returned for a query. 
    -- Useful for not wanting to return every single row in a table, but only view the top few rows to get an idea of the table layout. 
    -- LIMIT also becomes useful in combination with ORDER BY
    -- LIMIT goes at the very end of a query request and is the last command to be executed.
    SELECT * FROM payment
    ORDER BY payment_date DESC LIMIT 5; -- 5 most recent payments

    SELECT * FROM payment
    ORDER BY payment_date ASC
    LIMIT 5; -- 5 oldest (earliest) payments

    SELECT * FROM payment
    WHERE amount != 0
    ORDER BY payment_date DESC
    LIMIT 5;

    SELECT * FROM payment
    LIMIT 1;

-- BETWEEN:
    -- BETWEEN operator can be used to match a value against a range of values
    -- value BETWEEN low AND high
    value >= low AND value <= high; -- using comparison operators
    value BETWEEN low AND high; -- usign BETWEEN (low and high inclusive)

    value < low OR value > high;
    value NOT BETWEEN low AND high; -- exclusive of low and high

    -- BETWEEN operator can also be used with dates. 
    -- Data format: ISO 8601 standard format, which is YYYY-MM-DD
    date BETWEEN '2007-01-01' AND '2007-02-01'; -- Starts at 2007-01-01 00:00:00 and ends at 2007-02-01 00:00:00, meaning the entire final day (2007-02-01) is excluded.

    date BETWEEN '2007-01-01 00:00:00' AND '2007-02-01 23:59:59';

    SELECT * FROM payment
    WHERE amount BETWEEN 8 AND 9;

    SELECT * FROM payment
    WHERE amount NOT BETWEEN 0 AND 9
    ORDER BY amount DESC;

    SELECT * FROM payment
    WHERE payment_date BETWEEN '2026-02-01' AND '2026-02-08';

    SELECT * FROM payment
    WHERE payment_date BETWEEN '2026-02-01 00:00:00' AND '2026-02-07 23:59:59';

    SELECT * FROM payment
    WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-16 23:59:59'
    ORDER BY payment_date DESC;

    SELECT * FROM payment
    WHERE payment_date BETWEEN '2026-01-01' AND '2026-01-07 23:59:59.999999'
    ORDER BY payment_date DESC;

-- IN:
    -- IN operator is used to check if a value matches any value in a specified list.
    -- shorthand for multiple OR conditions.
    -- General syntax
    value IN (option_1, option_2,..., option_n)

    SELECT color FROM tables
    WHERE color IN ('red','blue','green');

    SELECT color FROM tables
    WHERE color NOT IN ('red', 'blue', 'green');

    SELECT COUNT(*) FROM payment
    WHERE amount = 0.99 OR amount = 1.98 OR amount = 1.99; -- OR conditions

    SELECT * FROM payment
    WHERE amount IN (0.99, 1.98, 1.99); -- IN conditions

    SELECT * FROM customer
    WHERE first_name IN ('Jared', 'Mary', 'Patricia');

-- LIKE and ILIKE:
    -- used for pattern matching with string data
    -- LIKE: case sensitive
    -- ILIKE: case insensitive
    -- Can use the NOT operator: NOT LIKE, NOT ILIKE

    -- Wildcards:
    -- Percent (%) : matches any sequence of character (zero or more)
    -- Underscore (_) : matches any single character, can be use multiple underscores

    -- Examples 
    'A%'            -- Starts with 'A', can match 'A' alone
    '%A'            -- Ends with 'A', can match 'A' alone
    '%her%'         -- Contains 'her' anywhere in the string (start, middle, end or even if 'her' is the entire string)
    'A_'            -- Exactly 2 characters, starts with 'A'
    '_A'            -- Exactly 2 characters, end with 'A'
    '_A%'           -- Any single character first, followed by 'A', followed by zero or more characters
    'ABC ABC _'     -- Starts with 'ABC ABC ' followed by exactly one any character
    'ABC ABC __'    -- Starts with 'ABC ABC ' followed by exactly two any character

    SELECT * FROM customer
    WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'
    ORDER BY first_name;

    SELECT * FROM customer
    WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%'
    ORDER BY first_name;

    SELECT * FROM customer
    WHERE first_name NOT LIKE 'J%' AND last_name NOT LIKE 'S%'
    ORDER BY first_name;

    SELECT * FROM customer
    WHERE first_name NOT ILIKE 'j%' AND last_name NOT ILIKE 's%'
    ORDER BY first_name;

    SELECT * FROM customer
    WHERE first_name LIKE 'A%'
    ORDER BY last_name;

    SELECT * FROM customer
    WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
    ORDER BY last_name;