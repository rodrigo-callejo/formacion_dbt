with  customers as (
    select * from {{ref("stg_jaffle_shop__customers")}}
)
,orders as (
    select * from {{ref("stg_jaffle_shop__orders")}}
)
, payments as  (
    select * from {{ref("stg_stripe__payments")}}
)
, final as (
    select 
        o.order_id
        ,o.customer_id
        ,p.amount as amount
    from orders o
    left join payments p on o.order_id=p.order_id
)
select * from final