{{
    config(
        materialized = 'table'
    )
}}

select * from japan.dev.employees
where first_name is not null and last_name is not null and salary is not null