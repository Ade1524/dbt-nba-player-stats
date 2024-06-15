with playoffs as (
    select *
     from {{ ref('int_nba_player_stats__playoffs_players_added_team_name') }}
)

,regular as (
    select *    
     from {{ ref('int_nba_player_stats__players_97_22_with_added_team_name_column') }}
)
,
,regular_plus_playoffs as (

    select
        --   count(1) as num_records
        --   {{ dbt_utils.generate_surrogate_key(['r.seasons']) }} as dim_season_key
        --   ,{{ dbt_utils.generate_surrogate_key(['r.player_id', 'r.player_name', 'r.year_of_birth']) }} as dim_player_key
        --   ,{{ dbt_utils.generate_surrogate_key(['r.teams', 'r.team_name']) }} as dim_team_key
          r.player_id
         ,p.player_id
      from regular r 
      left join playoffs p  on r.player_id = p.player_id 
                            and r.teams = p.teams 
                            and r.seasons = p.seasons
                            
    --   order by r.seasons
)

select * from regular_plus_playoffs
