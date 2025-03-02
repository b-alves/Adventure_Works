WITH clientes AS (
    SELECT * FROM {{ ref('int_clientes') }}
)

SELECT 
    id_cliente,
    nome_cliente
FROM clientes