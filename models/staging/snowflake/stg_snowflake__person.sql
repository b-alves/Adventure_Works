WITH
    person AS(
        SELECT BUSINESSENTITYID
            , PERSONTYPE
            , NAMESTYLE
            , TITLE
            , FIRSTNAME
            , MIDDLENAME
            , LASTNAME
            , SUFFIX
            , EMAILPROMOTION
            , ADDITIONALCONTACTINFO
            , DEMOGRAPHICS
            --, ROWGUID
            , MODIFIEDDATE
        FROM {{ source('snowflake', 'person') }}
    )

SELECT *
FROM person