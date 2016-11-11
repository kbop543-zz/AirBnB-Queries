SET search_path TO bnb, public;

DROP VIEW ScratchingBacks1 CASCADE;
DROP VIEW ScratchingBacks2 CASCADE;

-- Count of reciprocals
CREATE VIEW ScratchingBacks1 AS 
SELECT Traveler.travelerID, count(*) AS reciprocals
FROM Traveler, Booking, TravelerRating, HomeownerRating 
WHERE Traveler.travelerID = Booking.travelerID
AND Booking.listingID = HomeownerRating.listingID
AND Booking.startDate = HomeownerRating.startDate
AND Booking.listingID = TravelerRating.listingID
AND Booking.startDate = TravelerRating.startDate
AND HomeownerRating.listingID = TravelerRating.listingID
AND HomeownerRating.startDate = TravelerRating.startDate
GROUP BY Traveler.travelerID;

-- Count of reciprocals that differ by one point or less
CREATE VIEW ScratchingBacks2 AS 
SELECT Traveler.travelerID, count(*) AS backScratches
FROM Traveler, Booking, TravelerRating, HomeownerRating
WHERE Traveler.travelerID = Booking.travelerID
AND Booking.listingID = HomeownerRating.listingID
AND Booking.startDate = HomeownerRating.startDate
AND Booking.listingID = TravelerRating.listingID
AND Booking.startDate = TravelerRating.startDate
AND HomeownerRating.listingID = TravelerRating.listingID
AND HomeownerRating.startDate = TravelerRating.startDate
AND ABS(HomeownerRating.rating - TravelerRating.rating) <= 1
GROUP BY Traveler.travelerID;

-- Combine TravelerID with reciprocals and recriprocals that differ by one point or less
SELECT ScratchingBacks1.travelerID, reciprocals, backScratches
FROM ScratchingBacks1, ScratchingBacks2
WHERE ScratchingBacks1.travelerID = ScratchingBacks2.travelerID;



