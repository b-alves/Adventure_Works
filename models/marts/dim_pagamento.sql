WITH pagamento AS (
    SELECT * FROM {{ ref('int_pagamento') }}
)

SELECT 
    id_pedido,
    tipo_cartao
FROM pagamento