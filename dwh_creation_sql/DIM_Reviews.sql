-- models/marts/dim_review.sql

WITH base AS (

    SELECT DISTINCT
        id AS Review_id,

        first_review,
        last_review,

        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_location,
        review_scores_value,

        number_of_reviews_ltm,
        number_of_reviews_l30d,
        reviews_per_month

    FROM {{ ref('stg_airbnb') }}

)

SELECT

    ROW_NUMBER() OVER (
        ORDER BY Review_id
    ) AS Review_SK,

    Review_id,

    first_review,
    last_review,

    review_scores_accuracy,
    review_scores_cleanliness,
    review_scores_checkin,
    review_scores_communication,
    review_scores_location,
    review_scores_value,

    number_of_reviews_ltm,
    number_of_reviews_l30d,
    reviews_per_month

FROM base



