WITH
    productcategory AS(
        SELECT PRODUCTCATEGORYID
        , NAME
        --, ROWGUID
        , MODIFIEDDATE
        FROM {{ source('snowflake', 'productcategory') }}
    )

SELECT *
FROM productcategory