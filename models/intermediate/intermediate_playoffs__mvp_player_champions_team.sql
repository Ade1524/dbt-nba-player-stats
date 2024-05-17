with mvp_playoffs as (
    select * from {{ ref('stg_list_mvp_playoffs__mvp_playoffs')}}
)
,team_champion as (
    select * from {{ ref('stg_nba_champions__nba_champions_team')}}
)
,mvp_player_champion_team as (
    select m.seasons
          ,m.player_name as mvp_player
          ,t.champion_team as nba_champions
          ,t.runner_up__team as nba_runner_up
      from mvp_playoffs m
      full outer join team_champion t
      on m.seasons = t.seasons
      where t.league like 'NBA'
      order by 1 
)

select * from mvp_player_champion_team