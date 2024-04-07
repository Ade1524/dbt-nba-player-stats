with unique_nba_players_id as (
    select {{ dbt_utils.generate_surrogate_key(['player_id', 'player_full_name']) }} as players_key
          ,player_id
          ,player_year_of_birth
          ,player_full_name
          ,year_of_birth
      from {{ ref('stg_nba_player_rookies_stats_1980_2023') }}
)

select * from unique_nba_players_id