-- Timestamps and Extract
    -- Displaying current time information
    -- TIME         : Contains only time
    -- DATE         : Contains only date
    -- TIMESTAMP    : Contains date and time
    -- TIMESTAMPTZ  : Contains date, time, and timezone
    -- Functions and operations:
    -- TIMEZONE, NOW, TIMEOFDAY, CURRENT_TIME, CURRENT_DATE
    SHOW ALL                -- return everything together
    SHOW TIMEZONE           -- Asia/Dhaka
    SELECT NOW()            -- return current date, time with full format: 2026-11-12 02:59:48.700812+06
    SELECT TIMEOFDAY()      -- Thu Nov 12 03:01:05.614288 2026 +06
    SELECT CURRENT_TIME   -- 03:02:49.809088+06:00
    SELECT CURRENT_DATE     -- 2026-11-12

-- Extracting information from a time based data type using:
    EXTRACT()
    AGE()
    TO_CHAR()

-- EXTRACT():
    -- Extract allows to "extract" or obtain a sub-component of a data value-
        YEAR
        MONTH
        DAY
        WEEK
        QUARTER
    
    EXTRACT(YEAR FROM data_col)

    SELECT EXTRACT(YEAR FROM payment_date) FROM payment;
    SELECT EXTRACT(YEAR FROM payment_date) AS myyear FROM payment;
    SELECT EXTRACT(MONTH FROM payment_date) AS pay_month FROM payment;
    SELECT EXTRACT(QUARTER FROM payment_date) AS pay_quarter FROM payment;

-- AGE():
    -- Calculate and returns the current age given a timestamp
    Calculate how old current data is
    AGE(date_col) -- returns: 13 years 1 mon 5 days 01:34:13.003423

    SELECT AGE(payment_date) FROM payment;  -- 19 years 8 mons 26 days 01:34:13.003423

    -- can also compare two specific dates:
    SELECT AGE('2026-11-14', payment_date) FROM payment;
    SELECT AGE('2026-11-14', '2001-05-10'); 

-- TO_CHAR():
    -- General function to convert data types to text
    TO_CHAR(date_col, 'mm-dd-yyyy') 

    SELECT TO_CHAR(payment_date, 'MONTH-YYYY') FROM payment;    -- FEBRUARY -2007
    SELECT TO_CHAR(payment_date, 'MONTHYYYY') FROM payment;     -- FEBRUARY 2007
    SELECT TO_CHAR(payment_date, 'MONTH   YYYY') FROM payment;  -- FEBRUARY    2007
    SELECT TO_CHAR(payment_date, 'MM/DD/YYYY') FROM payment;    -- 02/15/2007
    SELECT TO_CHAR(payment_date, 'MON/DD/YYYY') FROM payment;   -- FEB/15/2007
    SELECT TO_CHAR(payment_date, 'mon/dd/YYYY') FROM payment;   -- feb/15/2007
    SELECT TO_CHAR(payment_date, 'Mon/dd/YYYY') FROM payment;   -- Feb/15/2007

    -- Data Type Formatting Functions
    -- https://www.postgresql.org/docs/12/functions-formatting.html

-- Mathematical Functions:
    -- https://www.postgresql.org/docs/12/functions-math.html
    SELECT rate / replacement_cost FROM product;                -- 0.33288859239492995330
    SELECT ROUND(rate/replacement_cost) FROM product;           -- 0
    SELECT ROUND(rate/replacement_cost, 2) FROM product;        -- 0.33
    SELECT ROUND(rate/replacement_cost, 2)*100 FROM product;    -- 33.00
    
    SELECT 0.1 * cost AS profit FROM product

-- String Functions and Operations:
    -- https://www.postgresql.org/docs/9.1/functions-string.html

    -- PostgreSQL provides a variety of string functions and operators that allow us to edit, combine, and alter text data columns

    SELECT LENGTH(first_name) FROM customer;        -- 5

    -- String concatenation
    SELECT first_name || last_name FROM customer:           -- JaredEly
    SELECT first_name || '' || last_name FROM customer;     -- JaredEly
    SELECT first_name || ' ' || last_name FROM customer;    -- Jared Ely

    SELECT first_name || ' ' || last_name AS full_name FROM customer;

    SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS full_name FROM customer;     -- JARED ELY

    SELECT first_name || last_name || '@gmail.com' FROM customer;   -- JaredEly@gmail.com

    SELECT LEFT(first_name, 1) || LEFT(last_name, 1) || '@gmail.com' AS first_char_mail FROM customer;                      -- JE@gmail.com
    SELECT LOWER(LEFT(first_name, 1)) || LOWER(LEFT(last_name, 1)) || '@gmail.com' AS custom_mail FROM customer;            -- je@gmail.com

-- SubQuery:
    -- Sub Query allows to construct complex queries, essentially performing a query on the results of another query.
    -- The syntax is straightforward and involves two SELECT statements.

    SELECT student, grade FROM test_scores
    WHERE grade > (SELECT AVG(grade) FROM test_scores);

    -- The subquery is performed first since it is inside the parenthesis.
    -- Can also use the IN operator in conjunction with a subquery to check against multiple results returned.
    SELECT student, grade FROM test_scores
    WHERE student IN (SELECT student FROM honor_roll_table);

    SELECT student, grade FROM test_scores
    WHERE student IN (('Name1', 'Name2', 'Name3'));

-- EXISTS():
    -- EXISTS operator is used to test for existence of rows in a subquery.
    -- A subquery is passed in the EXISTS() function to check if any rows are returned with the subquery.

    SELECT column_name FROM table_name
    WHERE EXISTS(SELECT column_name FROM table_name WHERE condition);