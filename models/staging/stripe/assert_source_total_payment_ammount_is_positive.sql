-- Implementing a singular test options to ensure we don't have -ve total amount. dbt test --select source:schema
-- dbt test --select source:stripe
select
    order_id,
    sum(total_amount) as total_amount
from {{ source('stripe', 'payment') }}
group by 1
having total_amount < 0
