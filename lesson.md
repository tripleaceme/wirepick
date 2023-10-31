## dbt for Novice

The following commands will be covered in the article below.

- dbt run
- dbt run -f or dbt run --full-refresh
- dbt test
- dbt init project_name : to initialize a project name alongside the DWH profile
- dbt clean : to clean up your dbt project
- dbt source freshness : to test the freshness i.e how upated the data is
- dbt test --select source:schema_name or dbt test --select model_name : allows you run a specific test 
- dbt docs generate : create docs for your dbt project
- dbt docs serve : execute the docs for you for viewing in a browser
- dbt compile : to run the sql files stored in the analyses folder
- dbt seed: pulls your files from the seeds folder and model it as a table in the warehouse. It's important to note that seeds shouldn’t have large or frequently changing data.
- dbt run --target prod : to run dbt on the target database becuase dbt run will affect dev database by default
-- {{ ref(model_name) }} e.g {{ ref('int_payment_type_ammount_per_order' )}}
-- {{ source('schema', 'table') }} e.g {{ source('jaffle_shop', 'customers') }}
-- "{{ doc('column_name') }}" e.g "{{ doc('is_order_completed_docblock') }}" : use to serve the data of the column in dbt doc via markdown

-  [Test Selection in Dbt](https://docs.getdbt.com/reference/node-selection/test-selection-examples)