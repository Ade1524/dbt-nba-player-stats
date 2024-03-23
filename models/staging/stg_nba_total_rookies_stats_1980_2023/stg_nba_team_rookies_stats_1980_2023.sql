with nba_rookies_stats__players as (
    select * from {{ ref('nba_total_rookies_stats_1980_2023')}}
)

, renaming_columns_rookie_teams_stats  as (

    select  id::int as player_id
            ,replace(player, '-', ' ')::varchar(1000)  as player_full_name
            ,tm::varchar(1000) as team
            ,age::int
            ,{{ get_season('year') }} AS season_id
            ,yrs::int as years_in_the_league
            ,g::int as games_played
            ,team::varchar(1000) as team_full_name
            ,w::int as win_total_during_the_season
            ,l::int as lose_total_during_the_season
            ,w_l_pct::float as win_loss_percentage
            ,gb::float as team_games_behind
            ,ps_g::float as points_per_game
            ,pa_g::float as opponents_points_per_game
            ,srs::float as simple_rating_system
      
      from nba_rookies_stats__players       
)

select * from renaming_columns_rookie_teams_stats
