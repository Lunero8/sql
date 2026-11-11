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