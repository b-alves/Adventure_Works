WITH 
    salesorderheader AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderheader') }}
    ),

    salesorderdetail AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderdetail') }}
    ),

    joined AS (
        SELECT 
            salesorderheader.salesorderid AS id_pedido,
            salesorderheader.customerid AS id_cliente,
            salesorderheader.orderdate AS data_pedido,
            COUNT(DISTINCT salesorderdetail.productid) AS quantidade_produtos_distintos,
            SUM(salesorderdetail.orderqty) AS quantidade_total_vendida,
            SUM(salesorderdetail.unitprice * salesorderdetail.orderqty) AS valor_bruto,
            SUM((salesorderdetail.unitprice * salesorderdetail.orderqty) - (salesorderdetail.unitpricediscount * salesorderdetail.orderqty)) AS valor_liquido,
            SUM((salesorderdetail.unitprice * salesorderdetail.orderqty) - (salesorderdetail.unitpricediscount * salesorderdetail.orderqty)) / NULLIF(SUM(salesorderdetail.orderqty), 0) AS ticket_medio
        FROM salesorderheader
        LEFT JOIN salesorderdetail 
            ON salesorderheader.salesorderid = salesorderdetail.salesorderid
        GROUP BY salesorderheader.salesorderid, salesorderheader.customerid, salesorderheader.orderdate
    )

SELECT * FROM joined