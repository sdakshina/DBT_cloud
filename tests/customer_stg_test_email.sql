select count(*) from {{ref('customer_stg')}}
where email not like '%@email.com'