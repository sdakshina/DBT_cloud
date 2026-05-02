select * from {{source('dev','dummy')}}
where customer_name is null