-- 1 Count of Female Passengers Traveling a Minimum Distance
SELECT Gender, COUNT(*) as count
FROM PASSENGER
WHERE Gender = 'F' AND Distance >= 600
GROUP BY Gender;

-- 2 Display the details of passengers who are traveling in a sleeper bus and have a travel distance greater than 500.
SELECT Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type
FROM PASSENGER
WHERE Bus_Type = 'Sleeper' AND Distance > 500;

-- 3 Select passenger names whose names start with character 'S' 
select Passenger_name from travego.passenger where Passenger_name like "S%"; -- Sejal


-- 4 Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select a.Passenger_name, a.Boarding_city, a.Destination_city, a.Bus_type, b.Price 
from travego.passenger a, travego.price b
where a.Distance = b.Distance and a.Bus_type = b.Bus_type;

-- 5 Extract the passenger name(s) and the ticket price for those who traveled 700 KMs Sitting in a bus?
SELECT 
    p.Passenger_name,
    pr.Price
FROM 
    PASSENGER p
JOIN 
    PRICE pr
ON 
    p.Bus_Type = pr.Bus_Type AND p.Distance = pr.Distance
WHERE 
    p.Distance = 700 AND p.Bus_Type = 'Sitting';

-- 6  Calculate the bus fare for a passenger named 'Pallavi' traveling from Panaji to Bangalore . 
select pa.passenger_name, pr.Bus_type, pr.price from travego.passenger as pa join travego.price as pr using(distance)
where Passenger_name = "Pallavi";

-- or

SELECT 
    p.Distance, 
    p.Passenger_name, 
    'Sitting' AS Bus_Type, 
    pr.Price 
FROM 
    PASSENGER p
JOIN 
    PRICE pr 
ON 
    pr.Bus_Type = 'Sitting' AND 
    p.Distance = pr.Distance 
WHERE 
    LOWER(p.Passenger_name) = 'pallavi' AND 
    LOWER(p.Boarding_City) = 'panaji' AND 
    LOWER(p.Destination_City) = 'bengaluru'
UNION
SELECT 
    p.Distance, 
    p.Passenger_name, 
    p.Bus_Type, 
    pr.Price 
FROM 
    PASSENGER p
JOIN 
    PRICE pr 
ON 
    p.Bus_Type = pr.Bus_Type AND 
    p.Distance = pr.Distance 
WHERE 
    LOWER(p.Passenger_name) = 'pallavi' AND 
    LOWER(p.Boarding_City) = 'panaji' AND 
    LOWER(p.Destination_City)='bengaluru'; 

-- 7 Update Bus Category Based on Bus Type/Write an SQL query to update the category column in the passenger table based on the specified condition.
select distinct Distance from travego.passenger order by Distance  desc;

-- 8 Delete Passenger from Database/to delete the record and commit the change in the database.
-- Start a transaction
BEGIN TRANSACTION;

-- Delete the record
DELETE FROM passenger 
WHERE Passenger_name = 'Piyush';

-- Commit the changes
COMMIT;

-- 9 Truncate Table and Comment on Number of Rows
-- Write your query below 
 -- Before
-- There are total 8 rows after deleteing row wit passengername "Piyush"

-- truncate passenger; can't be used here so using the below query

DELETE FROM passenger;

-- After
-- There are 0 rows after truncate , 
-- but the structure of table remains the same

-- 10 Delete Table from Database
-- Write your query below 
DROP TABLE PASSENGER;