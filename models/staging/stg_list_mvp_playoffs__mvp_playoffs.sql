with mvp_playoffs as (
    select * from {{ ref('list_mvp_playoffs')}}
)

, rename_columns as (
    select {{ get_season('year') }} as seasons
            ,replace(finals_mvp, '-', ' ')::varchar(1000) as player_name
      from mvp_playoffs
)

select * from rename_columns