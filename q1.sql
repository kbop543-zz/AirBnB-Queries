SET search_path TO bnb, public;


CREATE VIEW traveler_statistics AS
SELECT travelID, email, numRequests, numBooking
FROM
