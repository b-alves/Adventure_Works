WITH pedidos AS (
    SELECT *
    FROM {{ ref('stg_snowflake__salesorderheader') }}
),
detalhes AS (
    SELECT *
    FROM {{ ref('stg_snowflake__salesorderdetail') }}
),
joined AS (
    SELECT
        detalhes.salesorderid AS id_pedido,
        detalhes.productid AS id_produto,
        pedidos.customerid AS id_cliente,
        pedidos.orderdate AS data_pedido,
        detalhes.unitprice AS preco_unitario,
        detalhes.orderqty AS quantidade,
        detalhes.unitpricediscount AS desconto,
        pedidos.freight AS frete,
        pedidos.shipdate AS data_envio,
        pedidos.shipdate AS data_requerida_entrega
    FROM detalhes
    INNER JOIN pedidos ON detalhes.salesorderid = pedidos.salesorderid
),
metricas AS (
    SELECT
        id_pedido,
        id_cliente,
        data_pedido,
        SUM(preco_unitario * quantidade) AS valor_bruto,
        SUM(preco_unitario * (1 - desconto) * quantidade) AS valor_liquido,
        COUNT(DISTINCT id_produto) AS quantidade_produtos_distintos,
        SUM(quantidade) AS total_quantidade,
        MAX(data_envio) AS data_envio,
        MAX(data_requerida_entrega) AS data_requerida_entrega,
        MAX(frete) AS frete
    FROM joined
    GROUP BY id_pedido, id_cliente, data_pedido
)

SELECT *
FROM metricas