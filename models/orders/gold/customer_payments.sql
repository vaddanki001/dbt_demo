{{ config(
    materialized='table',
    schema='gold', 
    file_format='delta'      
) }}


with payments as (

    select * from  {{ref('payments_new')}}

),

orders as (

    select * from  {{ref('orders_new')}}


),

final as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders using (order_id)

    group by 1

)

select * from final