-- {%  macro first_macro(a,b) %}
--     {% set col =[a,b] %}
--     {% for i in col %}
--         upper({{i}}),
--     {% endfor %}

-- {% endmacro %}