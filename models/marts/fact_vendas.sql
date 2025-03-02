WITH fct_vendas AS (
    SELECT *
    FROM {{ ref('int_pedidos_vendas') }}
)

SELECT *
FROM fct_vendas