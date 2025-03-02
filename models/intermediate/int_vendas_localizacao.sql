WITH 
    salesorderheader AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderheader') }}
    ),

    salesterritory AS (
        SELECT * FROM {{ ref('stg_snowflake__salesterritory') }}
    ),

    joined AS (
        SELECT 
            salesorderheader.salesorderid AS id_pedido,
            salesterritory.territoryid AS id_regiao,
            salesterritory.name AS regiao_vendas,
            salesterritory.countryregioncode AS pais
        FROM salesorderheader
        LEFT JOIN salesterritory 
            ON salesorderheader.territoryid = salesterritory.territoryid
    )

SELECT * FROM joined