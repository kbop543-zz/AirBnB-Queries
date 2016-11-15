SET search_path TO bnb, public;


DROP VIEW IF EXISTS Violators CASCADE;
DROP VIEW IF EXISTS BookingDayGroups CASCADE;
DROP VIEW IF EXISTS BookingDaySeries CASCADE;
DROP VIEW IF EXISTS ValidBookings CASCADE;
DROP VIEW IF EXISTS InvalidOverlaps CASCADE;
DROP VIEW IF EXISTS StartEndDatesByBookings CASCADE;


-- All Bookings and their start and end dates
CREATE VIEW StartEndDatesByBookings AS
SELECT
	Booking.listingID,
	Booking.travelerID, 
	Booking.startdate, 
	Booking.startdate + interval '1 day' * Booking.numNights as enddate,
	Booking.numNights
FROM
	Booking;
	

-- Bookings that have overlapping listingIDs and dates
-- NOTE: Booking PK (listingID, startdate)
CREATE VIEW InvalidOverlaps AS
SELECT Inv1.listingID, Inv1.travelerID, Inv1.startdate, Inv1.enddate, Inv1.numNights
FROM StartEndDatesByBookings AS Inv1
JOIN StartEndDatesByBookings AS Inv2
ON Inv1.listingID = Inv2.listingID AND Inv1.startdate <> Inv2.startdate
WHERE (Inv1.startdate > Inv2.startdate and Inv1.startdate < Inv2.enddate) OR
	  (Inv1.enddate > Inv2.startdate and Inv1.enddate < Inv2.enddate);


-- All valid bookings
CREATE VIEW ValidBookings AS
(SELECT * FROM StartEndDatesByBookings)
EXCEPT ALL
(SELECT * FROM InvalidOverlaps);


-- A generated series of valid booked days by listing
CREATE VIEW BookingDaySeries AS
SELECT 
	listingID,
	generate_series(startDate,endDate,'1 day') AS daySeries
FROM ValidBookings;


-- All valid booked days grouped by listing and year
CREATE VIEW BookingDayGroups AS
SELECT 
    listingID,
    date_part('year', daySeries) AS year,
    count(daySeries) AS numDaysPerYear
FROM BookingDaySeries
GROUP BY 
	listingID, 
	date_part('year', daySeries);


CREATE VIEW Violators AS
SELECT
	BookingDayGroups.listingID,
	BookingDayGroups.year,
	BookingDayGroups.numDaysPerYear,
	Listing.owner,
	Listing.propertyType,
	Listing.city
FROM
	BookingDayGroups, Listing
WHERE
	BookingDayGroups.listingID = Listing.ListingID;

SELECT * FROM Violators;