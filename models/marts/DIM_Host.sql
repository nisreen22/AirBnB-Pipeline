WITH base AS (

    SELECT DISTINCT
        host_id,
        host_name,
        host_since,
        host_location,
        host_response_time,
        host_is_superhost,
        host_picture_url,
        host_verifications,
        host_has_profile_pic,
        host_identity_verified,
        host_response_rate,
        host_acceptance_rate,
        host_listings_count,
        host_total_listings_count,
        host_since_year,
        host_since_month,
        host_since_quarter

    FROM {{ ref('stg_airbnb') }}

)

SELECT
    ROW_NUMBER() OVER (ORDER BY host_id) AS Host_SK,
    host_id,
    host_name,
    host_since,
    host_location,
    host_response_time,
    host_is_superhost,
    host_picture_url,
    host_verifications,
    host_has_profile_pic,
    host_identity_verified,
    host_response_rate,
    host_acceptance_rate,
    host_listings_count,
    host_total_listings_count,
    host_since_year,
    host_since_month,
    host_since_quarter

FROM base