WITH customer AS (
    SELECT * FROM {{ ref('stg_snowflake__customer') }}
),
person AS (
    SELECT * FROM {{ ref('stg_snowflake__person') }}
),
joined AS (
    SELECT 
        customer.customerid AS id_cliente,
        COALESCE(person.firstname || ' ' || person.lastname, 'Cliente Desconhecido') AS nome_cliente
    FROM customer
    LEFT JOIN person ON customer.personid = person.businessentityid
)

SELECT * FROM joined