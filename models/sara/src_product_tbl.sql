{{
    config(
        materialized = 'table'
    )
}}

select {{sara_upper('product_name')}} as f_name, {{sara_upper("'upper'")}} as l_name,
{{sara_concat('product_name','category')}} as concat_value, 
{{surogate_key(['product_id','product_name','category'])}} sk, *
from {{source('dev','SRC_PRODUCT')}}
