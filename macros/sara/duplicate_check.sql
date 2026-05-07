{% macro duplicate_check(table, pks ) %}
    select 
    {% for i in pks %}
        {{pks}}
        {% if not loop.last %} 
            ,
        {% endif %} 
    {% endfor %}
    , count(*)
    from {{ref(table)}}
    group by
    {% for i in pks %}
        {{pks}}
        {% if not loop.last %} 
            ,
        {% endif %}
    {% endfor %} 
    having count(*) >1
{% endmacro %}