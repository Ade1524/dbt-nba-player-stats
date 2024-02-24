NBA_Player_Stats as (
    select * from {{ ref('NBA_Player_Stats') }}
)

select * from NBA_Player_Stats