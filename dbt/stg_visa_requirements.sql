with source as (
    select * from {{ ref('visa_requirements_matrix') }}
)

select * from source