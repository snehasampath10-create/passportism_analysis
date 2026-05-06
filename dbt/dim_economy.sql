with economy as (
    select * from {{ ref('stg_gdp_per_capita') }}
),

final as (
    select
        country_name,
        country_code,
        gdp_per_capita_usd,
        case
            when gdp_per_capita_usd < 1000 then 'Low income'
            when gdp_per_capita_usd < 10000 then 'Lower middle income'
            when gdp_per_capita_usd < 40000 then 'Upper middle income'
            else 'High income'
        end as income_group
    from economy
    where gdp_per_capita_usd is not null
)

select * from final