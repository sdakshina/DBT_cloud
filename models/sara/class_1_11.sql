select '000'||customer_id as customer_id, first_name||last_name as full_name,
case when country = 'Japan' then 'jp' else 'N/A' end country from {{ref('class_1_1')}}