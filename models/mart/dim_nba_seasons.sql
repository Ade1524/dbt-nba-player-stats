with single_row_per_season as (
    select {{ dbt_utils.generate_surrogate_key(['seasons']) }} as season_key
          , seasons
      from {{ ref('stg_nba_playoff_stats__player') }}
    group by seasons 
    order by seasons asc
)

select * from single_row_per_season