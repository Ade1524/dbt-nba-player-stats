{% macro get_year_of_birth(year, age) %}
  {{ return ("(" ~ year ~ "::int - 1) - " ~ age ~ "::int"
    ) }}
{% endmacro %}