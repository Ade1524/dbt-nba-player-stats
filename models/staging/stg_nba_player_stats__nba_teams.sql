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
,rename_utah_team as (
    select (replace(teams,'UTH','UTA')) as teams
          ,team_name
      from rename_portland_team 
)

select teams
      ,initcap(team_name) as team_name
 from rename_utah_team



