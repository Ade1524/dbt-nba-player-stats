with playoffs as (
    select *
     from {{ ref('int_nba_player_stats__playoffs_players_added_team_name') }}
)

,regular as (
    select *    
     from {{ ref('int_nba_player_stats__players_97_22_with_added_team_name_column') }}
)
,rookies as (
    select *    
     from {{ ref('stg_nba_player_stats__nba_total_rookies_stats_1980_2023') }}
)

,regular_season_mvp as (
    select *    
     from {{ ref('stg_nba_player_stats__regular_season_mvp_player_stats') }}
)

,finals_mvp as (
    select *    
     from {{ ref('stg_nba_player_stats__playoffs_mvp_finals') }}
)
,regular_plus_playoffs as (

    select
        --   count(1) as num_records --13177
          {{ dbt_utils.generate_surrogate_key(['r.seasons']) }} as dim_season_key
          ,{{ dbt_utils.generate_surrogate_key(['r.player_id', 'r.player_name', 'r.year_of_birth']) }} as dim_player_key
          ,{{ dbt_utils.generate_surrogate_key(['r.teams', 'r.team_name']) }} as dim_team_key
          ,r.player_id
         ,p.player_id
         ,ro.player_id
         ,rsm.player_id
         ,fm.player_id
        
      from regular r 
      left join playoffs p  on r.player_id = p.player_id 
                            and r.teams = p.teams 
                            and r.seasons = p.seasons
      left join rookies ro  on r.player_id = ro.player_id 
                            and r.teams = ro.teams 
                            and r.seasons = ro.seasons
      left join regular_season_mvp rsm  on r.player_id = rsm.player_id 
                                        and r.teams = rsm.teams 
                                        and r.seasons = rsm.seasons
      left join finals_mvp fm  on r.player_id = fm.player_id 
                                        and r.teams = fm.teams 
                                        and r.seasons = fm.seasons
      
    --   order by r.seasons
)

select * from regular_plus_playoffs
