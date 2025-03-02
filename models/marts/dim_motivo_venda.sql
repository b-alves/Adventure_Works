WITH motivo_venda AS (
    SELECT * FROM {{ ref('int_motivo_venda') }}
)

SELECT 
    id_pedido,
    motivo_venda
FROM motivo_venda