select 'duplicate transactions' validation_type ,
transaction_id,
count(*) issue_count
from {{ref('dim_bank_transactions')}}
group by transaction_id
union all

select 'missing account number' validation_type,
transaction_id,
null
from {{ref('dim_bank_transactions')}}
where account_number is null
union all

select 'negative balance' validation_type,
transaction_id,
null
from {{ref('dim_bank_transactions')}}
where available_balance <0
union all

select 'high amount transaction' validation_type,
transaction_id,
null
from {{ref('dim_bank_transactions')}}
where amount >5000
