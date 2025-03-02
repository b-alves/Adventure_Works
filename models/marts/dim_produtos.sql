WITH produto AS (
    SELECT * FROM {{ ref('int_vendas_prep_produtos') }}
)

SELECT 
    produto.id_produto,
    produto.nome_produto,
    produto.subcategoria_produto,
    produto.categoria_produto
FROM produto
