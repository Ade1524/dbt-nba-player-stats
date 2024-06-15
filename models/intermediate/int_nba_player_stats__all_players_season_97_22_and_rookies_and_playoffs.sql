with players_rookie as (
    select * 
     from {{ ref('int_nba_player_stats__player_stats_97_22_and_rookie_players_names') }}
)
,playoffs_players as (
    select *
     from {{ ref('int_nba_player_stats__players_playoffs') }}
)
, rookie_playoffs_players as (
    select *
     from players_rookie
     union
    select *
      from playoffs_players
     
)

select * from rookie_playoffs_players
  order by year_of_birth