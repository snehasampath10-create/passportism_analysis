with source as (
    select * from {{ ref('gdp_per_capita') }}
),

renamed as (
    select
        "Country Name"    as country_name,
        "Country Code"    as country_code,
        "2023"            as gdp_per_capita_usd
    from source
    where "Country Code" is not null
)

select * from renamed