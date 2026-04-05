CREATE DATABASE HealthRecruitment;
DROP DATABASE HealthRecruitment;
Use HealthRecruitment;
CREATE TABLE Candidate(
candidateID int,
first_name VARCHAR(25),
last_name VARCHAR(25),
email VARCHAR(50),
nationality VARCHAR(25),
skill VARCHAR(25),
PRIMARY KEY (candidateID)
);

INSERT into Candidate(candidateID, first_name, last_name, email, nationality, skill) values (1123, 'Tamqrah', 'Culham', 'tculham0@europa.eu', 'United States', 'Radiologist');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (2342, 'Corrinne', 'Ogley', 'cogley1@paypal.com', 'France', 'Pharmacist');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (3543, 'Willie', 'McElree', 'wmcelree2@stumbleupon.com', 'France', 'Pharmacist');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (4532, 'Odette', 'Kemmis', 'okemmis3@uiuc.edu', 'France', 'Nurse');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (5424, 'Schuyler', 'Goldberg', 'sgoldberg4@oakley.com', 'United States', 'Doctor');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (6113, 'Randie', 'Ready', 'rready5@cnn.com', 'France', 'Surgeon');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (7968, 'Rafaellle', 'Heskin', 'rheskin6@cisco.com', 'United States', 'Radiologist');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (8946, 'Herculie', 'Fessler', 'hfessler7@dot.gov', 'France', 'Radiologist');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (9097, 'Mariejeanne', 'Yearns', 'myearns8@smugmug.com', 'United States', 'Surgeon');
INSERT into Candidate (candidateID, first_name, last_name, email, nationality, skill) values (1023, 'Gusti', 'Rennocks', 'grennocks9@google.de', 'France', 'Pharmacist');

CREATE TABLE Skills(
skill VARCHAR(25),
can_drive BOOLEAN,
second_language VARCHAR(25),
PRIMARY KEY (skill)
);
INSERT into Skills (skill, can_drive, second_language) values ('Radiologist', false, 'Tagalog');
INSERT into Skills (skill, can_drive, second_language) values ('Pharmacist', false, 'Spanish');
INSERT into Skills (skill, can_drive, second_language) values ('Pharmacist', false, 'Ido');
INSERT into Skills (skill, can_drive, second_language) values ('Nurse', false, 'Chuvash');
INSERT into Skills (skill, can_drive, second_language) values ('Doctor', false, 'Korean');
INSERT into Skills (skill, can_drive, second_language) values ('Surgeon', true, 'Latin');
INSERT into Skills (skill, can_drive, second_language) values ('Radiologist', false, 'Interlingua (International Auxiliary Language Association)');
INSERT into Skills (skill, can_drive, second_language) values ('Radiologist', false, 'Amharic');
INSERT into Skills (skill, can_drive, second_language) values ('Surgeon', true, 'Kalaallisut');
INSERT into Skills (skill, can_drive, second_language) values ('Pharmacist', false, 'Icelandic');

CREATE TABLE Education(
candidateID int,
college_name VARCHAR(25),
degree VARCHAR(25),
results VARCHAR(25),
year_grad int
);

INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('1123', 'Coastal Carolina University', 'Radiology', 'Honours', 2006);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('2342', 'Pädagogische Hochschule Freiburg', 'Pharmacy', 'Honours', 2003);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('3543', 'Universidade Vale do Rio Doce', 'Pharmacy', 'Honours', 2011);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('4532', 'Azerbaijan University ol Languages', 'Nursing Practice', 'Higher Certificate', 1994);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('5424', 'Solapur University', 'Doctor of Medicine', 'Masters', 2000);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('6113', 'Chukyo Gakuin University', 'Doctor of Surgery', 'Surgeon', 2009);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('7968', 'Cross River University of Science and Technology', 'Radiology', 'Masters', 2004);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('8946', 'Academy of Sports and Physical Training', 'Radiology', 'Higher Certificate', 2007);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('9097', 'Amravati University', 'Doctor of Surgery', 'Surgeon', 2011);
INSERT into Education (candidateID, college_name, degree, results, year_grad) values ('1023', 'University of Presov', 'Pharmacy', 'Honours', 1993);

CREATE TABLE ID(
candidateID int,
has_passport BOOLEAN,
has_documents BOOLEAN
);

INSERT into ID (candidateID, has_passport, has_documents) values (1123, false, false);
INSERT into ID (candidateID, has_passport, has_documents) values (2342, true, false);
INSERT into ID (candidateID, has_passport, has_documents) values (3543, true, false);
INSERT into ID (candidateID, has_passport, has_documents) values (4532, true, true);
INSERT into ID (candidateID, has_passport, has_documents) values (5424, true, true);
INSERT into ID (candidateID, has_passport, has_documents) values (6113, false, true);
INSERT into ID (candidateID, has_passport, has_documents) values (7968, true, false);
INSERT into ID (candidateID, has_passport, has_documents) values (8946, false, true);
INSERT into ID (candidateID, has_passport, has_documents) values (9097, false, false);
INSERT into ID (candidateID, has_passport, has_documents) values (1023, true, false);

CREATE TABLE Experience(
candidateID int,
previous_employer VARCHAR(25),
still_employed BOOLEAN,
years_experience int,
title_held VARCHAR(25)
);

INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (1123, 'WALTHALL GENERAL HOSPITAL', false, 21, 'Radiologist');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (2342, 'CAROLINAS MEDICAL CENTER-NORTHEAST', false, 9, 'Pharmacist');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (3543, 'MENNONITE GENERAL HOSPITAL INC', false, 8, 'Pharmacist');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (4532, 'BANNER -- UNIVERSITY MEDICAL CENTER PHX CAMPUS LIVER DISEASE SERVICES', true, 9, 'Nurse');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (5424, 'GREAT RIVER MEDICAL CENTER', true, 21, 'Doctor');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (6113, 'KENTUCKY HOSPITAL, LLC', false, 25, 'Surgeon');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (7968, 'THE METHODIST HOSPITALS,INC. - PROGRESSIVE CARE UNIT', true, 9, 'Radiologist');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (8946, 'NAVAL HOSPITAL YOKOSUKA', false, 16, 'Radiologist');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (9097, 'UCSF MEDICAL CENTER', false, 24, 'Surgeon');
INSERT into Experience (candidateID, previous_employer , still_employed, years_experience, title_held) values (1023, 'SWEET MEDICAL CENTER CORP', false, 1, 'Pharmacist');
