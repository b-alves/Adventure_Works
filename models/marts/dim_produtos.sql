WITH produtos AS (
    SELECT * FROM {{ ref('int_produtos') }}
)

SELECT 
    id_produto,
    nome_produto,
    subcategoria,
    categoria
FROM produtos