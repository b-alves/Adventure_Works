WITH salesperson AS (
    SELECT 
        BUSINESSENTITYID AS ID_VENDEDOR,
        TERRITORYID AS ID_TERRITORIO,
        SALESQUOTA AS META_VENDAS,
        BONUS AS BONUS_RECEBIDO,
        COMMISSIONPCT AS PERCENTUAL_COMISSAO
    FROM {{ source('snowflake', 'salesperson') }}
)

SELECT * FROM salesperson