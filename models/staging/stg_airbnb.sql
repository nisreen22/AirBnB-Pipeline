-- models/staging/stg_airbnb_data.sql

WITH source_data AS (

    SELECT * 
    FROM {{ source('raw_data', 'AIRBNB_DATA') }}

),

cleaned AS (

    SELECT
        CAST(id AS BIGINT) AS id,
        CAST(listing_url AS VARCHAR) AS listing_url,
        CAST(last_scraped AS TIMESTAMP) AS last_scraped,
        CAST(host_id AS BIGINT) AS host_id,
        CAST(host_name AS VARCHAR) AS host_name,
        CAST(host_since AS TIMESTAMP) AS host_since,
        CAST(host_location AS VARCHAR) AS host_location,
        CAST(host_response_time AS VARCHAR) AS host_response_time,
        CAST(host_response_rate AS BIGINT) AS host_response_rate,
        CAST(host_acceptance_rate AS BIGINT) AS host_acceptance_rate,
        CAST(host_is_superhost AS VARCHAR) AS host_is_superhost,
        CAST(host_picture_url AS VARCHAR) AS host_picture_url,
        CAST(host_neighbourhood AS VARCHAR) AS host_neighbourhood,
        CAST(host_listings_count AS FLOAT) AS host_listings_count,
        CAST(host_total_listings_count AS FLOAT) AS host_total_listings_count,
        CAST(host_verifications AS VARCHAR) AS host_verifications,
        CAST(host_has_profile_pic AS VARCHAR) AS host_has_profile_pic,
        CAST(host_identity_verified AS VARCHAR) AS host_identity_verified,
        CAST(neighbourhood_cleansed AS VARCHAR) AS neighbourhood_cleansed,
        CAST(latitude AS FLOAT) AS latitude,
        CAST(longitude AS FLOAT) AS longitude,
        CAST(property_type AS VARCHAR) AS property_type,
        CAST(room_type AS VARCHAR) AS room_type,
        CAST(accommodates AS BIGINT) AS accommodates,
        CAST(bathrooms_text AS VARCHAR) AS bathrooms_text,
        CAST(bedrooms AS INT) AS bedrooms,
        CAST(beds AS INT) AS beds,
        CAST(amenities AS VARCHAR) AS amenities,
        CAST(price AS FLOAT) AS price,
        CAST(minimum_nights AS BIGINT) AS minimum_nights,
        CAST(maximum_nights AS BIGINT) AS maximum_nights,
        CAST(has_availability AS VARCHAR) AS has_availability,
        CAST(number_of_reviews AS BIGINT) AS number_of_reviews,
        CAST(number_of_reviews_ltm AS BIGINT) AS number_of_reviews_ltm,
        CAST(number_of_reviews_l30d AS BIGINT) AS number_of_reviews_l30d,
        CAST(first_review AS VARCHAR) AS first_review,
        CAST(last_review AS VARCHAR) AS last_review,
        CAST(review_scores_rating AS FLOAT) AS review_scores_rating,
        CAST(review_scores_accuracy AS FLOAT) AS review_scores_accuracy,
        CAST(review_scores_cleanliness AS FLOAT) AS review_scores_cleanliness,
        CAST(review_scores_checkin AS FLOAT) AS review_scores_checkin,
        CAST(review_scores_communication AS FLOAT) AS review_scores_communication,
        CAST(review_scores_location AS FLOAT) AS review_scores_location,
        CAST(review_scores_value AS FLOAT) AS review_scores_value,
        CAST(instant_bookable AS VARCHAR) AS instant_bookable,
        CAST(calculated_host_listings_count AS BIGINT) AS calculated_host_listings_count,
        CAST(calculated_host_listings_count_entire_homes AS BIGINT) AS calculated_host_listings_count_entire_homes,
        CAST(calculated_host_listings_count_private_rooms AS BIGINT) AS calculated_host_listings_count_private_rooms,
        CAST(calculated_host_listings_count_shared_rooms AS BIGINT) AS calculated_host_listings_count_shared_rooms,
        CAST(reviews_per_month AS FLOAT) AS reviews_per_month,
        CAST(bathrooms AS INT) AS bathrooms,
        CAST(neighbourhod AS VARCHAR) AS neighbourhod,
        CAST(city AS VARCHAR) AS city,
        CAST(country AS VARCHAR) AS country,
        CAST(host_since_year AS BIGINT) AS host_since_year,
        CAST(host_since_month AS VARCHAR) AS host_since_month,
        CAST(host_since_quarter AS BIGINT) AS host_since_quarter,
        CAST(last_scraped_year AS BIGINT) AS last_scraped_year,
        CAST(last_scraped_month AS VARCHAR) AS last_scraped_month,
        CAST(last_scraped_quarter AS BIGINT) AS last_scraped_quarter,
        CAST(half_bath_num AS BIGINT) AS half_bath_num

    FROM source_data

)

SELECT * 
FROM cleaned