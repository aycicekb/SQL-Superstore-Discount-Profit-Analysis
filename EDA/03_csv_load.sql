COPY superstore
FROM 'C:\Users\Lenovo\OneDrive\Desktop\SQL Project 1\csv\cleaned_superstore.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');