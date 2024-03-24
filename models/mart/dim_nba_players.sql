with unique_nba_players_id as (
    select player_id
          ,player_full_name
      from {{ ref('stg_nba_player_rookies_stats_1980_2023') }}
)

select * from unique_nba_players_id