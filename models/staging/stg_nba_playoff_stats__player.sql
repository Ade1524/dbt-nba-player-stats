with nba_playoff_stats__players as (
    select * from {{ ref('nba_playoff_stats')}}
)

select * from nba_playoff_stats__players

