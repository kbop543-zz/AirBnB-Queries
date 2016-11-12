SET search_path TO bnb, public;

DROP VIEW TotalBookings CASCADE;
DROP VIEW TotalRequests CASCADE;
DROP VIEW STEP1 CASCADE;
DROP VIEW STEP2 CASCADE;

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



CREATE VIEW STEP1 AS
	SELECT Traveler.travelerId, Traveler.email, TotalRequests.year, coalesce(TotalRequests.numRequests, 0) as numRequests
	FROM Traveler LEFT JOIN TotalRequests ON Traveler.travelerId = TotalRequests.travelerId;


CREATE VIEW STEP2 AS
	SELECT STEP1.travelerId, STEP1.email, STEP1.year, STEP1.numRequests, coalesce(TotalBookings.numBooking, 0) as numBooking
	FROM STEP1 LEFT JOIN TotalBookings ON STEP1.travelerId = TotalBookings.travelerId
	ORDER BY STEP1.year DESC;

SELECT * FROM STEP2;
