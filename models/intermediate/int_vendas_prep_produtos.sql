WITH 
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
            product.productid AS id_produto,
            product.name AS nome_produto,
            productsubcategory.name AS subcategoria,
            productcategory.name AS categoria
        FROM product
        LEFT JOIN productsubcategory ON product.productsubcategoryid = productsubcategory.productsubcategoryid
        LEFT JOIN productcategory ON productsubcategory.productcategoryid = productcategory.productcategoryid
    )

SELECT * FROM joined
