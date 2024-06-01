use practice;
select * from data;
alter table data
add column Sales_volume int;
update data
set Sales_volume = case 
when Numeric_sales_volume = '10K' then 10000
when Numeric_sales_volume = '800' then 800
when Numeric_sales_volume = '20K' then 20000
when Numeric_sales_volume = '0' then 0
when Numeric_sales_volume = '1K' then 1000
else Sales_volume
end;

-- Q.1 Which products have the highest number of ratings?

select Asin, Product_Title, Product_Num_Ratings from data
order by product_num_ratings desc
limit 10;

-- Q.2 What is the percentage difference between product price and original price?

select Asin, Product_Title, 
round(((Product_original_price - Product_price)/Product_original_price)*100,2)
as Price_Difference_Percentage
from data
where Product_original_price > 0;

-- Q.3 What is the average sales volume for products with different star ratings?

select Product_Star_Rating,
round(avg(Sales_Volume)) AS Average_Sales_Volume
FROM data
where Sales_Volume>0
GROUP BY Product_Star_Rating;


-- Q.4 Calculate the Average Star Rating for Products with More Than 100 Ratings

select Product_Title, Currency, avg(Product_star_rating) as Average_Star_Rating
from data
where product_num_ratings > 100
group by Currency, Product_Title;

-- Q.5 Which products have the largest price drop (original price - current price)?

select Asin,Product_Title, round((product_original_price-product_price),2) as Price_Drop
from data
where product_original_price >0
order by Price_Drop desc
limit 1



