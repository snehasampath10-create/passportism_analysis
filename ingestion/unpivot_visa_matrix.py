import pandas as pd

# Load the raw visa requirements matrix
df = pd.read_csv(r'C:\Users\sneha\passport_inequality\seeds\visa_requirements_matrix.csv')

# Unpivot from wide to long format
df_long = df.melt(
    id_vars=['Passport'],
    var_name='destination_country',
    value_name='visa_requirement'
)

# Rename columns
df_long = df_long.rename(columns={'Passport': 'origin_country'})

# Remove rows where origin and destination are the same country
df_long = df_long[df_long['origin_country'] != df_long['destination_country']]

# Save to seeds folder
df_long.to_csv(r'C:\Users\sneha\passport_inequality\seeds\visa_requirements_long.csv', index=False)

print(f"Done! {len(df_long)} rows written to visa_requirements_long.csv")