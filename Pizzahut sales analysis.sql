create database pizzahut;

create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key (order_id) 
);

create table order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key (order_details_id) 
);

 select * from pizzahut.pizzas;
 
 select * from pizzahut.pizza_types;
 
 select * from pizzahut.orders;
 
 select * from pizzahut.order_details;


-- Basic Questions :

-- 1. Retrieve the total number of orders placed.
select count(order_id) as Total_Orders 
from pizzahut.orders;

-- 2. Calculate the total revenue generated from pizza sales.
select round(sum(p.price * od.quantity),2) as Total_Revenue
from pizzahut.pizzas p 
join pizzahut.order_details od 
on p.pizza_id = od.pizza_id;

-- 3. Identify the highest-priced pizza.
select pt.name, p.price
from pizzahut.pizzas p 
join pizzahut.pizza_types pt 
on p.pizza_type_id = pt.pizza_type_id
order by p.price desc
limit 1;

-- 4. Identify the most common pizza size ordered.
select p.size, count(od.order_details_id) as Total_Orders
from pizzahut.pizzas p
join pizzahut.order_details od
on p.pizza_id = od.pizza_id
group by p.size
order by Total_Orders desc;

-- 5. List the top 5 most ordered pizza types along with their quantities.
select pt.name, sum(od.quantity) as Total_Quantities
from pizzahut.pizza_types pt
join pizzahut.pizzas p
on pt.pizza_type_id = p.pizza_type_id
join pizzahut.order_details od
on p.pizza_id = od.pizza_id
group by pt.name
order by Total_Quantities desc
limit 5;

-- Intermediate Questions:

-- 1. Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category, sum(od.quantity) as Total_Quantity
from pizzahut.pizza_types pt 
join pizzahut.pizzas p 
on pt.pizza_type_id = p.pizza_type_id
join pizzahut.order_details od
on od.pizza_id = p.pizza_id
group by pt.category
order by Total_Quantity desc;

-- 2. Determine the distribution of orders by hour of the day.
select hour(order_time) as hours, count(order_id) as Total_Orders
from pizzahut.orders 
group by hours;

-- 3. Join relevant tables to find the category-wise distribution of pizzas.
select pt.category, count(pt.name) as Pizza_count
from pizzahut.pizza_types pt
group by  pt.category;

-- 4. Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(Total_Quantity),0) as avg_Total_Quantity
from(
select o.order_date, sum(od.quantity) as Total_Quantity
from pizzahut.orders o 
join pizzahut.order_details od 
on o.order_id = od.order_id
group by o.order_date) as Order_Quantity;
	
-- 5. Determine the top 3 most ordered pizza types based on revenue.
select pt.name, round(sum(p.price * od.quantity),2) as Total_Revenue
from pizzahut.pizza_types pt
join pizzahut.pizzas p 
on pt.pizza_type_id = p.pizza_type_id
join pizzahut.order_details od 
on p.pizza_id = od.pizza_id 
group by pt.name
order by Total_Revenue desc 
limit 3;

-- Advanced Questions:

-- 1. Calculate the percentage contribution of each pizza type to total revenue.
select pt.category, round(sum(od.quantity * p.price) / (select round(sum(od.quantity * p.price),2) as Total_Sales
from pizzahut.order_details od
join pizzahut.pizzas p 
on od.pizza_id = p.pizza_id) * 100,2) as revenue
from pizzahut.pizza_types pt 
join pizzahut.pizzas p
on pt.pizza_type_id = p.pizza_type_id
join pizzahut.order_details od
on p.pizza_id = od.pizza_id
group by pt.category
order by revenue desc;

-- 2. Analyze the cumulative revenue generated over time.
select order_date, 
sum(revenue) over(order by order_date) as cumm_Revenue
from 
(select o.order_date,round(sum(p.price * od.quantity),2) as Revenue
from pizzahut.orders o 
join pizzahut.order_details od 
on o.order_id = od.order_id 
join pizzahut.pizzas p 
on od.pizza_id = p.pizza_id 
group by o.order_date
order by Revenue) as Sales;

-- 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name, Revenue from
(select category, name, Revenue,
rank() over(partition by category order by Revenue desc) as rn
from
(select pt.category, pt.name, round(sum(p.price * od.quantity),2) as Revenue
from pizzahut.pizza_types pt
join pizzahut.pizzas p 
on pt.pizza_type_id = p.pizza_type_id
join pizzahut.order_details od
on p.pizza_id = od.pizza_id
group by pt.category, pt.name) as a) as b
where rn <= 3;
