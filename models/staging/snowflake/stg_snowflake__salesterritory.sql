WITH 
    salesterritory AS(
        SELECT TERRITORYID
            , NAME
            , COUNTRYREGIONCODE
            , "group"
            , SALESYTD
            , SALESLASTYEAR
            , COSTYTD
            , COSTLASTYEAR
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'salesterritory') }}
    )

SELECT *
FROM salesterritory