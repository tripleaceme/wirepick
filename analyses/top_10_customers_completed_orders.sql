-- Top 10 most valueable customers

/*SELECT customer_id, sum(total_amount) as amount_spent
FROM {{ ref("fct_orders") }}
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10
*/

-- Modified version to include customer Full name | Method 1

SELECT a.customer_id, 
        concat(first_name, " ", last_name) AS Full_Name, 
        sum(total_amount) AS amount_spent

FROM {{ ref("fct_orders") }} a
JOIN {{ ref("dim_customers") }} c
ON a.customer_id = c.customer_id
GROUP BY 1 , 2 -- customer_id and Full name
ORDER BY 3 DESC
LIMIT 10