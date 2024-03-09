with nba_playoff_stats__players as (
    select * from {{ ref('nba_playoff_stats')}}
)



, renaming_playoff_players_columns as  (
          select season 
                ,replace(player, '-', ' ') as player_full_name
                ,pos as position
                ,age 
                ,team_id as team 
                ,g as playoff_games_in_season
                ,gs as playoff_games_started_in_season
                ,mp_per_g as minutes_played_per_game
                ,fg_per_g as field_goals_per_game
                ,fga_per_g as field_goal_attempts_per_game
                ,fg_pct as field_goal_percentage
                ,fg3_per_g as a_3_point_field_goals_per_game
                ,fg3a_per_g as a_3_point_field_goal_attempts_per_game
                ,fg3_pct as a_3_point_field_goal_percentage
                ,fg2_per_g as a_2_point_field_goals_per_game
                ,fg2a_per_g as a_2_point_field_goal_attempts_per_game
                ,fg2_pct as a_2_point_field_goal_percentage
                ,efg_pct as effective_field_goal_percentage
                ,ft_per_g as free_throws_per_game
                ,fta_per_g as free_throw_attempts_per_game
                ,ft_pct as free_throw_percentage
                ,orb_per_g as offensive_rebounds_per_game
                ,drb_per_g as defensive_rebounds_per_game
                ,trb_per_g as total_rebounds_per_game
                ,ast_per_g as assists_per_game
                ,stl_per_g as steals_per_game
                ,blk_per_g as blocks_per_game
                ,tov_per_g as turnovers_per_game
                ,pf_per_g as  personal_fouls_per_game
                ,pts_per_g as points
                ,ast_pct as assist_percentage
                ,blk_pct as block_percentage
                ,bpm as box_plus_minus
                ,dbpm as defensive_box_plus_minus
                ,drb_pct as defensive_rebounding_percentage
                ,dws as defensive_win_share
                ,fg3a_per_fga_pct as a_3_point_shot_attempts_per_field_goal_attempted
                ,fta_per_fga_pct as free_throw_attempted_per_field_goal_attempted_percentage
                ,mp as total_minutes_played
                ,obpm as offensive_box_plus_minus
                ,orb_pct as offensive_rebounding_percentage
                ,ows as offensive_win_share
                ,per as player_efficiency_rating
                ,stl_pct as steal_percentage
                ,tov_pct as turnover_percentage
                ,trb_pct as total_rebound_percentage
                ,ts_pct as true_shooting_percentage
                ,usg_pct as usage_percentage
                ,vorp as value_over_replacement_player
                ,ws as win_share
                ,ws_per_48 as  win_share_per_48_games

            from nba_playoff_stats__players
)

select * from renaming_playoff_players_columns

