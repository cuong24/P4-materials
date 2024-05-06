DROP IF EXISTS product_type_sales;
CREATE MATERIALIZED VIEW product_type_sales AS
Select go_retailers."Country", go_products."Product type", SUM("Quantity") from go_daily_sales
Left join go_retailers
on go_retailers."Retailer code" = go_daily_sales."Retailer code"
Left join go_products
on go_products."Product number" = go_daily_sales."Product number"
Group by rollup(go_retailers."Country", go_products."Product type")
order by go_retailers."Country", SUM("Quantity") DESC;
SELECT * FROM product_type_sales WHERE product_type_sales."Product type" = 'Watches' ORDER BY sum LIMIT 3;