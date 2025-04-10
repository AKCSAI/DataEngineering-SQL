-- Revoke everyone's update and insert privileges
REVOKE INSERT, UPDATE ON  long_reviews FROM PUBLIC; 

-- Grant the editor update and insert privileges 
GRANT INSERT, UPDATE ON long_reviews TO editor; 

-- Grant data_scientist update and insert privileges
GRANT UPDATE, INSERT ON long_reviews TO data_scientist;

-- Give Marta's role a password
GRANT ROLE marta WITH password 's3cur3p@ssw0rd';

-- Add Marta to the data scientist group
GRANT data_scientist TO Marta;

-- Remove Marta from the data scientist group
REVOKE data_scientist FROM Marta;