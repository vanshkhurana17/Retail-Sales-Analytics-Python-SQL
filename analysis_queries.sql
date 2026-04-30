use practice

select *
from sales

//revenue for each payment method
select payment_method, sum(total) as total_sales
from sales
group by payment_method
order by total_sales desc

//most preferred payment method
select payment_method, count(*) as count
from sales
group by payment_method
order by count desc

//min,max and avg rating for each category
select category, min(rating),max(rating),avg(rating) 
from sales
group by category

//branch-wise performance
select Branch, sum(total) as revenue, count(*) as total_transactions, avg(rating) as avg_rating
from sales
group by Branch
order by revenue desc, avg_rating desc

//avg rating by branch and category
select Branch, Category, avg(rating) as avg_rating
from sales
group by Branch, Category
order by Branch asc

//TOTAL REVENUE BY CITY AND BRANCH
select City, Branch, sum(total) as revenue
from sales
group by City, Branch
order by revenue desc
limit 3

//category with highest revenue
select Category, sum(total) as revenue
from sales
group by Category
order by revenue desc

//time based analysis of each record
select time, CAST(time as time), case 
when CAST(time as time)<'12:00:00' then 'Morning'
when CAST(time as time)>='17:00:00' then "Evening"
else "Afternoon"
end as TOD
from sales

//top 3 revenue generating categories for each branch

with cte as
(
select Branch, Category, sum(total) as revenue, rank() over (partition by Branch order by sum(total) desc) as rnk
from sales
group by Branch, Category)

select *
from cte
where rnk<=3


//Top 2 revenue-generating categories per branch.
select Branch, revenue, rnk
from
(
select Branch, Category, sum(total) as revenue, rank() over (partition by Branch order by sum(total) desc) as rnk
from sales
group by Branch, Category
) as t
where rnk<=2



//cumulative revenue per branch over time

select Branch,STR_TO_DATE(date, '%d/%m/%y') AS sale_date, sum(total) over(partition by Branch order by STR_TO_DATE(date, '%d/%m/%y') asc) as cum_revenue
from sales
order by sale_date, Branch


// Percentage contribution of categories to total revenue in each branch

WITH cte AS
(
select Branch, Category, sum(total) as revenue
from sales
group by Branch, Category
)

select *, sum(revenue) over (partition by Branch), (revenue/sum(revenue) over (partition by Branch))*100  
From cte
order by Branch asc

//Identify branches where a category has high revenue but low average rating.
WITH cte AS
(
select Branch, Category, sum(total) as revenue, avg(rating) as avg_rating
from sales
group by Branch, Category
)

select *
from (select *, sum(revenue) over (partition by Branch) as br_revenue, avg(avg_rating) over(partition by Branch) as br_avg_rating
from cte) t 
where avg_rating<br_avg_rating AND revenue> 0.03*(br_revenue)

