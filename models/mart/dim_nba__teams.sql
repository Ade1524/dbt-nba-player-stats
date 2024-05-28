with nba_teams_table as (
    select *
      from {{ ref('stg_nba_teams__list_teams_abbr_name') }}
)
,teams_unique_id as (
    select {{ dbt_utils.generate_surrogate_key(['teams', 'team_name']) }} as team_key
          ,teams
          ,team_name
      from nba_teams_table
)



select * from teams_unique_id

-- select * from nba_teams_table