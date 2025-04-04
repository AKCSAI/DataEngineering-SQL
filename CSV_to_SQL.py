import os
import csv
import glob

def csv_to_sql(csv_path, sql_path, table_name):
    # Ensure the directory for the SQL file exists
    os.makedirs(os.path.dirname(sql_path), exist_ok=True)
    
    with open(csv_path, 'r', newline='', encoding='utf-8') as csv_file:
        csv_reader = csv.reader(csv_file)
        
        # Extract headers for column names
        headers = next(csv_reader)
        
        # Open the SQL file for writing
        with open(sql_path, 'w', newline='', encoding='utf-8') as sql_file:
            # Write the beginning of the SQL file
            sql_file.write(f'-- SQL insert statements for {table_name} table\n\n')
            sql_file.write(f'CREATE TABLE IF NOT EXISTS {table_name} (\n')
            sql_file.write('    id INTEGER PRIMARY KEY AUTOINCREMENT,\n')
            sql_file.write(',\n'.join([f'    {header} TEXT' for header in headers]) + '\n')
            sql_file.write(');\n\n')
            
            # Generate and write insert statements
            for row in csv_reader:
                # Escape single quotes in data
                escaped_row = [value.replace("'", "''") for value in row]
                values = ', '.join([f"'{value}'" for value in escaped_row])
                sql_file.write(f"INSERT INTO {table_name} ({', '.join(headers)}) VALUES ({values});\n")
    
    print(f"SQL file created at {sql_path}")

def process_folder(csv_folder, sql_folder):
    # Ensure the output folder exists
    os.makedirs(sql_folder, exist_ok=True)
    
    # Iterate over all CSV files in the specified folder
    for csv_file in glob.glob(os.path.join(csv_folder, '*.csv')):
        # Extract the base name without extension
        base_name = os.path.splitext(os.path.basename(csv_file))[0]
        # Define corresponding SQL file path
        sql_file = os.path.join(sql_folder, f"{base_name}.sql")
        # Convert CSV to SQL
        csv_to_sql(csv_file, sql_file, base_name)

# Define the paths
csv_folder = '/users/azizkhan/GitVersions/DESQL/databases'  # Folder containing CSV files
sql_folder = '/users/azizkhan/GitVersions/DESQL/databases/SQLs'  # Folder to save SQL files

# Process all CSV files in the folder
process_folder(csv_folder, sql_folder)

print("Conversion complete! All SQL files are saved in the specified folder.")
