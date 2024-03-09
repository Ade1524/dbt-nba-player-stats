with nba_player_stats as (
    select * from {{ ref('nba_player_stats')}}
)



, rename_player_stats_columns as (
      select rk as rank
            ,replace(replace(player,'*', ' '), '-', ' ') as player_full_name
            ,pos as position
            ,age as age
            ,tm as team
            ,g as games
            ,gs as games_started
            ,mp as minutes_played_per_game
            ,fg as field_goals_per_game
            ,fga as field_goal_attempts_per_game
            ,fg_pct as field_goal_percentage
            ,c_3p as c_3_point_field_goals_per_game
            ,c_3pa as  c_3_point_field_goal_attempts_per_game
            ,c_3p_pct as c_3_point_field_goal_percentage
            ,c_2p as c_2_point_field_goals_per_game
            ,c_2pa as c_2_point_field_goal_attempts_per_game
            ,c_2p_pct as c_2_point_field_goal_percentage
            ,efg_pct as effective_field_goal_percentage
            ,ft as free_throws_per_game
            ,fta as  free_throw_attempts_per_game
            ,ft_pct as free_throw_percentage
            ,orb as  offensive_rebounds_per_game
            ,drb as defensive_rebounds_per_game
            ,trb as total_rebounds_per_game
            ,ast as assists_per_game
            ,stl as steals_per_game
            ,blk as blocks_per_game
            ,tov as turnovers_per_game
            ,pf as personal_fouls_per_game
            ,pts as points_per_game
            ,year as season
        
        from nba_player_stats
)

select * from rename_player_stats_columns

