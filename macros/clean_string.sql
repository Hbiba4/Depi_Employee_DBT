{% macro clean_string(column_name) %}
    NULLIF(LTRIM(RTRIM({{ column_name }})), '')
{% endmacro %}
