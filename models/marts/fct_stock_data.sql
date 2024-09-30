{{ config(
    materialized='table',
    schema='stock_dataset',
) }}

with stock as (
    select * from {{ ref('stg_stock_data') }}
)

select 
    *
from stock
