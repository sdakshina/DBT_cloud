{{
    config(
        materialized = 'table'
    )
}}

select *, current_timestamp() as data_load_date from japan.dev.employees
where first_name is not null and last_name is not null and salary is not null