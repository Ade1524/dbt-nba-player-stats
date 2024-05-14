with player_stats_97_2022 as (
     select *
      from {{ ref('stg_nba_player_stats__players_season')}}
)
, player_stats_no_tot as (
    select  *
     from player_stats_97_2022
     where teams not like 'TOT'
)
, rookie_players_stats as (
    select *
      from {{ ref('stg_nba_total_rookies_stats_1980_2023__rookie_players')}}
) 
, union_rookie_player_stats_id as (
           select 
              player_id
             ,player_name
             ,year_of_birth
         from player_stats_no_tot
        union 
       select player_id
             ,player_name
             ,year_of_birth
         from rookie_players_stats     
)
select * from  union_rookie_player_stats_id





