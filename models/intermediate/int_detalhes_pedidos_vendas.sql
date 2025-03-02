WITH 
    salesorderdetail AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderdetail') }}
    ),

    produto AS (
        SELECT * FROM {{ ref('int_vendas_prep_produtos') }}
    ),

    joined AS (
        SELECT 
            salesorderdetail.salesorderid AS id_pedido,
            salesorderdetail.productid AS id_produto,
            produto.nome_produto,
            produto.categoria_produto,
            produto.subcategoria_produto,
            salesorderdetail.orderqty AS quantidade_vendida,
            salesorderdetail.unitprice AS preco_unitario,
            salesorderdetail.unitpricediscount AS desconto_unitario,
            (salesorderdetail.unitprice * salesorderdetail.orderqty) AS valor_bruto,
            (salesorderdetail.unitprice * salesorderdetail.orderqty) - (salesorderdetail.unitpricediscount * salesorderdetail.orderqty) AS valor_liquido
        FROM salesorderdetail
        LEFT JOIN produto ON salesorderdetail.productid = produto.id_produto
    )

SELECT * FROM joined