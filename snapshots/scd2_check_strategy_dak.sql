{% snapshot scd2_check_strategy_dak %}


{{
    config
    (
        unique_key='customer_id',
        strategy='check',
        check_cols=['first_name','last_name','email']
    )
}}

select CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, CITY, STATE, CREATED_AT
 from {{source('DEV','SCD_SOURCE')}}


{% endsnapshot %}