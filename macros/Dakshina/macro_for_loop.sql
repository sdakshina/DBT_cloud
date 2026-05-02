{%macro macro_for_loop(a,b)%}
{%set z=[a,b]%}
{%for i in z%}
upper({{i}})
{% if not loop.first %}, {% endif %}
{%endfor%}
{%endmacro%}