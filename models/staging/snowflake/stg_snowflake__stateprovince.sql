WITH
    stateprovince AS(
        SELECT STATEPROVINCEID
            , STATEPROVINCECODE
            , COUNTRYREGIONCODE
            , ISONLYSTATEPROVINCEFLAG
            , NAME
            , TERRITORYID
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'stateprovince') }}
    )

SELECT *
FROM stateprovince