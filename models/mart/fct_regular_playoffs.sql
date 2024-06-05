with playoffs as (
    select *
     from {{ ref('int_nba_player_stats__playoffs_players_added_team_name') }}
)

,regular as (
    select *    
     from {{ ref('int_nba_player_stats__players_without_tot_adding_team_name') }}
)

,regular_plus_playoffs as (

    select    count(1) as num_records
        --    {{ dbt_utils.generate_surrogate_key(['r.seasons']) }} as dim_season_key
        --   ,{{ dbt_utils.generate_surrogate_key(['r.player_id', 'r.player_name', 'r.year_of_birth']) }} as dim_player_key
        --   ,{{ dbt_utils.generate_surrogate_key(['teams', 'team_name']) }} as dim_team_key
        --   ,r.*
        --   ,p.*
      from regular r
    --   left join playoffs p on p.player_id = r.player_id and p.teams = r.teams and p.seasons = r.seasons
)

select * from regular_plus_playoffs
