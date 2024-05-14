{% macro clean_player_name(player_name) %}
  {{ return ("replace(replace(" ~ player_name ~ ",'*'), '-', ' ')::varchar") }}
{% endmacro %}