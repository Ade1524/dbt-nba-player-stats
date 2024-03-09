with nba_rookies_stats__players as (
    select * from {{ ref('nba_total_rookies_stats_1980_2023')}}
)

, renaming_columns_rookie_teams_stats  as (

    select  id 
            ,player  as player_full_name
            ,tm as team_player_played_in
            ,age
            ,year as season 
            ,yrs as years_in_the_league
            ,g as games_played
            ,team as team_played
            ,w as win_total_during_the_season
            ,l as lose_total_during_the_season
            ,w_l_pct as win_loss_percentage
            ,gb as team_games_behind
            ,ps_g as points_per_game
            ,pa_g as opponents_points_per_game
            ,srs as simple_rating_system
      
      from nba_rookies_stats__players       
)

select * from renaming_columns_rookie_teams_stats

