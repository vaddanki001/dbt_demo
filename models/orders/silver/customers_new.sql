{{ config(
  materialized='table',
  schema='silver',  
  file_format='delta'
) }}

with source as (


    select * from  {{source('bronze','customers')}}

),

renamed as (

    select
        id as Customer_ID,    
        first_name as First_Name,
        last_name as Last_Name,
        email as Email

    from source

)

select * from renamed