with nba_rookies_stats__players as (
    select * from {{ ref('nba_total_rookies_stats_1980_2023')}}
)


select * from nba_rookies_stats__players