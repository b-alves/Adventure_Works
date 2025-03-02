WITH cliente AS (
    SELECT * FROM {{ ref('stg_snowflake__customer') }}
),

pessoa AS (
    SELECT * FROM {{ ref('stg_snowflake__person') }}
),

joined AS (
    SELECT 
        cliente.customerid AS id_cliente,
        COALESCE(pessoa.firstname || ' ' || pessoa.lastname, 'Cliente Desconhecido') AS nome_cliente,
        cliente.territoryid AS id_territorio
    FROM cliente
    LEFT JOIN pessoa ON cliente.personid = pessoa.businessentityid
)

SELECT * FROM joined