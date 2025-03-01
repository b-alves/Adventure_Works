WITH
    salesreason AS(
        SELECT SALESREASONID
            , NAME
            , REASONTYPE
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'salesreason') }}
    )

SELECT *
FROM salesreason