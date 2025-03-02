WITH product AS (
    SELECT * FROM {{ ref('stg_snowflake__product') }}
),
subcategory AS (
    SELECT * FROM {{ ref('stg_snowflake__productsubcategory') }}
),
category AS (
    SELECT * FROM {{ ref('stg_snowflake__productcategory') }}
),
joined AS (
    SELECT 
        product.productid AS id_produto,
        product.name AS nome_produto,
        subcategory.name AS subcategoria,
        category.name AS categoria
    FROM product
    LEFT JOIN subcategory ON product.productsubcategoryid = subcategory.productsubcategoryid
    LEFT JOIN category ON subcategory.productcategoryid = category.productcategoryid
)

SELECT * FROM joined