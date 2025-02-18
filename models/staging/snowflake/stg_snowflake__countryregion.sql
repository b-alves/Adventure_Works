WITH
    countryregion AS(
        SELECT COUNTRYREGIONCODE
            , NAME
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'countryregion') }}
    )

SELECT *
FROM countryregion