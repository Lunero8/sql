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