TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;


INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 90);

-- sample data added
INSERT INTO Traveler VALUES (1000, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1001, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1002, 'tsurname3', 'tfirstname3', 'fn3@domain.com');
INSERT INTO Traveler VALUES (1003, 'tsurname4', 'tfirstname4', 'fn4@domain.com');
INSERT INTO Traveler VALUES (1004, 'tsurname5', 'tfirstname5', 'fn5@domain.com');
INSERT INTO Traveler VALUES (1005, 'tsurname6', 'tfirstname6', 'fn6@domain.com');
INSERT INTO Traveler VALUES (1006, 'tsurname7', 'tfirstname7', 'fn7@domain.com');
INSERT INTO Traveler VALUES (1007, 'tsurname8', 'tfirstname8', 'fn8@domain.com');
INSERT INTO Traveler VALUES (1008, 'tsurname9', 'tfirstname9', 'fn9@domain.com');
INSERT INTO Traveler VALUES (1009, 'tsurname10', 'tfirstname10', 'fn10@domain.com');
INSERT INTO Traveler VALUES (1010, 'tsurname11', 'tfirstname11', 'fn11@domain.com');
INSERT INTO Traveler VALUES (1011, 'tscommon12', 'tfcommon12', 'fn12@domain.com');
INSERT INTO Traveler VALUES (1012, 'tscommon13', 'tfcommon13', 'fn13@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4002, 'hn3', 'hf3', 'hfn3@domain.com');
INSERT INTO Homeowner VALUES (4003, 'hn4', 'hf4', 'hfn4@domain.com');
INSERT INTO Homeowner VALUES (4004, 'hn5', 'hf5', 'hfn5@domain.com');
INSERT INTO Homeowner VALUES (4005, 'hn6', 'hf6', 'hfn6@domain.com');
INSERT INTO Homeowner VALUES (4006, 'hn7', 'hf7', 'hfn7@domain.com');
INSERT INTO Homeowner VALUES (4007, 'hn8', 'hf8', 'hfn8@domain.com');
INSERT INTO Homeowner VALUES (4008, 'hn9', 'hf9', 'hfn9@domain.com');
INSERT INTO Homeowner VALUES (4009, 'hn10', 'hf10', 'hfn10@domain.com');
INSERT INTO Homeowner VALUES (4010, 'hn11', 'hf11', 'hfn11@domain.com');
INSERT INTO Homeowner VALUES (4011, 'hn12', 'hf12', 'hfn12@domain.com');
INSERT INTO Homeowner VALUES (4012, 'hn13', 'hf13', 'hfn13@domain.com');
--Q4BELOW
INSERT INTO Homeowner VALUES (4013, 'Q4H1surname', 'Q4H1firstname', 'Q4H1@domain.com');
INSERT INTO Homeowner VALUES (4014, 'Q4H2surname', 'Q4H2firstname', 'Q4H2@domain.com');
INSERT INTO Homeowner VALUES (4015, 'Q4H3surname', 'Q4H3firstname', 'Q4H3@domain.com');
INSERT INTO Homeowner VALUES (4016, 'Q4H4surname', 'Q4H4firstname', 'Q4H4@domain.com');
INSERT INTO Homeowner VALUES (4017, 'Q4H5surname', 'Q4H5firstname', 'Q4H5@domain.com');
INSERT INTO Homeowner VALUES (4018, 'Q4H6surname', 'Q4H6firstname', 'Q4H6@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3002, 'trailer', 3, 3, 'kitchen', 'Toronto', 4002);
INSERT INTO Listing VALUES (3003, 'apartment', 1, 1, 'gym', 'Chicago', 4003);
INSERT INTO Listing VALUES (3004, 'apartment', 1, 1, 'gym', 'Paris', 4004);
INSERT INTO Listing VALUES (3005, 'apartment', 1, 1, 'gym', 'London', 4005);
INSERT INTO Listing VALUES (3006, 'apartment', 1, 1, 'gym', 'Tokyo', 4006);
INSERT INTO Listing VALUES (3007, 'apartment', 1, 1, 'gym', 'Madrid', 4007);
INSERT INTO Listing VALUES (3008, 'apartment', 1, 1, 'gym', 'Glascow', 4008);
INSERT INTO Listing VALUES (3009, 'apartment', 1, 1, 'gym', 'Scarborough', 4009);
INSERT INTO Listing VALUES (3010, 'apartment', 1, 1, 'gym', 'Mississauga', 4010);
INSERT INTO Listing VALUES (3011, 'apartment', 1, 1, 'gym', 'Vaughan', 4011);
INSERT INTO Listing VALUES (3012, 'apartment', 1, 1, 'gym', 'Richmond Hill', 4012);
INSERT INTO Listing VALUES (3013, 'apartment', 1, 1, 'kitchen', 'York', 4002);
--Q4BELOW
INSERT INTO Listing VALUES (3014, 'condo', 1, 1, 'Q4H1', 'Q4HTown1', 4013);
INSERT INTO Listing VALUES (3015, 'condo', 1, 1, 'Q4H2', 'Q4HTown2', 4014);
INSERT INTO Listing VALUES (3016, 'condo', 1, 1, 'Q4H3', 'Q4HTown3', 4015);
INSERT INTO Listing VALUES (3017, 'condo', 1, 1, 'Q4H4', 'Q4HTown4', 4016);
INSERT INTO Listing VALUES (3018, 'condo', 1, 1, 'Q4H5', 'Q4HTown5', 4017);
INSERT INTO Listing VALUES (3019, 'condo', 1, 1, 'Q4H6', 'Q4HTown6', 4018);

-- BOOKINGREQUEST (BOOKINGREQUEST ID, TRAVELERID, LISTINGID, STARTDATE, NUMNIGHT, NUMGUESTS, OFFERPRICE)
INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1000, 3000, '2016-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6002, 1001, 3001, '2016-01-05', 10, 1, 75); -- never had booking
INSERT INTO BookingRequest VALUES (6003, 1000, 3002, '2016-11-05', 3, 3, 900);
INSERT INTO BookingRequest VALUES (6004, 1000, 3003, '2016-11-08', 1, 1, 100);
INSERT INTO BookingRequest VALUES (6005, 1000, 3004, '2016-08-10', 1, 1, 150);
INSERT INTO BookingRequest VALUES (6006, 1000, 3005, '2016-09-05', 1, 1, 300);
INSERT INTO BookingRequest VALUES (6007, 1001, 3006, '2016-04-16', 1, 1, 500);
INSERT INTO BookingRequest VALUES (6008, 1001, 3007, '2016-05-05', 1, 1, 1000);
INSERT INTO BookingRequest VALUES (6009, 1001, 3008, '2016-02-05', 1, 1, 2000);
INSERT INTO BookingRequest VALUES (6010, 1002, 3009, '2016-03-16', 1, 1, 100);
INSERT INTO BookingRequest VALUES (6011, 1002, 3010, '2016-08-05', 1, 1, 100);
INSERT INTO BookingRequest VALUES (6012, 1002, 3011, '2016-10-16', 1, 1, 110);
INSERT INTO BookingRequest VALUES (6013, 1003, 3012, '2016-10-30', 1, 1, 80);
INSERT INTO BookingRequest VALUES (6014, 1004, 3013, '2016-11-18', 1, 1, 75); 
INSERT INTO BookingRequest VALUES (6015, 1000, 3002, '2016-05-02', 1, 1, 10);
INSERT INTO BookingRequest VALUES (6016, 1000, 3013, '2016-11-19', 1, 1, 5); 
-- last 3 above rejected no record in Booking, will not show up in Savers
-- BOOKINGREQUEST (LISTINGID, STARTDATE, TRAVELERID, STARTDATE, NUMNIGHT, NUMGUESTS, PRICE)
INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3002, '2016-11-05', 1000, 1, 1, 20);
INSERT INTO Booking VALUES (3003, '2016-11-08', 1000, 1, 1, 75);
INSERT INTO Booking VALUES (3004, '2016-08-10', 1000, 2, 1, 15);
INSERT INTO Booking VALUES (3005, '2016-09-05', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3006, '2016-04-16', 1001, 1, 1, 90);
INSERT INTO Booking VALUES (3007, '2016-05-05', 1001, 1, 1, 3);
INSERT INTO Booking VALUES (3008, '2016-02-05', 1001, 1, 1, 1000);
INSERT INTO Booking VALUES (3009, '2016-03-16', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3010, '2016-08-05', 1002, 1, 1, 75);
INSERT INTO Booking VALUES (3011, '2016-10-16', 1002, 1, 1, 20);
INSERT INTO Booking VALUES (3012, '2016-10-30', 1003, 1, 1, 120);
INSERT INTO Booking VALUES (3013, '2016-11-18', 1003, 1, 1, 80);
--Q4H1
INSERT INTO Booking VALUES (3014, '2005-01-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2006-02-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2007-03-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2008-04-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2009-05-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2010-06-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2011-07-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2012-08-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2013-09-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2014-10-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2015-11-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2015-12-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2016-05-02', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3014, '2016-06-03', 1012, 1, 1, 100);
--Q4H2
INSERT INTO Booking VALUES (3015, '2005-02-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2006-03-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2007-04-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2008-05-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2009-06-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2010-07-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2011-08-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2012-09-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2013-10-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2014-11-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2015-11-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2015-12-01', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2016-01-01', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3015, '2016-02-02', 1012, 1, 1, 100);
--Q4H3
INSERT INTO Booking VALUES (3016, '2002-02-02', 1011, 1, 1, 50);
--Q4H4
INSERT INTO Booking VALUES (3017, '2015-12-12', 1012, 1, 1, 100);
--Q4H5
INSERT INTO Booking VALUES (3018, '2015-10-10', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3018, '2015-11-11', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3018, '2014-08-08', 1012, 1, 1, 100);
INSERT INTO Booking VALUES (3018, '2014-09-09', 1012, 1, 1, 100);
--Q4H6
INSERT INTO Booking VALUES (3019, '2006-12-20', 1011, 1, 1, 100);
INSERT INTO Booking VALUES (3019, '2009-09-09', 1011, 1, 1, 100);
--Q4H1RATINGS
INSERT INTO TravelerRating VALUES (3014, '2005-01-01', 1, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2006-02-01', 1, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2007-03-01', 2, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2008-04-01', 3, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2009-05-01', 3, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2010-06-01', 3, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2011-07-01', 3, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2012-08-01', 3, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2013-09-01', 3, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2014-10-01', 4, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2015-11-01', 4, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2015-12-01', 5, '1012commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2016-05-02', 5, '1011commentOf3014');
INSERT INTO TravelerRating VALUES (3014, '2016-06-03', 5, '1012commentOf3014');
--Q4H2Ratings
INSERT INTO TravelerRating VALUES (3015, '2005-02-01', 1, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2006-03-01', 1, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2007-04-01', 2, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2008-05-01', 3, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2009-06-01', 1, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2010-07-01', 1, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2011-08-01', 3, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2012-09-01', 3, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2013-10-01', 2, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2014-11-01', 2, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2015-11-01', 4, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2015-12-01', 1, '1012commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2016-01-01', 2, '1011commentOf3015');
INSERT INTO TravelerRating VALUES (3015, '2016-02-02', 5, '1012commentOf3015');
--Q4H3Ratings
INSERT INTO TravelerRating VALUES (3016, '2002-02-02', 5, '1011commentOf3016');
--Q4H4Ratings
INSERT INTO TravelerRating VALUES (3017, '2015-12-12', 4, '1012commentOf3017');
--Q4H5Ratings
INSERT INTO TravelerRating VALUES (3018, '2015-10-10', 4, '1011commentOf3018');
INSERT INTO TravelerRating VALUES (3018, '2015-11-11', 5, '1011commentOf3018');
INSERT INTO TravelerRating VALUES (3018, '2014-08-08', 5, '1012commentOf3018');
INSERT INTO TravelerRating VALUES (3018, '2014-09-09', 3, '1012commentOf3018');
--Q4H6Ratings
INSERT INTO TravelerRating VALUES (3019, '2006-12-20', 4, '1011commentOf3019');
INSERT INTO TravelerRating VALUES (3019, '2009-09-09', 3, '1011commentOf3019');







/*
INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'hcmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'hcmt2');
INSERT INTO HomeownerRating VALUES (3002, '2016-11-05', 4, 'hcmt3');
INSERT INTO HomeownerRating VALUES (3013, '2016-11-18', 4, 'hcmt4');

INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'tcmt1');
INSERT INTO TravelerRating VALUES (3001, '2016-01-05', 3, 'tcmt2');
INSERT INTO TravelerRating VALUES (3002, '2016-11-05', 4, 'tcmt3');
INSERT INTO TravelerRating VALUES (3013, '2016-11-18', 4, 'tcmt4');
*/