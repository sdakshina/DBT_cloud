{%macro macro_cnt()%}

(select count(*) from {{this}})

{%endmacro%}