create table Passengers
(ID bigint primary key, first_name varchar(50), last_name varchar(50), date_of_birth date, country_of_citizenship varchar(50), country_of_residence varchar(50), passport_number varchar(50), created_at date, updated_at date)
create table No_fly_list
(ID bigint primary key, active_from date, active_to date, no_fly_reason varchar(255), created_at date, updated_at date, psgnr_id bigint, foreign key (psgnr_id) references Passengers (ID))
create table Booking
(booking_id bigint primary key, flight_id bigint, status varchar(20), booking_platform varchar(20), created_at date, updated_at date, passenger_id bigint, foreign key (passenger_id) references Passengers (ID))
create table Security_check
(ID bigint primary key, check_result varchar(20), comments varchar(20), created_at date, updated_at date, passenger_id bigint, foreign key (passenger_id) references Passengers (ID))
create table Baggage_check
(ID bigint primary key, check_result varchar(50), created_at bigint, updated_at bigint, booking_id bigint, foreign key (booking_id) references Booking (booking_id), passenger_id bigint, foreign key (passenger_id) references Passengers (ID))
create table Baggage
(ID bigint primary key, weight_in_kg decimal(4,2), created_date date, updated_date date, booking_id bigint, foreign key (booking_id) references Booking (booking_id))
create table Boarding_pass
(ID bigint primary key, qr_code varchar(20), created_at date, updated_at date, booking_id bigint, foreign key (booking_id) references Booking (booking_id))
create table Airline
(ID bigint primary key, airline_code varchar, airline_name bigint, airline_country varchar(50), created_at timestamp, updated_at date)
create table Airport
(ID bigint primary key, airport_name varchar(50), country varchar(50), state varchar(50), city varchar(50), created_at date, updated_at date)
create table Flights
(flight_id bigint primary key, deaprting_gate varchar(20), arriving_gate varchar(20), created_at date, updated_at date, airline_id bigint, foreign key (airline_id) references Airline (ID), departing_airport_id bigint, foreign key (departing_airport_id) references Airport (ID), arriving_airport_id bigint, foreign key (arriving_airport_id) references Airport (id))
create table Flight_manifest
(ID bigint primary key, created_at date, updated_at date, booking_id bigint, foreign key (booking_id) references Booking (booking_id), flight_id bigint, foreign key (flight_id) references Flights (flight_id))
