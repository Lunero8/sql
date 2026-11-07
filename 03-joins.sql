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
    