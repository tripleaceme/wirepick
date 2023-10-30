-- Implementing a singular test options to ensure we don't have -ve total amount. dbt test --select source:schema
-- dbt test --select source:stripe
select
    orderid as order_id,
    sum(amount) as total_amount
from {{ source('stripe', 'payment') }}
group by 1
having total_amount < 0
