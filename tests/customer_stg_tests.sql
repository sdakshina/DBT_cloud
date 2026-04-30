select *
 from 
 (select count(*) as stg_cnt from {{ref('customer_stg')}}) a,
(select  count(*) as src_cnt from {{source('DEV','customers')}}) b
where a.stg_cnt<>b.src_cnt
