WITH
    product AS(
        SELECT PRODUCTID
            , NAME
            , PRODUCTNUMBER
            , MAKEFLAG
            , FINISHEDGOODSFLAG
            , COLOR
            , SAFETYSTOCKLEVEL
            , REORDERPOINT
            , STANDARDCOST
            , LISTPRICE
            , SIZE
            , SIZEUNITMEASURECODE
            , WEIGHTUNITMEASURECODE
            , WEIGHT
            , DAYSTOMANUFACTURE
            , PRODUCTLINE
            , CLASS
            , STYLE
            , PRODUCTSUBCATEGORYID
            , PRODUCTMODELID
            , SELLSTARTDATE
            , SELLENDDATE
            , DISCONTINUEDDATE
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'product') }}
    )

SELECT *
FROM product