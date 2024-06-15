{% macro get_season(current_year) %}
  {{ return ("(" ~ current_year ~ " - 1)::varchar || '-' || " ~ current_year ~ "::varchar") }}
{% endmacro %}