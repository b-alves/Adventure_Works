WITH tempo AS (
    SELECT * FROM {{ ref('int_vendas_tempo') }}
)

SELECT 
    tempo.id_pedido,
    tempo.data_pedido,
    tempo.ano,
    tempo.mes,
    tempo.dia,
    tempo.dia_semana
FROM tempo