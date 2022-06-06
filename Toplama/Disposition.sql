/*
The table agents contains classified information. Current disposition of the agents is stored in the current_location column. 
Write a query that selects a location that comes last in alphabetical order.
*/

SELECT MAX(current_location) FROM agents;
