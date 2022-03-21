{{ config(
  materialized='table',
  schema='silver',
  file_format='delta'
) }}


with source as (


    select * from {{source('bronze','orders')}}

),

renamed as (

    select
        id as Order_ID,
        user_id as Customer_ID,
        order_date as Order_Date,
        status as Status

    from source

)

select * from renamed