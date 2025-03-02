WITH 
    salesorderheader AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderheader') }}
    ),

    salesorderheadersalesreason AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderheadersalesreason') }}
    ),

    salesreason AS (
        SELECT * FROM {{ ref('stg_snowflake__salesreason') }}
    ),

    joined AS (
        SELECT 
            salesorderheader.salesorderid,
            salesreason.salesreasonid,
            salesreason.name AS motivo_venda
        FROM salesorderheadersalesreason
        JOIN salesorderheader 
            ON salesorderheadersalesreason.salesorderid = salesorderheader.salesorderid
        JOIN salesreason 
            ON salesorderheadersalesreason.salesreasonid = salesreason.salesreasonid
    )

SELECT * FROM joined
