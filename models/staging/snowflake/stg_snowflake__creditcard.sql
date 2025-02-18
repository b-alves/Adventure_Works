WITH
    creditcard AS(
        SELECT CREDITCARDID
            , CARDTYPE
            --, CARDNUMBER
            --, EXPMONTH
            --, EXPYEAR
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'creditcard') }}
    )

SELECT *
FROM creditcard