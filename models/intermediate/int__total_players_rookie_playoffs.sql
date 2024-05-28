with players_rookie as (
    select * 
     from {{ ref('int_player_stats__rookie_player_stats_no_tot') }}
)
,playoffs_players as (
    select *
     from {{ ref('int_playoffs__players_playoffs') }}
)
, rookie_playoffs_players as (
    select *
     from players_rookie
     union
    select *
      from playoffs_players
     order by year_of_birth
)

select * from rookie_playoffs_players