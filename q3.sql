SET search_path TO bnb, public;

DROP VIEW IF EXISTS TEST2;
DROP VIEW IF EXISTS OverlappingYearsMax;
DROP VIEW IF EXISTS OverlappingYearsMin;
DROP VIEW IF EXISTS AllMin;
DROP VIEW IF EXISTS AllMax;

--get ownerid,listingid,enddate of the listing,startdate of the
--listing, the city of the listing, regulationtype(min) 
CREATE VIEW AllMin AS
SELECT 
    Listing.owner, 
    Booking.listingID, 
    (Booking.startdate +  interval '1 day' * Booking.numNights) as endDate, 
    Booking.startdate AS startDate, 
    Listing.city,
    CityRegulation.regulationType AS type
FROM 
    Listing,
    Booking,
    CityRegulation
WHERE 
    CityRegulation.regulationType = 'min' AND 
    Booking.listingID = Listing.listingID AND 
    CityRegulation.city = Listing.city AND
    (Listing.propertyType = CityRegulation.propertyType OR 
    Listing.propertyType = null);

--get ownerid,listingid,enddate of the listing,startdate of the
--listing, the city of the listing, regulationtype(max) 
CREATE VIEW  AllMax AS
SELECT 
    Listing.owner, 
    Booking.listingID, 
    (Booking.startdate + interval '1 day' * Booking.numNights) AS endDate, 
    Booking.startdate AS startDate, 
    Listing.city,CityRegulation.regulationType AS type
FROM 
    Listing, Booking, CityRegulation
WHERE 
    CityRegulation.regulationType = 'max' AND
    Booking.listingID = Listing.listingID AND 
    CityRegulation.city = Listing.city AND 
    (Listing.propertyType = CityRegulation.propertyType OR 
    Listing.propertyType = null);


SELECT * FROM ALLMin;
SELECT * FROM AllMax;


/*
SELECT * 
FROM OverlappingYearsMin t1, OverlappingYearsMin t2
WHERE t1.listingId = t2.listingId and 

SELECT * 
FROM OverlappingYearsMax
WHERE 

--TRYING TO DO OVERLAP BUT IT WONT WORK 


--only get listings that don't overlap
CREATE VIEW OverlappingYearsMin AS
SELECT * 
FROM AllMin AS t1 CROSS JOIN AllMin AS t2
WHERE t1.startDate != t2.startDate and t1.endDate != t2.endDate 
and ((t1.startDate,t1.endDate) OVERLAPS (t2.startDate,t2.endDate)) = false;

CREATE VIEW OverlappingYearsMax AS
SELECT * 
FROM AllMax AS t1 CROSS JOIN AllMax AS t2
WHERE t1.startDate != t2.startDate and t1.endDate != t2.endDate and
((t1.startDate,t1.endDate) OVERLAPS (t2.startDate,t2.endDate)) = false;
*/



-- SELECT * from OverlappingYearsMin;
-- SELECT * from OverlappingYearsMax;



-- Serializes days by year by listing
CREATE VIEW TEST2 AS
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 day') as startDate,city,type
FROM AllMin)
UNION
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 day') as startDate,city,type
FROM AllMax);


SELECT 
    homeowner, 
    listingID, 
    city,
    date_part('year', startdate) AS year,
    count(startdate) AS numDaysPerYear
FROM
    TEST2
GROUP BY homeowner, listingID, city, date_part('year', startdate);



/*
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,endDate-startDate) as startDate,city,type
FROM OverlappingYearsMin
WHERE startYear = endYear -1 )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 day') as startDate,city,type
FROM OverlappingYearsMin
WHERE startYear != endYear )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,endDate-startDate) as startDate,city,type
FROM OverlappingYearsMax
WHERE startYear = endYear -1 )
union
(SELECT  owner as homeowner, listingID, 
generate_series(startDate,endDate,'1 day') as startDate,city,type
FROM OverlappingYearsMax
WHERE startYear != endYear );
*/







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









