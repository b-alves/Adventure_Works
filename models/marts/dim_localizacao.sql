WITH localizacao AS (
    SELECT * FROM {{ ref('int_vendas_localizacao') }}
)

SELECT 
    localizacao.id_pedido,
    localizacao.id_regiao,
    localizacao.regiao_vendas,
    localizacao.pais
FROM localizacao