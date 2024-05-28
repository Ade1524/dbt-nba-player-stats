with seasons_nba_champions as (
    select seasons
          ,lower(champion_team) as champions_team_name
     from {{ ref('stg_nba_champions__nba_champions_team')}}
     where league like 'NBA'
     order by seasons
)

,list_teams as (
    select *
      from {{ ref('stg_nba_teams__list_teams_abbr_name')}}
)

,seasons_champion_teams as (
    select sn.seasons
          ,sn.champions_team_name as champions
          ,lt.teams
     from seasons_nba_champions sn
     left join list_teams lt
     on sn.champions_team_name = lt.team_name
     order by  sn.seasons
    
)

select * from seasons_champion_teams