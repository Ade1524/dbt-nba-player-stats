with team_champion as (
    select * from {{ ref('nba_champions')}}
)

-- select * from team_champion

, renaming_champions_columns as (
    select {{ get_season('year') }} as seasons
            ,champion as champion_team
            ,runner_up as runner_up__team
            ,league
      from team_champion
     order by seasons
)

select * from renaming_champions_columns