{{ config(
    materialized='view',
    schema='stock_dataset',
) }}

SELECT
    CAST(Date AS DATE) AS date,
    Stock_Code AS stock_code,
    Close AS close
FROM {{ source('stock_dataset', 'stock_data') }}