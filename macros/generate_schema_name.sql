/*
Custom schema logic
*/
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set target_schema_name = target.schema -%}
    {{ log('custom_schema_name=' ~ custom_schema_name, info=True) }}
    {{ log('target_schema_name=' ~ target_schema_name, info=True) }}

    {%- if custom_schema_name is none -%}
        {{ target_schema_name | trim }}
    {%- elif target_schema_name | lower in ('default', 'none', 'prod') -%}
        {{ custom_schema_name | trim }}
    {%- else -%}
        {{ target_schema_name }}_{{ custom_schema_name | trim }}
    {%- endif -%}

{%- endmacro %}