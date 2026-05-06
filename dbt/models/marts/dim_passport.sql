with passport as (
    select * from {{ ref('stg_henley_passport_index') }}
),

final as (
    select
        country_name,
        visa_free_count,
        visa_required_count,
        round(
            visa_free_count::numeric / 
            nullif(visa_free_count + visa_required_count, 0) * 100, 
            2
        ) as visa_free_pct,
        rank() over (order by visa_free_count desc) as passport_rank,
        case
            when country_name in ('France', 'Germany', 'Ireland', 'Italy', 'Spain', 'Netherlands', 'Belgium', 'Sweden', 'Denmark', 'Finland', 'Norway', 'Switzerland', 'Austria', 'Portugal', 'Greece', 'Poland', 'Czech Republic', 'Hungary', 'Luxembourg') then 'Europe'
            when country_name in ('United States', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'Colombia', 'Chile', 'Peru') then 'Americas'
            when country_name in ('China', 'India', 'Japan', 'South Korea', 'Singapore', 'Thailand', 'Indonesia', 'Malaysia', 'Philippines', 'Vietnam', 'Bangladesh', 'Pakistan', 'Sri Lanka') then 'Asia'
            when country_name in ('Nigeria', 'South Africa', 'Kenya', 'Ghana', 'Ethiopia', 'Egypt', 'Morocco', 'Tanzania') then 'Africa'
            when country_name in ('Australia', 'New Zealand') then 'Oceania'
            when country_name in ('United Arab Emirates', 'Saudi Arabia', 'Qatar', 'Kuwait', 'Bahrain', 'Oman', 'Jordan', 'Lebanon') then 'Middle East'
            else 'Other'
        end as region
    from passport
)

select * from final