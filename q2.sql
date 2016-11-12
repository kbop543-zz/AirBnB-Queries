SET search_path TO bnb, public;

DROP VIEW TotalBookings CASCADE;
DROP VIEW avgRequests CASCADE;
DROP VIEW TotalTravelers CASCADE;
DROP VIEW RequestsNotInBooking CASCADE;
DROP VIEW TotalRequests CASCADE;
DROP VIEW Step1 CASCADE;



--get all travelers to calculate average
 CREATE VIEW TotalTravelers AS
 select  count(travelerId) as num
 from Traveler;
 
 --get all booking requests to calculate average
CREATE VIEW TotalRequests AS
select  count(requestID) as num
from BookingRequest;

--get number of booking requests that are not in booking
CREATE VIEW RequestsNotInBooking AS
SELECT travelerId,listingId, count(distinct requestID) as numRequests
FROM BookingRequest
WHERE listingID NOT IN(
SELECT listingID
FROM Booking)
group by travelerId, listingId;


--get all travelers who has ten times the average booking requests that has never booked anything
CREATE VIEW Step0 AS
SELECT RequestsNotInBooking.travelerId,RequestsNotInBooking.numRequests,RequestsNotInBooking.listingId
FROM RequestsNotInBooking, BookingRequest,TotalRequests,TotalTravelers
GROUP BY RequestsNotInBooking.numRequests,RequestsNotInBooking.travelerId,TotalRequests.num,TotalTravelers.num,RequestsNotInBooking.listingId
HAVING RequestsNotInBooking.numRequests > TotalRequests.num/TotalTravelers.num::numeric * 10;

--get most requested city
CREATE VIEW StepUm AS
SELECT travelerId,max(numRequests) as numRequests
FROM Step0
GROUP BY travelerId;

--get max cities alphabetically if there is a tie
CREATE VIEW Step1 AS
SELECT StepUm.travelerId, StepUm.numRequests, min(Listing.city) as mostRequestedCity
FROM StepUm,Step0,Listing
WHERE StepUm.travelerID = Step0.travelerID  and Step0.listingId = Listing.listingId
GROUP BY StepUm.travelerId,StepUm.numRequests;


--get personal details of the traveler with most requested city that comes alphabetically first, 
--in the order that was dictated on the handout
CREATE VIEW Step2 AS
SELECT distinct Traveler.travelerId,Traveler.firstname || ' ' || Traveler.surname as name, coalesce(Traveler.email,'unknown') as email,Step1.mostRequestedCity,Step1.numRequests
FROM Step1,Traveler, Listing,Step0
WHERE Step1.travelerId = Traveler.travelerId and Step0.numRequests = Step1.numRequests 
ORDER BY Step1.numRequests DESC, Traveler.travelerId ASC;

SELECT * FROM STEP2;















