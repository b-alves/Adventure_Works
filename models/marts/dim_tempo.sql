WITH pedidos AS (
    SELECT DISTINCT data_pedido FROM {{ ref('int_pedidos_vendas') }}
)

SELECT 
    CAST(data_pedido AS TIMESTAMP) AS data_pedido_convertida,
    EXTRACT(YEAR FROM CAST(data_pedido AS TIMESTAMP)) AS ano,
    EXTRACT(MONTH FROM CAST(data_pedido AS TIMESTAMP)) AS mes,
    EXTRACT(DAY FROM CAST(data_pedido AS TIMESTAMP)) AS dia,
    EXTRACT(DAYOFWEEK FROM CAST(data_pedido AS TIMESTAMP)) AS dia_semana
FROM pedidos