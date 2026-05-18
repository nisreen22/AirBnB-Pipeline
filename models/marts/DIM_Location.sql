WITH base AS (

    SELECT DISTINCT
        host_neighbourhood,
        latitude,
        longitude,
        city,
        country

    FROM {{ ref('stg_airbnb') }}

)

SELECT
    ROW_NUMBER() OVER (
        ORDER BY city, country, latitude, longitude
    ) AS Location_SK,

    host_neighbourhood,
    latitude,
    longitude,
    city,
    country

FROM base