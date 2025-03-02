WITH pagamento AS (
    SELECT * FROM {{ ref('int_vendas_pagamento') }}
)

SELECT 
    pagamento.id_pedido,
    pagamento.tipo_pagamento
FROM pagamento