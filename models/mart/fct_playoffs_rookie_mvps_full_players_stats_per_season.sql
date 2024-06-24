with playoffs as (
    select *
     from {{ ref('int_nba_player_stats__playoffs_players_added_team_name') }}
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

   select {{ dbt_utils.generate_surrogate_key(['p.seasons']) }} as dim_season_key
          ,{{ dbt_utils.generate_surrogate_key(['p.player_id', 'p.player_name', 'p.year_of_birth']) }} as dim_player_key
          ,{{ dbt_utils.generate_surrogate_key(['p.teams', 'p.team_name']) }} as dim_team_key
          ,p.player_id as player_id
          ,p.seasons as seasons
          ,p.player_name as player_name
          ,p.year_of_birth as year_of_birth
          ,p.position as position
          ,p.age as age
          ,p.teams as teams
          ,p.team_name as name
          ,p.playoff_games_in_season as playoffs_stats_playoff_games_in_season
          ,p.playoff_games_started_in_season as playoffs_stats_playoff_games_started_in_season
          ,p.minutes_played_per_game as playoffs_stats_minutes_played_per_game
          ,p.field_goals_per_game as playoffs_stats_field_goals_per_game
          ,p.field_goal_attempts_per_game as playoffs_stats_field_goal_attempts_per_game
          ,p.field_goal_percentage as playoffs_stats_field_goal_percentage
          ,p.a_3_point_field_goals_per_game as playoffs_stats_a_3_point_field_goals_per_game
          ,p.a_3_point_field_goal_attempts_per_game as playoffs_stats_a_3_point_field_goal_attempts_per_game
          ,p.a_3_point_field_goal_percentage as playoffs_stats_a_3_point_field_goal_percentage
          ,p.a_2_point_field_goals_per_game as playoffs_stats_a_2_point_field_goals_per_game
          ,p.a_2_point_field_goal_attempts_per_game as playoffs_stats_a_2_point_field_goal_attempts_per_game
          ,p.a_2_point_field_goal_percentage as playoffs_stats_a_2_point_field_goal_percentage
          ,p.effective_field_goal_percentage as playoffs_stats_effective_field_goal_percentage
          ,p.free_throws_per_game as playoffs_stats_free_throws_per_game
          ,p.free_throw_attempts_per_game as playoffs_stats_free_throw_attempts_per_game
          ,p.free_throw_percentage as playoffs_stats_free_throw_percentage
          ,p.offensive_rebounds_per_game as playoffs_stats_offensive_rebounds_per_game
          ,p.defensive_rebounds_per_game as playoffs_stats_defensive_rebounds_per_game
          ,p.total_rebounds_per_game as playoffs_stats_total_rebounds_per_game
          ,p.assists_per_game as playoffs_stats_assists_per_game
          ,p.steals_per_game as playoffs_stats_steals_per_game
          ,p.blocks_per_game as playoffs_stats_blocks_per_game
          ,p.turnovers_per_game as playoffs_stats_turnovers_per_game
          ,p.personal_fouls_per_game as playoffs_stats_personal_fouls_per_game
          ,p.points as playoffs_stats_points
          ,p.assist_percentage as playoffs_stats_assist_percentage
          ,p.block_percentage as playoffs_stats_block_percentage
          ,p.box_plus_minus as playoffs_stats_box_plus_minus
          ,p.defensive_box_plus_minus as playoffs_stats_defensive_box_plus_minus
          ,p.defensive_rebounding_percentage as playoffs_stats_defensive_rebounding_percentage
          ,p.defensive_win_share as playoffs_stats_defensive_win_share
          ,p.a_3_point_shot_attempts_per_field_goal_attempted as playoffs_stats_a_3_point_shot_attempts_per_field_goal_attempted
          ,p.free_throw_attempted_per_field_goal_attempted_percentage as playoffs_stats_free_throw_attempted_per_field_goal_attempted_percentage
          ,p.total_minutes_played as playoffs_stats_total_minutes_played
          ,p.offensive_box_plus_minus as playoffs_stats_offensive_box_plus_minus
          ,p.offensive_rebounding_percentage as playoffs_stats_offensive_rebounding_percentage
          ,p.offensive_win_share as playoffs_stats_offensive_win_share
          ,p.player_efficiency_rating as playoffs_stats_player_efficiency_rating
          ,p.steal_percentage as playoffs_stats_steal_percentage
          ,p.turnover_percentage as playoffs_stats_turnover_percentage
          ,p.total_rebound_percentage as playoffs_stats_total_rebound_percentage
          ,p.true_shooting_percentage as playoffs_stats_true_shooting_percentage
          ,p.usage_percentage as playoffs_stats_usage_percentage
          ,p.value_over_replacement_player as playoffs_stats_value_over_replacement_player
          ,p.win_share as playoffs_stats_win_share
          ,p.win_share_per_48_games as playoffs_stats_win_share_per_48_games

-- Final mvp stats 
          ,fm.seasons as finals_mvp_seasons
          ,fm.league as finals_mvp_league
          ,fm.player_name as finals_mvp_player_name
          ,fm.age as finals_mvp_age
          ,fm.teams as finals_mvp_teams
          ,fm.games as finals_mvp_games
          ,fm.minutes_played_per_game as finals_mvp_minutes_played_per_game
          ,fm.points_per_game as finals_mvp_points_per_game
          ,fm.total_rebounds_per_game as finals_mvp_total_rebounds_per_game
          ,fm.assists_per_game as finals_mvp_assists_per_game
          ,fm.steals_per_game as finals_mvp_steals_per_game
          ,fm.blocks_per_game as finals_mvp_blocks_per_game
          ,fm.field_goal_percentage as finals_mvp_field_goal_percentage
          ,fm.c_3_point_field_goal_percentage as finals_mvp_c_3_point_field_goal_percentage
          ,fm.free_throw_percentage as finals_mvp_free_throw_percentage

-- Rookie stats
          ,ro.seasons as rookie_stats_seasons 
          ,ro.player_name as rookie_stats_player_name 
          ,ro.teams as rookie_stats_teams 
          ,ro.teams_name as rookie_stats_teams_name 
          ,ro.age as rookie_stats_age 
          ,ro.years_in_the_league as rookie_stats_years_in_the_league 
          ,ro.games_played as rookie_stats_games_played 
          ,ro.minutes_played as rookie_stats_minutes_played 
          ,ro.field_goals as rookie_stats_field_goals  
          ,ro.field_goals_attempted as rookie_stats_field_goals_attempted 
          ,ro.c_3_pointers as rookie_stats_c_3_pointers  
          ,ro.c_3_points_attempted as rookie_stats_c_3_points_attempted 
          ,ro.free_throws as rookie_stats_free_throws 
          ,ro.free_throws_attempted as rookie_stats_free_throws_attempted 
          ,ro.offensive_rebound as rookie_stats_offensive_rebound 
          ,ro.true_rebound as rookie_stats_true_rebound 
          ,ro.assists as rookie_stats_assists 
          ,ro.steals as rookie_stats_steals 
          ,ro.blocks as rookie_stats_blocks 
          ,ro.turnovers as rookie_stats_turnovers 
          ,ro.personal_fouls as rookie_stats_personal_fouls 
          ,ro.points as rookie_stats_points 
          ,ro.c_field_goal_percentage as rookie_stats_c_field_goal_percentage 
          ,ro.c_3p_point_percentage as rookie_stats_c_3p_point_percentage 
          ,ro.free_throw_percentage as rookie_stats_free_throw_percentage 
          ,ro.minutes_per_game as rookie_stats_minutes_per_game 
          ,ro.points_per_game as rookie_stats_points_per_game 
          ,ro.rebounds_per_game as rookie_stats_rebounds_per_game 
          ,ro.assists_per_game as rookie_stats_assists_per_game
          ,ro.roty_points_won as rookie_stats_roty_points_won
          ,ro.max_amount_of_points_you_can_win as rookie_stats_max_amount_of_points_you_can_win
          ,ro.pts_won_vs_pts_max as rookie_stats_pts_won_vs_pts_max
          ,ro.win_total_during_the_season as rookie_stats_win_total_during_the_season
          ,ro.lose_total_during_the_season as rookie_stats_lose_total_during_the_season
          ,ro.win_loss_percentage as rookie_stats_win_loss_percentage
          ,ro.team_games_behind as rookie_stats_team_games_behind
          ,ro.points_per_game_in_the_team as rookie_stats_points_per_game_in_the_team
          ,ro.opponents_points_per_game as rookie_stats_opponents_points_per_game
          ,ro.simple_rating_system as rookie_stats_simple_rating_system

-- Regular season mvp 
          ,rsm.seasons as regular_season_mvp_seasons
          ,rsm.league as regular_season_mvp_league
          ,rsm.player_name as regular_season_mvp_player_name
          ,rsm.age as regular_season_mvp_age
          ,rsm.teams as regular_season_mvp_teams
          ,rsm.games as regular_season_mvp_games
          ,rsm.minutes_played_per_games as regular_season_mvp_minutes_played_per_games
          ,rsm.points_per_game as regular_season_mvp_points_per_game
          ,rsm.total_rebounds_per_game as regular_season_mvp_total_rebounds_per_game
          ,rsm.assists_per_game as regular_season_mvp_assists_per_game
          ,rsm.steals_per_game as regular_season_mvp_steals_per_game
          ,rsm.blocks_per_game as regular_season_mvp_blocks_per_game
          ,rsm.field_goal_percentage as regular_season_mvp_field_goal_percentage
          ,rsm.c_3_point_field_goal_percentage as regular_season_mvp_c_3_point_field_goal_percentage
          ,rsm.free_throw_percentage as regular_season_mvp_free_throw_percentage
          ,rsm.win_share as regular_season_mvp_win_share
          ,rsm.win_share_per_48_games as regular_season_mvp_win_share_per_48_games
          ,rsm.voting as regular_season_mvp_voting

     from playoffs p
      left join finals_mvp fm  on p.player_id = fm.player_id 
                            and p.teams = fm.teams 
                            and p.seasons = fm.seasons
      left join rookies ro  on p.player_id = ro.player_id 
                            and p.teams = ro.teams 
                            and p.seasons = ro.seasons
      left join regular_season_mvp rsm  on p.player_id = rsm.player_id 
                                        and p.teams = rsm.teams 
                                        and p.seasons = rsm.seasons
      
    
)

select * from regular_plus_playoffs






