-- AS:
    -- AS clause allows us to create an "alias" for a column or result.
    -- The AS operator gets executed at the very end of a query, meaning that we can not use the ALIAS inside a WHERE operator. Can be used only in SELECT statement.

    SELECT column AS new_name
    FROM tables;

    SELECT SUM(column) AS new_name
    FROM tables;

    SELECT customer_id 
    FROM payment;

    SELECT amount AS rental_price       -- change column name 'amount' to 'rental_price' on output
    FROM payment;

    SELECT SUM(amount) AS revenue 
    FROM payment;

    SELECT COUNT(amount) AS num_transections	 
    FROM payment;

    SELECT customer_id AS customer, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 100;

-- INNER JOIN:
    -- INNER JOIN will result with the set of records that match in both tables.
    -- table order won't matter in an INNER JOIN
    -- JOIN without the INNER, PostgreSQL will treat it as an INNER JOIN
    SELECT * FROM tablesA
    INNER JOIN tablesB 
    ON tablesA.col_match = tablesB.col_match

    SELECT * FROM registrations
    INNER JOIN logins
    ON registrations.name = logins.name

    SELECT reg_id, logins.name, log_id FROM registrations
    INNER JOIN logins
    ON registrations.name = logins.name

    SELECT  DISTINCT customer.customer_id, email FROM payment
    INNER JOIN customer
    ON payment.customer_id = customer.customer_id
    ORDER BY customer_id;

-- FULL OUTER JOIN:
    -- Returns all records from both tables (combines matched rows, plus unmatched rows from both sides).
    -- If a row doesn't find a partner in the other table, SQL just leaves those missing spots blank (NULL).
    SELECT * FROM tablesA
    FULL OUTER JOIN tablesB
    ON tablesA.col_match = tablesB.col_match

    SELECT * FROM registrations
    FULL OUTER JOIN logins
    ON registrations.name = logins.name;

    -- FULL OUTER JOIN with WHERE statement (get rows not found in both tables)
    SELECT * FROM tablesA
    FULL OUTER JOIN tablesB
    ON tablesA.col_match = tablesB.col_match
    WHERE tablesA.id IS null OR tablesB.id IS null;

    SELECT * FROM customer 
    FULL OUTER JOIN payment
    ON customer.customer_id = payment.customer_id

    SELECT * FROM customer 
    FULL OUTER JOIN payment
    ON customer.customer_id = payment.customer_id
    WHERE customer.customer_id IS null OR payment.payment_id IS null;

-- LEFT OUTER JOIN: or (LEFT JOIN)
    -- A LEFT OUTER JOIN results in the set of records that are in the left table, if there is no match with the right tabel, the result are null.
    -- Return everything from first table, and return rows that matched with first table from second table. And empty are fill with null.
    SELECT * FROM tablesA
    LEFT OUTER JOIN tablesB
    ON tablesA.col_match = tablesB.col_match

    SELECT * FROM registrations
    LEFT OUTER JOIN logins
    ON registrations.name = logins.name

    -- LEFT OUTER JOIN with WHERE statement (get rows unique to left or first table)
    SELECT * FROM tablesA
    LEFT OUTER JOIN tablesB
    ON tablesA.col_match = tablesB.col_match
    WHERE tablesB.id IS null;

    SELECT * FROM registrations
    LEFT OUTER JOIN logins
    ON registrations.name = logins.name
    WHERE logins.log_id IS null;