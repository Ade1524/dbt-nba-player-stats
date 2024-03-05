# import pandas as pd

# list_of_files = ['NBA_Player_Stats.csv', 'NBA_Playoff_Stats.csv', 'NBA_total_rookies_stats_1980_2023.csv']

# for file in list_of_files:
#     # Read the CSV file into a DataFrame
#     df = pd.read_csv(file)


#     # Remove '%' symbols from column names
#     new_columns = [col.replace('%', '_PCT') for col in df.columns]
#     df.columns = new_columns


#     # Save the DataFrame back to a CSV file
#     df.to_csv(f'./seeds/{file.lower()}', index=False)



import pandas as pd
import re

list_of_files = ['NBA_Player_Stats.csv', 'NBA_Playoff_Stats.csv', 'NBA_total_rookies_stats_1980_2023.csv']

for file in list_of_files:
    # Read the CSV file into a DataFrame
    df = pd.read_csv(file)

    # Remove '%' symbols from column names and ensure they start with a letter
    new_columns = []
    for col in df.columns:
        # Remove '%' symbols
        new_col = col.replace('%', '_pct').replace('/', '_').lower()
        # Ensure the column name starts with a letter
        if re.match('^\d', new_col):
            new_col = 'c_' + new_col  # Prepend 'C' if it starts with a number
        new_columns.append(new_col)

    # Update column names
    df.columns = new_columns

    # Save the DataFrame back to a CSV file
    df.to_csv(f'./seeds/{file.lower()}', index=False)