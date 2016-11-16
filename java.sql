SET search_path TO bnb, public;

/*Get all travelers with nulls in listing for those who have never booked*/

CREATE VIEW travelers AS
SELECT 
	Traveler.TravelerId, 
	Booking.listingId
FROM 
	Traveler LEFT OUTER JOIN 
	Booking ON 
	Traveler.travelerID=Booking.travelerId
GROUP BY 
	Traveler.travelerID, Booking.listingID
order by 
	traveler.travelerID;

/*Get all travelers with nulls in avg for those who have never rated a homeowner*/

CREATE VIEW average AS
SELECT 
	Travelers.TravelerId, 
	travelers.listingId,avg(coalesce(TravelerRating.rating,0)) AS avg
FROM 
	Travelers LEFT OUTER JOIN 
	TravelerRating ON 
	TravelerRating.listingID=Travelers.listingId
GROUP BY 
	Travelers.travelerID,travelers.listingId
order by 
	travelers.travelerID;

/*Get all homeowners with listings so I can join with the tables above*/
CREATE VIEW homeowners AS
SELECT 
	homeowner.homeownerid,
	listing.listingid
FROM 
	homeowner left outer join listing on 
	listing.owner = homeowner.homeownerid
GROUP BY 
	homeowner.homeownerid,
	listing.listingid;

/*Join everything together,maintaining nulls, and group by homeowner*/
CREATE VIEW rating AS
SELECT 
	homeowners.homeownerid,
	average.travelerid,
	coalesce(average.avg,0)::float as avg
FROM 
	homeowners left outer join 
	average on 
	homeowners.listingid = average.listingid
GROUP BY 
	homeowners.homeownerid,
	average.travelerid,
	average.avg;

SELECT *
FROM rating;

DROP VIEW IF EXISTS average CASCADE;
DROP VIEW IF EXISTS travelers CASCADE;
DROP VIEW IF EXISTS rating CASCADE;
