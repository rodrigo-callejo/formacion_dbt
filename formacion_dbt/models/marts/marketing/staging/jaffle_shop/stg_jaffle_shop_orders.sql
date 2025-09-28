with source as (
        select * from {{ source('jaffle_shop', 'orders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("id") }},
        {{ adapter.quote("user_id") }},
        {{ adapter.quote("order_date") }},
        {{ adapter.quote("status") }},
        {{ adapter.quote("_etl_loaded_at") }}

      from source
  )
  select * from renamed
    