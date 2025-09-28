with source as (
        select * from {{ source('stripe', 'payment') }}
  ),
  renamed as (
      select
          {{ adapter.quote("id") }},
        {{ adapter.quote("orderid") }},
        {{ adapter.quote("paymentmethod") }},
        {{ adapter.quote("status") }},
        {{ adapter.quote("amount") }},
        {{ adapter.quote("created") }},
        {{ adapter.quote("_batched_at") }}

      from source
  )
  select * from renamed
    