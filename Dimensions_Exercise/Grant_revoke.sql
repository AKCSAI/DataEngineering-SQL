-- Revoke everyone's update and insert privileges
REVOKE INSERT, UPDATE ON  long_reviews FROM PUBLIC; 

-- Grant the editor update and insert privileges 
GRANT INSERT, UPDATE ON long_reviews TO editor; 