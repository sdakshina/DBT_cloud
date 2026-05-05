{%macro macro_for_loop(a,b)%}
{%set z=[a,b]%}
{%for i in z%}
upper({{i}}) as z
{% if not loop.end %}
, 
{%endif%}
{%endfor%}
{%endmacro%}