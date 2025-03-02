WITH 
    salesorderdetail AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderdetail') }}
    ),

    product AS (
        SELECT * FROM {{ ref('stg_snowflake__product') }}
    ),

    productsubcategory AS (
        SELECT * FROM {{ ref('stg_snowflake__productsubcategory') }}
    ),

    productcategory AS (
        SELECT * FROM {{ ref('stg_snowflake__productcategory') }}
    ),

    joined AS (
        SELECT 
            salesorderdetail.salesorderid,
            salesorderdetail.productid,
            product.name AS nome_produto,
            productsubcategory.name AS subcategoria,
            productcategory.name AS categoria
        FROM salesorderdetail
        LEFT JOIN product ON salesorderdetail.productid = product.productid
        LEFT JOIN productsubcategory 
            ON product.productsubcategoryid = productsubcategory.productsubcategoryid
        LEFT JOIN productcategory 
            ON productsubcategory.productcategoryid = productcategory.productcategoryid
    )

SELECT * FROM joined
