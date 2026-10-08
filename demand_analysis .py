import pandas as pd
df = pd.read_csv("demand_forecasting.csv")

df["Date"] = pd.to_datetime(df["Date"])
df.columns = df.columns.str.lower().str.replace(" ", "_")
print(df.columns)

print(df.info())
print(df.describe())
print(df.shape)

print("Total Demand:", df["demand"].sum())
print("Average Demand:", df["demand"].mean())
print("Minimum Demand:", df["demand"].min())
print("Maximum Demand:", df["demand"].max())

print(df["region"].max())
region_demand = df.groupby("region")["demand"].sum().sort_values(ascending=False)
print(region_demand)

category_demand = df.groupby("category")["demand"].sum().sort_values(ascending=False)
print(category_demand) 

unit_sold_by_category =df.groupby("category")["units_sold"].sum()
print(unit_sold_by_category)

price_category = df.groupby("category")["price"].sum().sort_values(ascending=True)
print(price_category)

discount_demand = df.groupby("discount")["demand"].mean()
print(discount_demand)

promotion_demand = df.groupby("promotion")["demand"].mean()
print(promotion_demand)