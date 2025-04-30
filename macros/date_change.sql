{% macro date_change(date_column) %}
    to_date({{ date_column }})

{% endmacro %}