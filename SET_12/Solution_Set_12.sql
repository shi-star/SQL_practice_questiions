use pizza_runner

-- 1.How many pizzas were ordered?
select count(*) as 'no. of pizzas ordered' from customer_orders

-- 2.How many unique customer orders were made?
select distinct customer_id from customer_orders

-- 3.How many successful orders were delivered by each runner?
select runner_id , count(*) from runner_orders 
where cancellation is NULL or cancellation not in ( 'Restaurant Cancellation', 'Customer Cancellation')
group by runner_id

-- 4. How many of each type of pizza was delivered?
select pizza_name, count(*) from customer_orders
inner join pizza_names on pizza_names.pizza_id = customer_orders.pizza_id
INNER JOIN runner_orders
ON customer_orders.order_id = runner_orders.order_id
WHERE cancellation IS NULL
OR cancellation NOT IN ('Restaurant Cancellation', 'Customer Cancellation')
group by pizza_name

-- 5.How many Vegetarian and Meatlovers were ordered by each customer?
select customer_id , 
sum(case when pizza_id = 1 then 1 else 0 end) as 'Meat lovers',
sum(case when pizza_id = 2 then 1 else 0 end) as 'vegetarian'

from customer_orders
group by customer_id

-- 6. What was the maximum number of pizzas delivered in a single order?
select max(pizza_count) from
(select customer_orders.order_id,  count(customer_orders.order_id) as pizza_count
from customer_orders
inner join runner_orders on runner_orders.order_id = customer_orders.order_id
where runner_orders.cancellation is null or runner_orders.cancellation not in ('Restaurant Cancellation', 'Customer Cancellation')
group by order_id) as my_count

-- 7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
select customer_id , 
sum( case when customer_orders.exclusions is not null or customer_orders.extra is not null then 1 else 0 end) as 'changes_made',
sum( case when customer_orders.exclusions is null or customer_orders.extra is null then 1 else 0 end) as 'no_change'
from customer_orders 
inner join runner_orders on runner_orders.order_id = customer_orders.order_id
where runner_orders.cancellation is null or runner_orders.cancellation not in ('Restaurant Cancellation', 'Customer Cancellation')
group by customer_id
order by customer_id

-- 8.How many pizzas were delivered that had both exclusions and extras?
select 
sum(case when exclusions is not null and extra is not null then 1 else 0 end) as 'both'
from customer_orders
inner join runner_orders on runner_orders.order_id = customer_orders.order_id
where runner_orders.cancellation is null or runner_orders.cancellation not in ('Restaurant Cancellation', 'Customer Cancellation')




