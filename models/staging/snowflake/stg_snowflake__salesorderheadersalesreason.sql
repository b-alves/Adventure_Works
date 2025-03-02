WITH salesorderheadersalesreason AS (
    SELECT * 
    FROM {{ source('snowflake', 'salesorderheadersalesreason') }}
)

SELECT 
    salesorderid,
    salesreasonid,
    modifieddate
FROM salesorderheadersalesreason
