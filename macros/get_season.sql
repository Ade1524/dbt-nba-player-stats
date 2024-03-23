{% macro get_season(current_year) %}
  {{ return (current_year ~ "::varchar || ' - ' || (" ~ current_year ~ " + 1)::varchar") }}
{% endmacro %}