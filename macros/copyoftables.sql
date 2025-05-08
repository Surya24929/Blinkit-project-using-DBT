{% macro copyoftable(trg_db, trg_sc, src_db, src_sc, table_list) %}

-- Create target database if not exists
{% set create_db %}
    create database if not exists {{ trg_db }}
{% endset %}
{% do run_query(create_db) %}

-- Create target schema if not exists
{% set create_schema %}
    create schema if not exists {{ trg_db }}.{{ trg_sc }}
{% endset %}
{% do run_query(create_schema) %}

-- Loop through each table to clone
{% for table in table_list %}
    {% set clone_table %}
        create or replace table {{ trg_db }}.{{ trg_sc }}.{{ table }}
        clone {{ src_db }}.{{ src_sc }}.{{ table }}
    {% endset %}
    {% do run_query(clone_table) %}
{% endfor %}

{% endmacro %}