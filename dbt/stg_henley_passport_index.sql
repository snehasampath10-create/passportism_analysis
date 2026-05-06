with source as (
    select * from {{ ref('henley_passport_index') }}
),

renamed as (
    select
        "Origin"                as country_name,
        "Visa Free"             as visa_free_count,
        "Visa Required"         as visa_required_count
    from source
)

select * from renamed