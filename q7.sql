SET search_path TO bnb, public;

-- Listing price doesn't seem to be included in the bnbSchema.dll
-- Assumption: 'Listing Price' = BookingRequest.offerPrice
--             Paid Price = Booking.price
-- 			   Savings = BookingRequest.offerPrice - Booking.price

-- Travelers who have paid 25% less than the average per night cost for all listings
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

-- SELECT * FROM Savers;

-- Bargainers who have saved at least 3 times
CREATE VIEW Goodbargainers AS
SELECT Savers.travelerID, MAX(Savers.bargainPercentage) AS largestBargainPercentage
FROM Savers
GROUP BY Savers.travelerID
HAVING COUNT(Savers.travelerID) >= 3;

-- 'Good Bargainers' with their largest bargain percentage and respective listing
SELECT Goodbargainers.travelerID, Goodbargainers.largestBargainPercentage, Savers.listingID
FROM Goodbargainers, Savers
WHERE Goodbargainers.travelerID = Savers.travelerID
AND Goodbargainers.largestBargainPercentage = Savers.bargainPercentage
ORDER BY Goodbargainers.largestBargainPercentage DESC, Goodbargainers.travelerID ASC;

DROP VIEW IF EXISTS Goodbargainers CASCADE;
DROP VIEW IF EXISTS Savers CASCADE;
