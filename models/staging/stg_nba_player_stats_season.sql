with nba_player_stats as (
    select * from {{ ref('nba_player_stats')}}
)

select * from nba_player_stats 