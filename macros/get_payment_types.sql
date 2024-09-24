{% macro get_column_values(column_name, table_name) %}
    {% set relation_query %}
        select distinct
            {{ column_name }}
        from {{ table_name }}
        order by 1
    {% endset %}

    {% set results = run_query(relation_query) %}

    {% if execute %}
        {# 最初の列を返す #}
        {% set results_list = results.columns[0].values() %}
    {% else %} {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}

{% endmacro %}

{# 一意の支払いタイプを取得するマクロ #}
{% macro get_payment_types() %}
    {{ return(get_column_values("payment_type", ref("stg_stripe_order_payments"))) }}
{% endmacro %}

{# 一意の支払い方法を取得するマクロ #}
{% macro get_payment_methods() %}
    {{ return(get_column_values("payment_method", ref("stg_stripe_order_payments"))) }}
{% endmacro %}
