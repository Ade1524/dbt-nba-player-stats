with nba_rookies_stats__players as (
    select * from {{ ref('nba_total_rookies_stats_1980_2023')}}
)

, renaming_columns_rookie_player_stats as (
        select id 
              ,player  as player_full_name
              ,tm as team
              ,age 
              ,yrs as years_in_the_league
              ,g as games_played
              ,mp as minutes_played
              ,fg as field_goals 
              ,fga as field_goals_attempted
              ,c_3p as c_3_pointers 
              ,c_3pa as c_3_points_attempted
              ,ft as free_throws
              ,fta as free_throws_attempted
              ,orb as offensive_rebound
              ,trb as true_rebound
              ,ast as assists
              ,stl as steals
              ,blk as blocks
              ,tov as turnovers
              ,pf as personal_fouls
              ,pts as points
              ,fg_pct as c_field_goal_percentage
              ,c_3p_pct as c_3p_point_percentage
              ,ft_pct as free_throw_percentage
              ,mpg as minutes_per_game
              ,ppg as points_per_game
              ,rpg as rebounds_per_game
              ,apg as assists_per_game
              ,year as season
              ,pts_won as roty_points_won
              ,pts_max as max_amount_of_points_you_can_win
              ,share as pts_won_vs_pts_max

         from nba_rookies_stats__players     
)

select * from renaming_columns_rookie_player_stats