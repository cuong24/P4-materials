CREATE MATERIALIZED VIEW retailer_sales AS
Select go_retailers."Country", go_retailers."Retailer name", SUM("Quantity"), SUM("Quantity"*(go_products."Unit price"-go_products."Unit cost")) as "Gross M." from go_daily_sales
Left join go_retailers
on go_retailers."Retailer code" = go_daily_sales."Retailer code"
Left join go_products
on go_products."Product number" = go_daily_sales."Product number"
Group by rollup(go_retailers."Country", go_retailers."Retailer name")
order by go_retailers."Country", SUM("Quantity") DESC;