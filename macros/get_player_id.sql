{% macro get_player_id(player_name, year_of_birth) %}
  {{ return ("concat(
                replace(
                    lower(" ~ player_name ~ "),
                    ' ',
                    '_'
                ),
                '_',
                " ~ year_of_birth ~ "
            )::varchar"
    ) }}
{% endmacro %}