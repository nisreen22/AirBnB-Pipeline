-- models/marts/fact_listings.sql

WITH base AS (

    SELECT *

    FROM {{ ref('stg_airbnb') }}

),

joined AS (

    SELECT

        ROW_NUMBER() OVER (ORDER BY id) AS Fact_SK,

        /* 
           FOREIGN KEYS
        */

        d.Date_SK,
        h.Host_SK,
        l.Location_SK,
        p.Property_SK,
        r.Review_SK,

        /* ⚠️ IMPORTANT:
           Review_SK غالبًا مش محتاجه هنا
           لأن review_scores موجودة ك metrics
        */

        /* 
           MEASURES
         */

        price,
        accommodates,

        review_scores_rating,
        number_of_reviews,

        has_availability,

        bedrooms,
        beds,
        bathrooms AS bathroom,  

        minimum_nights,
        maximum_nights,
        half_bath_num,

        instant_bookable

    FROM base b

    /*  Date  */
    LEFT JOIN {{ ref('DIM_Date') }} d
    ON d.Date_SK = TO_NUMBER(
        TO_CHAR(
            CAST(b.host_since AS DATE),
            'YYYYMMDD'
        )
    )
    /*  Host */
    LEFT JOIN {{ ref('DIM_Host') }} h
        ON h.host_id = b.host_id

    /*  Location */
    LEFT JOIN {{ ref('DIM_Location') }} l
        ON l.city = b.city
        AND l.country = b.country
        AND l.latitude = b.latitude
        AND l.longitude = b.longitude

    /*  Property */
    LEFT JOIN {{ ref('DIM_Property') }} p
       ON p.Property_id = b.id     

     /* Review */    
    LEFT JOIN {{ ref('DIM_Reviews') }} r
        ON r.Review_id = b.id
   
)

SELECT * FROM joined