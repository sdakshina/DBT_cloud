{{config(
    materialized='table'
)}}

select transaction_id,
account_number,
trim(customer_name) as customer_name,
transaction_type,
amount,
available_balance
from {{ref('bank_transaction')}}
