-- we want to incrementally load data from bronze_sales model

{% set inc_flag = 1 %}
{% set last_load = 3 %}

{% set col_names = ["sales_id", "date_sk", "order_amount"]%}

SELECT 
    {% for col_name in col_names %}
        {{ col_name }}{%if not loop.last %}, {%endif%}
    {% endfor %}
FROM 
    {{ ref('bronze_sales') }}

{% if inc_flag == 1 %}
    WHERE date_sk > {{ last_load }}
{% endif %}

