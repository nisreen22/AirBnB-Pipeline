-- models/marts/dim_date.sql

WITH date_spine AS (

    SELECT
        DATEADD(
            DAY,
            SEQ4(),
            '2008-01-01'
        ) AS date_day
    FROM TABLE(
        GENERATOR(ROWCOUNT => 5845)  -- ~2008 → 2023
    )

),

final AS (

    SELECT

        -- Surrogate Key
        TO_NUMBER(TO_CHAR(date_day, 'YYYYMMDD')) AS Date_SK,

        date_day AS date,

        LPAD(DAY(date_day), 2, '0') AS day,

        CASE
            WHEN DAY(date_day) IN (11,12,13) THEN 'th'
            WHEN DAY(date_day) % 10 = 1 THEN 'st'
            WHEN DAY(date_day) % 10 = 2 THEN 'nd'
            WHEN DAY(date_day) % 10 = 3 THEN 'rd'
            ELSE 'th'
        END AS day_suffix,

        DAYNAME(date_day) AS day_of_week,

        DAYOFYEAR(date_day) AS day_of_year,

        WEEKOFYEAR(date_day) AS week_of_year,

        MONTH(date_day) AS month,

        MONTHNAME(date_day) AS month_name,

        QUARTER(date_day) AS quarter,

        CASE QUARTER(date_day)
            WHEN 1 THEN 'First'
            WHEN 2 THEN 'Second'
            WHEN 3 THEN 'Third'
            WHEN 4 THEN 'Fourth'
        END AS quarter_name,

        YEAR(date_day) AS year,

        TO_VARCHAR(date_day, 'MM/DD/YYYY') AS standard_date,

        CASE
            WHEN MONTH(date_day)=1 AND DAY(date_day)=1 THEN 'New Year''s Day'
            WHEN MONTH(date_day)=2 AND DAY(date_day)=14 THEN 'Valentine''s Day'
            WHEN MONTH(date_day)=7 AND DAY(date_day)=4 THEN 'Independence Day'
            WHEN MONTH(date_day)=10 AND DAY(date_day)=31 THEN 'Halloween'
            WHEN MONTH(date_day)=12 AND DAY(date_day)=25 THEN 'Christmas Day'
            ELSE NULL
        END AS holiday_name_en

    FROM date_spine

)

SELECT * FROM final