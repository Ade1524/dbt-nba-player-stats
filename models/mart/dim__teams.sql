with nba_teams_table as (
    select distinct teams as unique_teams
          ,team_full_name
      from {{ ref('stg_nba_total_rookies_stats_1980_2023__rookie_players') }}
)

, teams_unique_id as (
    select {{ dbt_utils.generate_surrogate_key(['unique_teams', 'team_full_name']) }} as team_key
          ,unique_teams
          ,team_full_name
      from nba_teams_table
)



select * from teams_unique_id