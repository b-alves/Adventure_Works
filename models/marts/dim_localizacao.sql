WITH localizacao AS (
    SELECT * FROM {{ ref('int_localizacao') }}
)

SELECT 
    id_endereco,
    cidade,
    estado,
    pais
FROM localizacao