WITH salesreason AS (
    SELECT * FROM {{ ref('stg_snowflake__salesreason') }}
),
order_reason AS (
    SELECT * FROM {{ ref('stg_snowflake__salesorderheadersalesreason') }}
),
joined AS (
    SELECT 
        order_reason.salesorderid AS id_pedido,
        salesreason.name AS motivo_venda
    FROM order_reason
    LEFT JOIN salesreason ON order_reason.salesreasonid = salesreason.salesreasonid
)

SELECT * FROM joined