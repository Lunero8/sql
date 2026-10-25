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
    