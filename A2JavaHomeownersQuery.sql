DROP VIEW IF EXISTS ScoreTable CASCADE;
DROP VIEW IF EXISTS rating2 CASCADE;
DROP VIEW IF EXISTS rating CASCADE;
DROP VIEW IF EXISTS homeowners CASCADE;
DROP VIEW IF EXISTS average CASCADE; 
DROP VIEW IF EXISTS travelers CASCADE;



CREATE VIEW travelers AS                        
SELECT Traveler.TravelerId, Booking.listingId, Booking.startdate
FROM Traveler LEFT OUTER JOIN Booking ON Traveler.travelerID=Booking.travelerId
GROUP BY Traveler.travelerID, Booking.listingID,Booking.startdate
ORDER BY traveler.travelerID;

CREATE VIEW average AS 
	SELECT Travelers.TravelerId, 
	travelers.listingId,avg(coalesce(TravelerRating.rating,0)) AS avg 
	FROM Travelers LEFT OUTER JOIN TravelerRating ON TravelerRating.listingID=Travelers.listingId AND Travelers.startdate = TravelerRating.startdate
	GROUP BY Travelers.travelerID,travelers.listingId
	ORDER BY travelers.travelerID;

CREATE VIEW homeowners AS 
	SELECT homeowner.homeownerid,listing.listingid FROM homeowner LEFT OUTER JOIN
	listing ON listing.owner = homeowner.homeownerid
	GROUP BY homeowner.homeownerid,listing.listingid;
                        
CREATE VIEW rating AS
	SELECT homeowners.homeownerid,average.travelerid,coalesce(average.avg,0)::float as avg
   FROM homeowners LEFT OUTER JOIN average ON homeowners.listingid = average.listingid
   GROUP BY homeowners.homeownerid,average.travelerid,average.avg;
                      

CREATE VIEW rating2 AS 
SELECT 
    R1.homeownerid AS R1homeownerid, 
    R1.travelerid AS R1travelerid, 
    R1.avg AS R1avg, 
    R2.homeownerid AS R2homeownerid, 
    R2.travelerid AS R2travelerid, 
    R2.avg AS R2avg,
    (R1.avg * R2.avg) AS multiplier 
    FROM Rating R1, Rating R2
    WHERE R1.homeownerid <> R2.homeownerid
    AND R1.travelerid = R2.travelerid;
      

-- test with 4000
 CREATE VIEW ScoreTable AS
 SELECT
 	R1homeownerid,
 	R2homeownerid,
 	sum(multiplier) as scores
 FROM
 	rating2
WHERE R1homeownerid = 4000
GROUP BY
	R1homeownerid, R2homeownerid
ORDER BY
	sum(multiplier) DESC;

SELECT * from Travelers;
SELECT * FROM average;
SELECT * FROM homeowners;
SELECT * FROM rating;
SELECT * FROM rating2;
SELECT * FROM Scoretable;
