select
 orderid as order_id
--,paymentmethod
-- ,status
,sum(amount) as amount
-- ,created
--,_batched_at
from raw.stripe.payment
group by
orderid