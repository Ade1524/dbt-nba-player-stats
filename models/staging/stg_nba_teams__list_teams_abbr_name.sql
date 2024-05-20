with nba_teams as (
    select * from {{ ref('nba_teams')}}
)
,rename_knicks_team as (
    select team_name_abbreviation as teams
          ,lower(replace(team_name,'Knickerbockers','Knicks')) as team_name
      from nba_teams 
)
,rename_portland_team as (
    select teams
          ,lower(replace(team_name,'trailblazers','trail blazers')) as team_name
      from rename_knicks_team 
)
select * from rename_portland_team