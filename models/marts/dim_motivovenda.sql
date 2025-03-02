WITH motivo AS (
    SELECT * FROM {{ ref('int_vendas_motivovenda') }}
)

SELECT 
    motivo.id_pedido,
    motivo.id_motivo_venda,
    motivo.motivo_venda
FROM motivo