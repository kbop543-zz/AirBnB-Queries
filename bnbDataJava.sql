TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;

INSERT INTO Traveler VALUES (1000, 'Stephen', 'Kyra');
INSERT INTO Traveler VALUES (1001, 'Ng', 'Sunny', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1002, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1003, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1004, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1005, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1006, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1007, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1008, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1009, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1010, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1011, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1012, 'n2', 'f2', 'fn2@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4002, 'hn3', 'hf3', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4003, 'hn4', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4004, 'hn5', 'hf2', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4005, 'hn6', 'hf3', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4006, 'hn7', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4007, 'hn8', 'hf2', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4008, 'hn9', 'hf3', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4009, 'hn10', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4010, 'hn11', 'hf2', 'hfn2@domain.com');
INSERT INTO Homeowner VALUES (4011, 'hn12', 'hf3', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'Toronto', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'Kingston', 4001);
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'Waterloo', 4002);
INSERT INTO Listing VALUES (3003, 'house', 2, 4, 'gym', 'Montreal', 4003);
INSERT INTO Listing VALUES (3004, 'house', 2, 4, 'gym', 'Miami', 4004);

INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1000, 3000, '2016-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6002, 1001, 3001, '2016-01-05', 10, 1, 75);

INSERT INTO Booking VALUES (3000, '2016-12-20', 1000, 20, 1, 20);
INSERT INTO Booking VALUES (3001, '2016-01-02', 1001, 15, 1, 12);
INSERT INTO Booking VALUES (3002, '2016-01-02', 1000, 15, 1, 12);
INSERT INTO Booking VALUES (3003, '2010-05-05', 1000, 1825, 1, 10);


INSERT INTO Booking VALUES (3000, '2016-02-05', 1000, 20, 1, 20);
INSERT INTO Booking VALUES (3001, '2016-05-10', 1001, 15, 1, 12);
INSERT INTO Booking VALUES (3002, '2016-03-06', 1002, 15, 1, 12);
INSERT INTO Booking VALUES (3003, '2010-01-05', 1003, 1825, 1, 10);


INSERT INTO BookingRequest VALUES (6003, 1002, 300, '2014-05-05', 10, 1, 75);
--INSERT INTO Booking VALUES (300, '2016-10-05', 1001, 2, 1, 90);

INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');

INSERT INTO CityRegulation VALUES ('Toronto', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('Kingston', 'house', 'max', 90);
--INSERT INTO CityRegulation VALUES ('Waterloo', '', 'max', 90);

INSERT INTO TravelerRating VALUES (3003, '2010-05-05', 4, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2016-01-02', 2, 'cmt3');
INSERT INTO TravelerRating VALUES (3002, '2016-01-02', 1, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2016-12-20', 5, 'cmt3');

INSERT INTO TravelerRating VALUES (3003, '2010-01-05', 4, 'cmt3');
INSERT INTO TravelerRating VALUES (3002, '2016-03-06', 2, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2016-05-10', 1, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2016-02-05', 5, 'cmt3');






