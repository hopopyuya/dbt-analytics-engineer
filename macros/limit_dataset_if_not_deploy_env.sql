{% macro limit_dataset_if_not_deploy_env(column_name, nbr_months_of_data) %}
    {# デプロイ環境でない場合はデータを制限する #}
    {% if target.name != "deploy" %}
        and {{ column_name }}
        >= date_sub(current_date(), interval {{ nbr_months_of_data }} month)
    {% endif %}
{% endmacro %}
