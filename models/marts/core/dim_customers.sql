with customers as (
    select * from {{ ref('stg_jaffle_shop_customers')}} -- ref('model_name') allows us to reference another model in another model
    ) 
    
    
select
    c.customer_id,
    c.first_name,
    c.last_name
from customers c