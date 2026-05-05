{{
    config(
    materialized = 'incremental',
    incremental_strategy = 'delete+insert',
    unique_key = 'TRANS_ID',
    pre_hook = ["insert into {{source('dev','bank_audit')}} (audit_id , job_name , start_time , end_time ,status)
    values ('{{invocation_id}}', '{{this}}',current_timestamp(),null,'starting')"],
    post_hook = ["truncate table {{source('dev','dummy')}}",
    "update {{source('dev','bank_audit')}} set end_time = current_timestamp(), status ='completed'
    where start_time = (select coalesce(max(start_time),'1900-12-31') from {{source('dev','bank_audit')}})"]
    )
}}

select * from {{source('dev','dummy')}}
where CREATED_TS >= (select coalesce(max(CREATED_TS), '1900-12-31') from {{source('dev','dummy')}}) 
