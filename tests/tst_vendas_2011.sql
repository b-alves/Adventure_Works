WITH vendas_em_2011 AS (
    SELECT SUM(valor_bruto) AS soma_total_bruto
    FROM {{ ref('fact_vendas') }}
    WHERE EXTRACT(YEAR FROM CAST(data_pedido AS TIMESTAMP)) = 2011
)

SELECT soma_total_bruto
FROM vendas_em_2011
WHERE soma_total_bruto NOT BETWEEN 12646112.15 AND 12646112.17