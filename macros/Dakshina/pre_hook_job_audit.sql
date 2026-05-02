{%macro pre_hook_job_audit()%}

insert into {{source('DEV','job_audit')}} (model_name,id,start_time,usr)
    values('{{this}}','{{ invocation_id }}',current_timestamp(),current_user)

{%endmacro%}