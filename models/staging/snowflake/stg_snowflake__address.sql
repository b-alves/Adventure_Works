WITH
    address AS(
        SELECT ADDRESSID
        , ADDRESSLINE1
        , ADDRESSLINE2
        , CITY
        , STATEPROVINCEID
        , POSTALCODE
        , SPATIALLOCATION
        --, ROWGUID
        , MODIFIEDDATE
        FROM {{ source('snowflake', 'address') }}
    )

SELECT *
FROM address