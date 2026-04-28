{{
    config(
        materialized='incremental'
    )
}}
select employee_id, concat(trim(first_name), trim(last_name)) as full_name,
email, phone_number, upper(job_id) job_id, salary , load_time, data_load_date from 
{{ref('stg_employee')}}
{% if is_incremental()%}
where data_load_date > (select coalesce(max(data_load_date),'2999-12-31') from {{this}})
{%endif%}