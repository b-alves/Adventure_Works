WITH metricas AS (
    SELECT * FROM {{ ref('int_pedidos_vendas') }}
)

SELECT 
    metricas.id_pedido,
    metricas.id_cliente,
    metricas.data_pedido,
    metricas.quantidade_produtos_distintos,
    metricas.quantidade_total_vendida,
    metricas.valor_bruto,
    metricas.valor_liquido,
    metricas.ticket_medio
FROM metricas;
