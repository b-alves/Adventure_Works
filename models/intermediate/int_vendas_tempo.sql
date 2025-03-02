WITH 
    salesorderheader AS (
        SELECT 
            salesorderid,
            TRY_CAST(orderdate AS DATE) AS orderdate,
            EXTRACT(YEAR FROM TRY_CAST(orderdate AS DATE)) AS ano,
            EXTRACT(MONTH FROM TRY_CAST(orderdate AS DATE)) AS mes,
            EXTRACT(DAY FROM TRY_CAST(orderdate AS DATE)) AS dia,
            EXTRACT(DAYOFWEEK FROM TRY_CAST(orderdate AS DATE)) AS dia_semana
        FROM {{ ref('stg_snowflake__salesorderheader') }}
    )

SELECT * FROM salesorderheader
