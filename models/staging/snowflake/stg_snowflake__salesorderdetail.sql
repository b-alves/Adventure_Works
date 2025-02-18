WITH
    salesorderdetail AS(
        SELECT SALESORDERID
            , SALESORDERDETAILID
            , CARRIERTRACKINGNUMBER
            , ORDERQTY
            , PRODUCTID
            , SPECIALOFFERID
            , UNITPRICE
            , UNITPRICEDISCOUNT
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'salesorderdetail') }}
    )

SELECT *
FROM salesorderdetail