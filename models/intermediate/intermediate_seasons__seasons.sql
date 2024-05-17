with seasons as (
    select seasons
     from {{ ref('stg_list_mvp_playoffs__mvp_playoffs')}}
)

select * from seasons