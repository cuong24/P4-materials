CREATE MATERIALIZED VIEW sales_cube AS
Select go_retailers."Retailer name", go_products."Product", "Date", SUM("Quantity"), SUM("Quantity"*(go_products."Unit price"-go_products."Unit cost")) as "Gross M." from go_daily_sales
Left join go_retailers
on go_retailers."Retailer code" = go_daily_sales."Retailer code"
Left join go_products
on go_products."Product number" = go_daily_sales."Product number"
Group by CUBE(go_retailers."Retailer name", go_products."Product", "Date");
