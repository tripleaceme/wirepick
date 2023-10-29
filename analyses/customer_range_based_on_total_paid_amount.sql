-- All customer with sales and classifications
with fct_orders as (

        select * from {{ ref('fct_orders')}}
    ),

dim_customers as (
    
        select * from {{ ref('dim_customers' )}}
    
    ),

all_customer_sales as (
        
    select
        cust.customer_id,
        concat(cust.first_name," ", cust.last_name) AS Full_Name,
        SUM(total_amount) AS global_paid_amount
        
    from fct_orders as ord
    left join dim_customers as cust ON ord.customer_id = cust.customer_id
    where ord.is_order_completed = 1
    group by cust.customer_id, Full_Name
        ),

sales_class as (
    SELECT * 
    FROM {{ ref("customer_range_per_paid_ammount") }} -- we can use our seed table in our model as well.
)

SELECT customer_id,
       Full_Name, 
       global_paid_amount, 
       classification

FROM all_customer_sales ac 
JOIN sales_class sc 
ON ac.global_paid_amount >= sc.min_range AND ac.global_paid_amount <= sc.max_range;
-- ORDER BY 3 DESC LIMIT 10;