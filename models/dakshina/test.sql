select region,{{if_macro()}} from {{source('DEV','SALES')}}
group by region