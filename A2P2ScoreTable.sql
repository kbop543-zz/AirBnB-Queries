DROP VIEW IF EXISTS ScoreTable CASCADE;
DROP VIEW IF EXISTS rating2 CASCADE;
DROP VIEW IF EXISTS rating CASCADE;
DROP VIEW IF EXISTS homeowners CASCADE;
DROP VIEW IF EXISTS average CASCADE; 
DROP VIEW IF EXISTS travelers CASCADE;



CREATE VIEW travelers AS                        
SELECT Traveler.TravelerId, Booking.listingId
FROM Traveler LEFT OUTER JOIN Booking ON Traveler.travelerID=Booking.travelerId
GROUP BY Traveler.travelerID, Booking.listingID
ORDER BY traveler.travelerID;

CREATE VIEW average AS 
	SELECT Travelers.TravelerId, 
	travelers.listingId,avg(coalesce(TravelerRating.rating,0)) AS avg 
	FROM Travelers LEFT OUTER JOIN TravelerRating ON TravelerRating.listingID=Travelers.listingId
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
      

 CREATE VIEW ScoreTable AS
 SELECT
 	R1homeownerid,
 	R2homeownerid,
 	sum(multiplier) as scores
 FROM
 	rating2
 -- WHERE R1homeownerid = ?
GROUP BY
	R1homeownerid, R2homeownerid
ORDER BY
	sum(multiplier) DESC;