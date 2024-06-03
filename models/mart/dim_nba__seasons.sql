with seasons_table as (
    select *
      from {{ ref('int_nba_player_stats__seasons') }}
)
,season_id as (
    select {{ dbt_utils.generate_surrogate_key(['seasons']) }} as season_key
          ,seasons
          ,champions
      from seasons_table
)



select * from season_id