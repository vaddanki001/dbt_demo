{{ config(
  materialized='table',
  schema='silver',
  file_format='delta'
) }}

with source as (  

    select * from {{source('bronze','payments')}}

),
renamed as (

    select
        id as Payment_ID,
        order_id as Order_ID,
        payment_method as Payment_Method,
        --amount is currently stored in cents, so we convert it to dollars
        amount / 100 as Amount
    from source

)
select * from renamed