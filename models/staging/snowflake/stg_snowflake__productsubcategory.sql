WITH
    productsubcategory AS(
        SELECT PRODUCTSUBCATEGORYID
        , PRODUCTCATEGORYID
        , NAME
        --, ROWGUID
        , MODIFIEDDATE
        FROM {{ source('snowflake', 'productsubcategory') }}
    )

SELECT *
FROM productsubcategory