WITH
    customer AS(
        SELECT CUSTOMERID
            , PERSONID
            , STOREID
            , TERRITORYID
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'customer') }}
    )

SELECT *
FROM customer