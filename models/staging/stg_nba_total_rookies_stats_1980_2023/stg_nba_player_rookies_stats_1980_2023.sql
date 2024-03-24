with nba_rookies_stats__players as (
    select * from {{ ref('nba_total_rookies_stats_1980_2023')}}
)

, renaming_columns_rookie_player_stats as (
        select id::int as player_id
              ,replace(player, '-', ' ')::varchar(1000) as player_full_name
              ,tm::varchar(1000) as teams
              ,age::int 
              ,yrs::int as years_in_the_league
              ,g::int as games_played
              ,mp::int as minutes_played
              ,fg::int as field_goals 
              ,fga::int as field_goals_attempted
              ,c_3p::int as c_3_pointers 
              ,c_3pa::int as c_3_points_attempted
              ,ft::int as free_throws
              ,fta::int as free_throws_attempted
              ,orb::int as offensive_rebound
              ,trb::int as true_rebound
              ,ast::int as assists
              ,stl::int as steals
              ,blk::int as blocks
              ,tov::int as turnovers
              ,pf::int as personal_fouls
              ,pts::int as points
              ,fg_pct::float as c_field_goal_percentage
              ,c_3p_pct::float as c_3p_point_percentage
              ,ft_pct::float as free_throw_percentage
              ,mpg::float as minutes_per_game
              ,ppg::float as points_per_game
              ,rpg::float as rebounds_per_game
              ,apg::float as assists_per_game
              ,{{ get_season('year') }} AS seasons
              ,pts_won::float as roty_points_won
              ,pts_max::float as max_amount_of_points_you_can_win
              ,share::float as pts_won_vs_pts_max

         from nba_rookies_stats__players     
)

select * from renaming_columns_rookie_player_stats