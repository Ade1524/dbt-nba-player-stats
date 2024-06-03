with table_players as (
    select *
     from {{ ref('int_nba_player_stats__all_players_rookie_playoffs') }}
)
, players as (
    select {{ dbt_utils.generate_surrogate_key(['player_id', 'player_name', 'year_of_birth']) }} as player_key
          ,player_id
          ,player_name
          ,year_of_birth
     from table_players
)

select * from players