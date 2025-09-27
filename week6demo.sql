-- Original query - this one is fine
SELECT SYSDATE FROM DUAL;

-- Set date format
ALTER SESSION SET NLS_DATE_FORMAT = 'D';

-- Insert statements - corrected column name in first insert
INSERT INTO ACCTMANAGER VALUES ('T500','NICK','TAYLOR','2025-05-09','NE');
INSERT INTO ACCTMANAGER (amid, amfirst, amlast, amedate) VALUES ('L500', 'MANDY', 'LOPEZ', '2025-05-10');

-- Select query
SELECT amid, amlast FROM acctmanager WHERE amlast LIKE 'T%';

-- Add column
ALTER TABLE acctmanager ADD amsal NUMBER(8,2);

-- Modify column with default
ALTER TABLE acctmanager MODIFY (amsal DEFAULT ON NULL 0);

-- Delete statement
DELETE FROM acctmanager WHERE amid = 'A101';

-- Create new table
CREATE TABLE acctmanager1
(amid CHAR(4),
amfirst VARCHAR2(12) NOT NULL,
amlast VARCHAR2(12) NOT NULL);

-- Corrected insert with proper INSERT INTO ... SELECT syntax
INSERT INTO acctmanager1 
SELECT amid, amfirst, amlast FROM acctmanager;

alter table acctmanager1 add amedate date default sysdate;
 alter table acctmanager1 add region char(2);
 alter table acctmanager1 add amsal number(8,2);
 
INSERT INTO acctmanager1 (amid, amfirst,amlast, amsal)
SELECT amid, amfirst,amlast, amsal
FROM acctmanager;

UPDATE ACCTMANAGER SET AMEDATE='2025-08-08' WHERE AMID ='L500';
