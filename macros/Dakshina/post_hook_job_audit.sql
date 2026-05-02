{%macro post_hook_job_audit()%}

update {{source('DEV','job_audit')}} set 
end_time=current_timestamp,
process_cnt={{macro_cnt()}}
where id='{{ invocation_id }}' and model_name='{{this}}'

{%endmacro%}