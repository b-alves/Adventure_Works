WITH cliente AS (
    SELECT * FROM {{ ref('int_clientes') }}
)

SELECT 
    cliente.id_cliente,
    cliente.nome_cliente
FROM cliente