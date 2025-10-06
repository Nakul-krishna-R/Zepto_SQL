drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
wieghtInGMs INTEGER,
outofstock BOOLEAN,
quantity INTEGER
);

--Data Exploration

--count of rows
SELECT Count(*) FROM zepto;

--sample data 
SELECT * FROM zepto
LIMIT 10;

--Null values
SELECT * FROM zepto
WHERE name IS NULL
OR 
category IS NULL
OR
mrp IS NULL
or
discountpercent IS NULL
or
availablequantity IS NULL
or
discountedsellingprice IS NULL
or
wieghtingms IS NULL
or
outofstock IS NULL
or
quantity IS NULL

--different product categories
SELECT DISTINCT category
from zepto 
order by category;

--product in stock vs out of stock
SELECT outofstock, Count(sku_id)
from zepto
group by outofstock;

--product names present multiple times 
select name,count(sku_id) as "Number of SKUs"
FROM zepto
GROUP by name
HAVING count(sku_id)>1
ORDER By count(sku_id) DESC;

--data cleaning


--products price = 0 
SELECT * from zepto
where mrp = 0 or discountedSellingPrice=0; 

delete from zepto 
where mrp =0;

--convert paisa to rupees
UPDATE zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

--checking the update
SELECT mrp, discountedSellingPrice FROM zepto

--Insights

--Q1. Find the top 10 best-value products based on the discount percentage.
Select distinct name, mrp, discountPercent
from zepto
order by discountPercent DESC
Limit 10;

--Q2. What are the Products with high MRP but out of stock
select distinct name, mrp
from zepto
where outofstock = TRUE and mrp >300
order by mrp DESC;

--Q3. Calculate estimated revenue for each category
SELECT category,
Sum(discountedSellingPrice * availableQuantity) AS total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp> 500 and discountPercent < 10
order by mrp DESC, discountPercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,
ROUND(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount DESC
Limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, wieghtInGMs, discountedSellingPrice,
ROUND(discountedSellingPrice/wieghtInGMs,2) As price_per_gram
from zepto
Where wieghtInGMs>=100
order by price_per_gram;

--Q7. Group the products into categories like low, Medium, Bulk.
Select distinct name, wieghtInGMs,
CASE when wieghtInGMs < 1000 Then 'Low'
	When wieghtInGMs < 5000 Then 'Medium'
	Else 'Bulk'
	End as weight_category
from zepto;

--Q8. What is the Total Inventory Weight per category.
Select category,
SUM(wieghtInGMs * availableQuantity) As total_weight
from zepto
group by category
order by total_weight;