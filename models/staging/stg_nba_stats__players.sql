with nba_player_stats as (
    select * from {{ ref('NBA_Player_Stats')}}
)

select * from nba_player_stats 