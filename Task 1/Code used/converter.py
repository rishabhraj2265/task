import pandas as pd

file = 'bankdataset.xlsx'
chunk_size = 100_000

# Read the column headers and check actual columns
columns = pd.read_excel(file, nrows=0).columns.tolist()
print("Columns in file:", columns)

# Only use 'parse_dates' if 'Date' is in the columns
parse_dates = ['Date'] if 'Date' in columns else []

for i in range(11):  # Up to 11 chunks
    try:
        df = pd.read_excel(
            file,
            skiprows=i * chunk_size + 1,  # Skip header row once
            nrows=chunk_size,
            header=None,
            names=columns,
            parse_dates=parse_dates,
            dtype={
                'Domain': 'category',
                'Location': 'category',
                'Value': 'int32',
                'Transaction_count': 'int32'
            }
        )
    except Exception as e:
        print(f"Error reading chunk {i}: {e}")
        break

    if df.empty:
        print(f"Chunk {i} is empty. Stopping.")
        break

    df.to_csv(f'bank_data_part_{i}.csv', index=False)
    print(f"Saved: bank_data_part_{i}.csv")
