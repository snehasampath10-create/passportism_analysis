with visa as (
    select * from {{ ref('visa_requirements_long') }}
),

passport as (
    select * from {{ ref('dim_passport') }}
),

final as (
    select
        v.origin_country,
        v.destination_country,
        v.visa_requirement,
        case
    when v.visa_requirement = 'visa required' then 'Visa Required'
    when v.visa_requirement = 'e-visa' then 'E-Visa'
    when v.visa_requirement = '-1' then 'Same Country'
    when v.visa_requirement = 'visa free' then 'Visa Free'
    when v.visa_requirement ~ '^\d+$' then 'Visa Free'
    else 'Other'
end as visa_category,
        p.passport_rank as origin_passport_rank,
        p.visa_free_count as origin_visa_free_count
    from visa v
    left join passport p
        on v.origin_country = p.country_name
)

select * from final