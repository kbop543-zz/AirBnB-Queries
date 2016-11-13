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
INSERT INTO Traveler VALUES (1013, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1014, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1015, 'Stephen', 'Kyra', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1016, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1017, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1018, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1019, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1020, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1021, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1022, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1023, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1024, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1025, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1026, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1027, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1028, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1029, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1030, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1031, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1032, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1033, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1034, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1035, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1036, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1037, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1038, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1039, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1040, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1041, 'n2', 'f2', 'fn2@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'Toronto', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'Kingston', 4001);
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'Waterloo', 4001);

INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1000, 3000, '2016-10-16', 4, 1, 120);
--max for Kyra is Kingston
INSERT INTO BookingRequest VALUES (6004, 1000, 3000, '2016-09-16', 4, 1, 120);

INSERT INTO BookingRequest VALUES (6005, 1000, 3001, '2016-08-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6006, 1000, 3001, '2016-07-16', 4, 1, 120);

INSERT INTO BookingRequest VALUES (6007, 1000, 3001, '2016-06-16', 4, 1, 120);

INSERT INTO BookingRequest VALUES (6008, 1001, 3000, '2016-05-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6009, 1001, 3000, '2016-04-16', 4, 1, 120);
--INSERT INTO BookingRequest VALUES (6010, 1000, 3000, '2016-03-16', 4, 1, 120);
--INSERT INTO BookingRequest VALUES (6011, 1000, 3000, '2016-02-16', 4, 1, 120);

--INSERT INTO BookingRequest VALUES (6002, 1001, 3001, '2016-01-05', 10, 1, 75);
--INSERT INTO BookingRequest VALUES (6003, 1002, 300, '2014-05-05', 10, 1, 75);

INSERT INTO Booking VALUES (3000, '2016-12-20', 1000, 20, 1, 20);
INSERT INTO Booking VALUES (3000, '2016-01-05', 1001, 15, 1, 12);
INSERT INTO Booking VALUES (3000, '2016-01-02', 1001, 15, 1, 12);
INSERT INTO Booking VALUES (3001, '2010-05-05', 1001, 1825, 1, 10);
INSERT INTO Booking VALUES (3002, '2010-02-05', 1003, 100, 1, 10);



--INSERT INTO Booking VALUES (300, '2016-10-05', 1001, 2, 1, 90);

--INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
--INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');

INSERT INTO CityRegulation VALUES ('Toronto', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('Kingston', 'house', 'max', 90);
--INSERT INTO CityRegulation VALUES ('Waterloo', '', 'max', 90);

--INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 4, 'cmt3');






