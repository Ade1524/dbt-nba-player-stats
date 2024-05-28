with table_players_in_the_playoffs as (
    select * 
     from {{ ref('int_player_playoffs__add_team_name_player_table') }}
)
, playoffs_players as (
    select player_id
          ,player_name
          ,year_of_birth
     from table_players_in_the_playoffs
)

select * from playoffs_players