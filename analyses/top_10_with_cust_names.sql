-- Most valuabble customers with first name

-- Modified version to include customer Full name | Method 2

with fct_orders as (

        select * from {{ ref('fct_orders')}}
    ),

dim_customers as (
    
        select * from {{ ref('dim_customers' )}}
    
    ) 
        
    select
        cust.customer_id,
        concat(cust.first_name," ", cust.last_name) AS Full_Name,
        SUM(total_amount) AS global_paid_amount
        
    from fct_orders as ord
    left join dim_customers as cust ON ord.customer_id = cust.customer_id
    where ord.is_order_completed = 1
    group by cust.customer_id, Full_Name
    order by 3 desc
    limit 10