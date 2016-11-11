SET search_path TO bnb, public;

DROP VIEW TotalBookings CASCADE;
DROP VIEW TotalRequests CASCADE;

CREATE VIEW TotalBookings AS
select travelerId, date_part('year', startdate) as year, count(*) as numBooking
from booking
where startdate >= (current_date - interval '1 year' * 10)
group by travelerId, date_part('year', startdate);


CREATE VIEW TotalRequests AS 
select travelerId, date_part('year', startdate) as year, count(*) as numRequests
from BookingRequest
where startdate >= (current_date - interval '1 year' * 10)
group by travelerId, date_part('year', startdate);

SELECT TotalRequests.travelerId, TotalRequests.year, coalesce(TotalRequests.numRequests, 0) as numRequests, coalesce(TotalBookings.numBooking, 0) as numBooking
FROM TotalBookings FULL OUTER JOIN TotalRequests ON TotalRequests.travelerId = TotalBookings.travelerId;


-- SELECT Traveler.travelerId, Traveler.email, TotalRequests.year, TotalBookings.numBooking, TotalRequests.numRequests
-- FROM Traveler FULL OUTER JOIN TotalBookings FULL OUTER JOIN TotalRequests
-- ON Traveler.travelerId = TotalRequests.travelerId = TotalBookings.travelerId
-- ORDER BY TotalRequests.year DESC;



