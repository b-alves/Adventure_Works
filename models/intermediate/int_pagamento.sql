WITH pedidos AS (
    SELECT * FROM {{ ref('stg_snowflake__salesorderheader') }}
),
cartao AS (
    SELECT * FROM {{ ref('stg_snowflake__creditcard') }}
),
joined AS (
    SELECT 
        pedidos.salesorderid AS id_pedido,
        cartao.cardtype AS tipo_cartao
    FROM pedidos
    LEFT JOIN cartao ON pedidos.creditcardid = cartao.creditcardid
)

SELECT * FROM joined