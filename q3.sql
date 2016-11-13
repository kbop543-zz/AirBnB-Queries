SET search_path TO bnb, public;


--get all listings and their information that correspond to relative min and max violations

--CREATE VIEW Min AS /* TRYING TO DO OVERLAP*/
CREATE VIEW OverlappingYearsMin AS
SELECT Listing.owner, Booking.listingID, date_part('year', 
Booking.startdate) as startYear,
  date_part('year',Booking.startdate + 
 interval '1 day' * Booking.numNights) as endYear,(Booking.startdate + 
 interval '1 day' * Booking.numNights) as endDate,Booking.startdate as startDate, Listing.city,CityRegulation.regulationType as type
FROM Listing,Booking,CityRegulation
WHERE CityRegulation.regulationType = 'min' and Booking.listingID = Listing.listingID and CityRegulation.city = Listing.city
and  CityRegulation.propertyType = Listing.propertyType;

--CREATE VIEW Max AS /* TRYING TO DO OVERLAP*/
CREATE VIEW OverlappingYearsMax AS
SELECT Listing.owner, Booking.listingID, date_part('year', 
Booking.startdate) as startYear,
  date_part('year',Booking.startdate + 
 interval '1 day' * Booking.numNights) as endYear, (Booking.startdate + 
 interval '1 day' * Booking.numNights) as endDate,Booking.startdate as startDate, Listing.city,CityRegulation.regulationType as type
FROM Listing,Booking,CityRegulation
WHERE CityRegulation.regulationType = 'max' and Booking.listingID = Listing.listingID and CityRegulation.city = Listing.city
and  CityRegulation.propertyType = Listing.propertyType;


--TRYING TO DO OVERLAP BUT IT WONT WORK 
/*
--only get listings that don't overlap
CREATE VIEW OverlappingYearsMin AS
SELECT * 
FROM Min t1 CROSS JOIN Min t2
WHERE t1.startDate != t2.startDate and t1.endDate != t2.endDate 
and ((t1.startDate,t1.endDate) OVERLAPS (t2.startDate,t2.endDate)) = false;

CREATE VIEW OverlappingYearsMax AS
SELECT * 
FROM Max t1 CROSS JOIN Max t2
WHERE t1.startDate != t2.startDate and t1.endDate != t2.endDate and
((t1.startDate,t1.endDate) OVERLAPS (t2.startDate,t2.endDate)) = false;
*/




--SELECT * from OverlappingYearsMin;
--SELECT * from OverlappingYearsMax;


--get all startdates if the booking spans multiple years
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,endDate-startDate) as startDate,city,type
FROM OverlappingYearsMin
WHERE startYear = endYear -1 )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 year') as startDate,city,type
FROM OverlappingYearsMin
WHERE startYear != endYear )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,endDate-startDate) as startDate,city,type
FROM OverlappingYearsMax
WHERE startYear = endYear -1 )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 year') as startDate,city,type
FROM OverlappingYearsMax
WHERE startYear != endYear );


-- CREATE VIEW OneYear AS
-- (SELECT  owner as homeowner, listingID, 
-- startDate as startDate, ABS(startDate - date_trunc('year',endDate)) as days,city
-- FROM OverlappingYearsMin
-- WHERE startYear = endYear -1 )
-- union
-- (SELECT  owner as homeowner, listingID, 
-- date_trunc('year',endDate) as startDate, date_trunc('year',endDate) - endDate as days,city
-- FROM OverlappingYearsMin
-- WHERE startYear = endYear -1 )
-- union
-- (SELECT  owner as homeowner, listingID, 
-- startDate as startDate, ABS(startDate - date_trunc('year',endDate)) as days,city
-- FROM OverlappingYearsMax
-- WHERE startYear = endYear -1 )
-- union
-- (SELECT  owner as homeowner, listingID, 
-- date_trunc('year',endDate) as startDate, date_trunc('year',endDate) - endDate as days,city
-- FROM OverlappingYearsMax
-- WHERE startYear = endYear -1 )



-- (SELECT  owner as homeowner, listingID, 
-- generate_series(startDate,endDate,'1 year') as startDate,city
-- FROM OverlappingYearsMin
-- WHERE endYear - startYear >= 2  )
-- union
-- (SELECT  owner as homeowner, listingID, 
-- generate_series(startDate,endDate,'1 year') as startDate,city
-- FROM OverlappingYearsMax
-- WHERE endYear - startYear >= 2 );









-- CREATE VIEW min AS
-- (SELECT  owner as homeowner, listingID, startYear as year
-- FROM OverlappingYearsMin
-- WHERE startYear != endYear 
-- GROUP BY owner, listingID, startYear)
-- union
-- (SELECT  owner as homeowner, listingID, endYear as year,city
-- FROM OverlappingYearsMin
-- WHERE startYear != endYear )
-- union
-- (SELECT  owner as homeowner, listingID,startYear as year, city
-- FROM OverlappingYearsMin
-- WHERE startYear = endYear );









