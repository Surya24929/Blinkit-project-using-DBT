{% macro date(args) %}
    TO_DATE({{args}}) 

{% endmacro %}