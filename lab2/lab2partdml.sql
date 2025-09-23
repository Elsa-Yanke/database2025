INSERT INTO airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (201, 'KZ', 'KazAir', 'Kazakhstan', '2014-07-30 02:16:37', '2025-09-23 20:47:56');

select * from airline;

UPDATE airline
SET airline_country = 'Turkey', updated_at = '2025-09-23 20:50:50'
WHERE airline_name = 'KazAir';

INSERT INTO airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES 
(202,'AE','AirEasy','France', '2025-07-30 03:16:37', '2025-09-30 21:16:37'),
(203,'FH','FlyHigh','Brazil', '2025-12-30 07:26:57', '2025-07-30 03:16:37'),
(204,'FF','FlyFly','Poland', '2025-10-22 23:16:32', '2025-07-30 03:16:37');


select * from flights

DELETE FROM flights
WHERE EXTRACT(YEAR FROM act_arrival_time) = 2024;

UPDATE booking
SET ticket_price = ROUND(ticket_price * 1.15, 2),
    updated_at   = '2025-09-23 20:50:50';

select * from booking;

DELETE FROM booking WHERE ticket_price < 2000;
