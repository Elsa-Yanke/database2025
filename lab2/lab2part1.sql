CREATE TABLE airline_info(
airline_id INT NOT NULL,
airline_code VARCHAR(30) NOT NULL,
airline_name VARCHAR(50) NOT NULL,
airline_country VARCHAR(50) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
info VARCHAR(50) NOT NULL,
PRIMARY KEY(airline_id)
);

CREATE TABLE airport(
airport_id INT NOT NULL,
airport_name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
PRIMARY KEY(airport_id)
);

CREATE TABLE baggage_check(
baggage_check_id INT NOT NULL,
check_result VARCHAR(50) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
booking_id INT NOT NULL,
passenger_id INT NOT NULL,
PRIMARY KEY(baggage_check_id)
);

CREATE TABLE Baggage(
baggage_id INT NOT NULL,
weight_in_kg DECIMAL(4,2) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
booking_id INT NOT NULL,
PRIMARY KEY(baggage_id)
);

CREATE TABLE boarding_pass(
boarding_pass_id INT NOT NULL,
booking_id INT NOT NULL,
seat VARCHAR(50) NOT NULL,
boarding_time TIMESTAMP NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
PRIMARY KEY(boarding_pass_id)
);

CREATE TABLE booking_flight(
booking_flight_id INT NOT NULL,
booking_id INT NOT NULL,
flight_id INT NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
PRIMARY KEY(booking_flight_id)
);

CREATE TABLE booking(
booking_id INT NOT NULL,
flight_id INT NOT NULL,
passenger_id INT NOT NULL,
booking_platform VARCHAR(50) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
status VARCHAR(50) NOT NULL,
price DECIMAL(7,2) NOT NULL,
PRIMARY KEY(booking_id)
);

CREATE TABLE flights(
flight_id INT NOT NULL,
sch_departure_time TIMESTAMP NOT NULL,
sch_arrival_time TIMESTAMP NOT NULL,
departing_airport_id INT NOT NULL,
arriving_airport_id INT NOT NULL,
departing_gate VARCHAR(50) NOT NULL,
arriving_gate VARCHAR(50) NOT NULL,
airline_id INT NOT NULL,
act_departure_time TIMESTAMP NOT NULL,
act_arrival_time TIMESTAMP NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
PRIMARY KEY(flight_id)
);

CREATE TABLE passengers(
passenger_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
gender VARCHAR(50) NOT NULL,
country_of_citizenship VARCHAR(50) NOT NULL,
country_of_residence VARCHAR(50) NOT NULL,
passport_number VARCHAR(20) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
PRIMARY KEY(passenger_id)
);

CREATE TABLE security_check(
security_check_id INT NOT NULL,
check_result VARCHAR(20) NOT NULL,
created_at TIMESTAMP NOT NULL,
updated_at TIMESTAMP NOT NULL,
passenger_id INT NOT NULL,
PRIMARY KEY(security_check_id)
);

ALTER TABLE airline_info RENAME TO airline;

ALTER TABLE booking RENAME COLUMN price TO ticket_price;

ALTER TABLE flights ALTER COLUMN departing_gate TYPE TEXT;

ALTER TABLE airline DROP COLUMN info;

ALTER TABLE security_check
ADD CONSTRAINT fk_security_check_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE baggage_check
ADD CONSTRAINT fk_baggage_check_passenger
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id);

ALTER TABLE baggage_check
ADD CONSTRAINT fk_baggage_check_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE baggage
ADD CONSTRAINT fk_baggage_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE boarding_pass
ADD CONSTRAINT fk_boarding_pass_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE booking_flight
ADD CONSTRAINT fk_booking_flight_booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE booking_flight
ADD CONSTRAINT fk_booking_flight_flight
FOREIGN KEY (flight_id) REFERENCES Flights(flight_id);

ALTER TABLE flights
ADD CONSTRAINT fk_flights_departing_airport
FOREIGN KEY (departing_airport_id) REFERENCES Airport(airport_id);

ALTER TABLE flights
ADD CONSTRAINT fk_flights_arriving_airport
FOREIGN KEY (arriving_airport_id) REFERENCES Airport(airport_id);

ALTER TABLE flights
ADD CONSTRAINT fk_flights_airline
FOREIGN KEY (airline_id) REFERENCES airline(airline_id);
