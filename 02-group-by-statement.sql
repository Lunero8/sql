-- Aggregate Functions:
    -- Aggregate functions used to take multiple inputs and return a single output.
    -- Aggregate function calls happen only in the SELECT clause or HAVING clause. 
    -- Most common Aggregate Functions:
        -- AVG()    - returns average value, return a floating point value many decimal places e.g.: 2.342418...
        -- COUNT()  - returns number of values
        -- MAX()    - returns maximum value
        -- MIN()    - returns minimum value
        -- SUM()    - returns the sum of all values

    SELECT MIN(balance) FROM account;                   -- return the minimum from balance column 
    SELECT MAX(balance) FROM account:                   -- return the maximum from balance column
    SELECT MIN(balance), MAX(balance) FROM account;     -- works
    SELECT COUNT(*) FROM account;
    SELECT AVG(balace) FROM account;                    -- return the average value of whole balance column
    SELECT ROUND(AVG(balance),2) FROM account;          -- return with 2 number after decimal e.g.: 2.00
    SELECT SUM(balance) FROM account;                   -- return sum of whole balance column

-- GROUP BY:
    -- GROUP BY allows us to aggregate columns per some category.
    SELECT category_column, AGG(data_column) FROM tables
    GROUP BY category_column;

    SELECT category_column, AGG(data_column) FROM tables
    WHERE category_column != 'A'
    GROUP BY category_column;

    SELECT company, division, SUM(sales) FROM finance_table
    FROM finance_table
    GROUP BY company, division; 

    SELECT company, division, SUM(sales) FROM finance_table
    FROM finance_table
    WHERE division IN('marketing', 'transport')
    GROUP BY company, division;

    SELECT company, SUM(sales)
    FROM finance_table
    GROUP BY company
    ORDER BY SUM(sales)
    LIMIT 5;

    SELECT SUM(amount) FROM payment
    GROUP BY customer_id;

    SELECT customer_id, SUM(amount) FROM payment
    GROUP BY customer_id
    ORDER BY SUM(amount) DESC
    LIMIT 5;

    SELECT customer_id, COUNT(amount) FROM payment
    GROUP BY customer_id
    ORDER BY COUNT(amount) DESC;

    -- a customer purchase from every distinct staff total amount
    SELECT customer_id, staff_id, SUM(amount) from payment
    GROUP BY customer_id, staff_id
    ORDER BY customer_id;

    SELECT staff_id, customer_id, SUM(amount) from payment
    GROUP BY customer_id, staff_id
    ORDER BY staff_id, customer_id;

    -- total distinct staff uses per customer
    SELECT customer_id, COUNT(DISTINCT staff_id) FROM payment
    GROUP BY customer_id
    ORDER BY customer_id;

    -- a staff total serve customer count
    SELECT staff_id, COUNT(customer_id) FROM payment
    GROUP BY staff_id;

-- DATE:
    -- DATE used to convert time-stamp to date(0000-00-00 00:00:00.000000 to 0000-00-00)

    SELECT DATE(payment_date) FROM payment;

    -- order per day
    SELECT DATE(payment_date), COUNT(*) FROM payment
    GROUP BY DATE(payment_date)
    ORDER BY DATE(payment_date);

    -- per day total sales
    SELECT DATE(payment_date), SUM(amount) FROM payment
    GROUP BY DATE(payment_date)
    ORDER BY DATE(payment_date);

    SELECT DATE(payment_date), SUM(amount) FROM payment
    WHERE DATE(payment_date) != '2007-02-14'
    GROUP BY DATE(payment_date)
    ORDER BY DATE(payment_date);

-- HAVING:
    -- HAVING clause allows us to filter after an aggregation has already taken place.
    -- HAVING allows us to use the aggregate result as a filter along with a GROUP BY 

    SELECT company, SUM(sales) FROM finance_table
    WHERE company != 'GOOGLE'
    GROUP BY company
    HAVING SUM(sales)>1000

    SELECT customer_id, SUM(amount) FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 100 
    ORDER BY customer_id;

    SELECT customer_id, COUNT(amount) FROM payment
    GROUP BY customer_id
    HAVING COUNT(amount) > 30
    ORDER BY customer_id;

    SELECT store_id, COUNT(customer_id) FROM customer
    GROUP BY store_id
    HAVING COUNT(customer_id) > 300
    ORDER BY store_id;

    SELECT store_id, COUNT(*) FROM customer
    GROUP BY store_id
    HAVING COUNT(customer_id) > 300 ;