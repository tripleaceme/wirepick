-- Implementing a singular test options to ensure we don't have -ve total amount. use dbt test --select model_name

select
    order_id,
    sum(total_amount) as total_amount
from {{ ref('int_payment_type_ammount_per_order') }}
group by 1
having total_amount < 0