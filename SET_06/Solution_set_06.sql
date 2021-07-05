use practice

create table sales(
customer_id varchar(5),
order_date date,
product_id int
);

Create table members(
customer_id varchar(2), 
join_date timestamp
);

create table menu(
product_id int,
product_name varchar(5),
price int );

insert into menu (product_id, product_name, price)
values 
(1, 'sushi', 10),
(2, 'curry', 15),
(3, 'ramen', 12);
Select * from menu

insert into members (customer_id, join_date)
values
('A', '2021-01-07'),
('B', '2021-01-09');
select * from members

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
  select * from sales
  
  
  -- 1.What is the total amount each customer spent at the restaurant?
  select customer_id, sum(price) from sales 
  inner join menu on menu.product_id = sales.product_id
  group by customer_id
  
-- 2.How many days has each customer visited the restaurant?
select customer_id , count(order_date) from sales group by 1

-- 3.What was the first item from the menu purchased by each customer?
select customer_id,  product_name from sales
inner join menu on menu.product_id = sales.product_id
group by 1

-- 4.What is the most purchased item on the menu and how many times was it purchased by all customers?
select product_name, count(customer_id) , customer_id from sales
inner join menu on sales.product_id = menu.product_id
group by 1
ORDER BY 2 DESC
LIMIT 1

-- 5. Which item was the most popular for each customer?
SELECT Temp.customer_id,Temp.product_name
FROM (SELECT customer_id,product_name,COUNT(product_name) as val
      FROM sales INNER JOIN menu
      ON sales.product_id=menu.product_id
      GROUP BY 1,2
      ORDER BY val DESC) AS Temp
GROUP BY 1
ORDER BY 1

-- 6.Which item was purchased first by the customer after they became a member?
select menu.product_name , sales.customer_id from sales, members, menu
where sales.customer_id = members.customer_id
And sales.product_id = menu.product_id
And sales.order_date >= members.join_date
group by 1
order by 1, sales.order_date

-- 7.Which item was purchased just before the customer became a member?
SELECT sales.customer_id,menu.product_name
FROM sales,members,menu
WHERE sales.customer_id=members.customer_id 
      AND sales.product_id=menu.product_id 
      AND sales.order_date<members.join_date
GROUP BY 1
ORDER BY 1,sales.order_date DESC

-- 8.What is the total items and amount spent for each member before they became a member?
select sales.customer_id, count(menu.product_name), sum(menu.price) from sales, menu, members
where menu.product_id = sales.product_id
And sales.customer_id = members.customer_id
And members.join_date > sales.order_date
group by 1
order by 1

-- 9.If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select sales.customer_id, menu.product_name, menu.price ,
case 
when product_name = 'sushi' then price*20
else price*10
end as points 
from sales, menu
group by 1

-- 10.In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

SELECT Temp.customer_id,SUM(Temp.points) AS "Total Points"
FROM (SELECT sales.customer_id,sales.order_date,members.join_date,DATE_ADD(join_date, INTERVAL 1 WEEK),menu.product_name,menu.price,
                        CASE
                            WHEN menu.product_name="sushi" THEN menu.price*20
                            WHEN order_date 
                                      BETWEEN members.join_date 
                                         AND DATE_ADD(join_date, INTERVAL 1 WEEK) 
                                           THEN menu.price*20
                            ELSE menu.price*10
                        END AS points
    FROM sales,members,menu
    WHERE sales.customer_id=members.customer_id 
          AND sales.product_id=menu.product_id
          AND order_date<'2021-02-01'           -- Calculating for dates before february
    ORDER BY 1,sales.order_date) AS Temp

GROUP BY 1
ORDER BY 1

-- 11.Recreating the table 
SELECT Temp.customer_id,Temp.order_date,menu.product_name,menu.price,
    CASE
        WHEN Temp.order_date>=Temp.join_date THEN "Y"
        ELSE "N"
    END AS member
FROM (SELECT sales.customer_id,sales.order_date,members.join_date,sales.product_id
    FROM sales LEFT JOIN members
    ON sales.customer_id=members.customer_id) AS Temp,menu
WHERE Temp.product_id=menu.product_id
ORDER BY 1,Temp.order_date,menu.price DESC
