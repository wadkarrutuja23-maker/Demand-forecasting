SELECT * FROM analysis.demand_forecasting;

UPDATE demand_forecasting
SET Date = STR_TO_DATE(Date, '%Y-%m-%d');

ALTER TABLE demand_forecasting
MODIFY COLUMN Date DATE;

DESCRIBE demand_forecasting;

-- demand analysis 
select SUM(demand) AS total_demand
from demand_forecasting; 

-- unit sold
SELECT SUM(`Units Sold`) AS total_units_sold
FROM demand_forecasting;

-- category analysis 
select category, SUM(DEMAND)AS TOTAL_DEMAND
FROM demand_forecasting
GROUP BY Category
order by total_demand DESC;

-- units sold by category
select category, sum(`Units Sold`) AS total_unit_sold
from demand_forecasting
group by category
order by total_unit_sold desc;

-- average price by category 

select category, avg(Price) AS average_price
from demand_forecasting
group by category
order by average_price desc;

-- REGION ANALYSIS  (which region has the highest demand.)
SELECT REGION, SUM(DEMAND) AS TOTAL_DEMAND
FROM DEMAND_FORECASTING
GROUP BY REGION
ORDER BY TOTAL_DEMAND DESC;

-- UNITS SOLD BY REGION 
 SELECT REGION, SUM(`Units Sold`) AS TOTAL_UNITS_SOLD
 FROM DEMAND_FORECASTING
 GROUP BY  REGION
 ORDER BY TOTAL_UNITS_SOLD
 
 -- PROMOTION / DISCOUNT
SELECT Promotion,
        SUM(DEMAND) AS TOTAL_DEMAND,
        AVG(DEMAND) AS AVG_DEMAND
FROM DEMAND_FORECASTING
GROUP BY Promotion;

-- DEMAND BY SEASONALITY
SELECT seasonality,
       SUM(demand) AS total_demand,
       AVG(demand) AS average_demand
FROM demand_forecasting
GROUP BY seasonality
ORDER BY total_demand DESC;

-- Demand over time FOR YEARLY DEMAND 
SELECT YEAR(Date) AS year,
       SUM(demand) AS total_demand
FROM demand_forecasting
GROUP BY YEAR(Date)
ORDER BY year;