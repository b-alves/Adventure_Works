WITH 
    salesorderheader AS (
        SELECT * FROM {{ ref('stg_snowflake__salesorderheader') }}
    ),

    creditcard AS (
        SELECT * FROM {{ ref('stg_snowflake__creditcard') }}
    ),

    joined AS (
        SELECT 
            salesorderheader.salesorderid,
            creditcard.creditcardid,
            creditcard.cardtype AS tipo_cartao
        FROM salesorderheader
        LEFT JOIN creditcard ON salesorderheader.creditcardid = creditcard.creditcardid
    )

SELECT * FROM joined
