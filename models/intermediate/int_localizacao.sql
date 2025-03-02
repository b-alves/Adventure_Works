WITH address AS (
    SELECT * FROM {{ ref('stg_snowflake__address') }}
),
state AS (
    SELECT * FROM {{ ref('stg_snowflake__stateprovince') }}
),
country AS (
    SELECT * FROM {{ ref('stg_snowflake__countryregion') }}
),
joined AS (
    SELECT 
        address.addressid AS id_endereco,
        address.city AS cidade,
        state.name AS estado,
        country.name AS pais
    FROM address
    LEFT JOIN state ON address.stateprovinceid = state.stateprovinceid
    LEFT JOIN country ON state.countryregioncode = country.countryregioncode
)

SELECT * FROM joined