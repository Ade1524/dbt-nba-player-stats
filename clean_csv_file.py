import pandas as pd


# Read the CSV file into a DataFrame
df = pd.read_csv('NBA_Player_Stats.csv')


# Remove '%' symbols from column names
new_columns = [col.replace('%', '_PCT') for col in df.columns]
df.columns = new_columns


# Save the DataFrame back to a CSV file
df.to_csv('./seeds/NBA_Player_Stats.csv', index=False)