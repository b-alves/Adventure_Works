WITH 
    salesorderheader AS(
        SELECT SALESORDERID
            , REVISIONNUMBER
            , ORDERDATE
            , DUEDATE
            , SHIPDATE
            , STATUS
            , ONLINEORDERFLAG
            , PURCHASEORDERNUMBER
            , ACCOUNTNUMBER
            , CUSTOMERID
            , SALESPERSONID
            , TERRITORYID
            , BILLTOADDRESSID
            , SHIPTOADDRESSID
            , SHIPMETHODID
            , CREDITCARDID
            , CREDITCARDAPPROVALCODE
            , CURRENCYRATEID
            , SUBTOTAL
            , TAXAMT
            , FREIGHT
            , TOTALDUE
            --, COMMENT
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'salesorderheader') }}
        )

SELECT *
FROM salesorderheader