{% macro surogate_key(col_name) %}
    md5(
    {% for i in col_name %}
        coalesce(cast({{i}} as varchar),' ')
        {% if not loop.last %} || '|' || {% endif %}      
    {% endfor %}
    )
{% endmacro %}