import re
import pandas as pd

log_pattern = re.compile(
    r'(?P<ip>\S+) - - \[(?P<datetime>[^\]]+)\] '
    r'"(?P<method>\S+) (?P<url>\S+) (?P<protocol>\S+)" '
    r'(?P<status>\d{3}) (?P<size>\d+|-)'
)

with open('apache_logs', 'r') as f:
    lines = f.readlines()

parsed_data = []
for line in lines:
    match = log_pattern.match(line)
    if match:
        entry = match.groupdict()
        if entry['size'] == '-':
            entry['size'] = 0
        parsed_data.append(entry)

df = pd.DataFrame(parsed_data)
df.to_csv('structured_logs.csv', index=False)

print("Logs converted and saved to structured_logs.csv")

