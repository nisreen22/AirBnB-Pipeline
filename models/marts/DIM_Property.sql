-- models/marts/dim_property.sql

WITH base AS (

    SELECT DISTINCT
        id,  

        property_type,
        room_type,
        bathrooms_text,
        amenities,

        calculated_host_listings_count,
        calculated_host_listings_count_entire_homes,
        calculated_host_listings_count_private_rooms,
        calculated_host_listings_count_shared_rooms

    FROM {{ ref('stg_airbnb') }}

)

SELECT

    /* Surrogate Key */
    ROW_NUMBER() OVER (
        ORDER BY id
    ) AS Property_SK,

    /* Business Key */
    id AS Property_id,

    property_type,
    room_type,
    bathrooms_text,
    amenities,

    calculated_host_listings_count,
    calculated_host_listings_count_entire_homes,
    calculated_host_listings_count_private_rooms,
    calculated_host_listings_count_shared_rooms

FROM base