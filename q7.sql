SET search_path TO bnb, public;

DROP VIEW Savers CASCADE;
DROP VIEW Goodbargainers CASCADE;

CREATE VIEW Savers AS
SELECT Booking.travelerID, Booking.listingID, 
-- Booking.startdate,
-- CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) AS avgOfferPrice,
-- CAST(Booking.price/Booking.numNights AS FLOAT) AS avgPaidPrice,
-- CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) - CAST(Booking.price/Booking.numNights AS FLOAT) AS savedPerNight,
ROUND((CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) - CAST(Booking.price/Booking.numNights AS FLOAT)) / CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) * 100) AS bargainPercentage
FROM BookingRequest, Booking
WHERE BookingRequest.travelerID = Booking.travelerID
AND BookingRequest.listingID = Booking.listingID
AND BookingRequest.startdate = Booking.startdate
AND (CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) 
	- CAST(Booking.price/Booking.numNights AS FLOAT)) 
	/ CAST(BookingRequest.offerPrice/BookingRequest.numNights AS FLOAT) >= 0.25;

SELECT * FROM Savers;

CREATE VIEW Goodbargainers AS
SELECT Savers.travelerID, MAX(Savers.bargainPercentage) AS largestBargainPercentage
FROM Savers
GROUP BY Savers.travelerID
HAVING COUNT(Savers.travelerID) >= 3;

SELECT Goodbargainers.travelerID, Goodbargainers.largestBargainPercentage, Savers.listingID
FROM Goodbargainers, Savers
WHERE Goodbargainers.travelerID = Savers.travelerID
AND Goodbargainers.largestBargainPercentage = Savers.bargainPercentage;

