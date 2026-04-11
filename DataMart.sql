DROP DATABASE IF EXISTS HealthRecruitmentDM;
CREATE DATABASE HealthRecruitmentDM;
USE HealthRecruitmentDM;



CREATE TABLE Candidate (
    candidate_key INT PRIMARY KEY,
    candidateID INT,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(50),
    nationality VARCHAR(25)
);

CREATE TABLE Skill (
    skill_key INT PRIMARY KEY,
    skill VARCHAR(35),
    can_drive BOOLEAN,
    second_language VARCHAR(60)
);

CREATE TABLE Education (
    education_key INT PRIMARY KEY,
    college_name VARCHAR(100),
    degree VARCHAR(50),
    results VARCHAR(30),
    year_grad INT
);

CREATE TABLE Visa (
    visa_key INT PRIMARY KEY,
    visa_type VARCHAR(30),
    visa_status VARCHAR(20),
    expiry_year INT
);

CREATE TABLE Documents (
    document_key INT PRIMARY KEY,
    has_passport BOOLEAN,
    has_documents BOOLEAN
);


CREATE TABLE Recruitment (
    fact_id INT PRIMARY KEY,
    candidate_key INT,
    skill_key INT,
    education_key INT,
    visa_key INT,
    document_key INT,
    candidate_count INT DEFAULT 1,
    FOREIGN KEY (candidate_key) REFERENCES Candidate(candidate_key),
    FOREIGN KEY (skill_key) REFERENCES Skill(skill_key),
    FOREIGN KEY (education_key) REFERENCES Education(education_key),
    FOREIGN KEY (visa_key) REFERENCES Visa(visa_key),
    FOREIGN KEY (document_key) REFERENCES Documents(document_key)
);



INSERT INTO Candidate (candidate_key, candidateID, first_name, last_name, email, nationality) VALUES
(1, 1, 'Tamqrah', 'Culham', 'tculham0@europa.eu', 'United States'),
(2, 2, 'Corrinne', 'Ogley', 'cogley1@paypal.com', 'France'),
(3, 3, 'Willie', 'McElree', 'wmcelree2@stumbleupon.com', 'Ireland'),
(4, 4, 'Odette', 'Kemmis', 'okemmis3@uiuc.edu', 'France'),
(5, 5, 'Schuyler', 'Goldberg', 'sgoldberg4@oakley.com', 'Germany'),
(6, 6, 'Randie', 'Ready', 'rready5@cnn.com', 'United Kingdom'),
(7, 7, 'Rafaellle', 'Heskin', 'rheskin6@cisco.com', 'United States'),
(8, 8, 'Herculie', 'Fessler', 'hfessler7@dot.gov', 'France'),
(9, 9, 'Mariejeanne', 'Yearns', 'myearns8@smugmug.com', 'Canada'),
(10, 10, 'Gusti', 'Rennocks', 'grennocks9@google.de', 'Iceland');

INSERT INTO Skill (skill_key, skill, can_drive, second_language) VALUES
(1, 'radiologist', false, 'Spanish'),
(2, 'pharmacist', false, 'English'),
(3, 'nurse', false, 'French'),
(4, 'doctor', true, 'German'),
(5, 'surgeon', true, 'French'),
(6, 'paramedic', true, 'Amharic'),
(7, 'therapist', false, 'Italian'),
(8, 'dentist', true, 'Portuguese'),
(9, 'midwife', false, 'Arabic'),
(10, 'lab technician', true, 'Dutch');

INSERT INTO Education (education_key, college_name, degree, results, year_grad) VALUES
(1, 'Coastal Carolina University', 'Radiology', 'Honours', 2006),
(2, 'Pädagogische Hochschule Freiburg', 'Pharmacy', 'Honours', 2003),
(3, 'Universidade Vale do Rio Doce', 'Pharmacy', 'Honours', 2011),
(4, 'Azerbaijan University of Languages', 'Nursing Practice', 'Higher Certificate', 1994),
(5, 'Solapur University', 'Doctor of Medicine', 'Masters', 2000),
(6, 'Chukyo Gakuin University', 'Doctor of Surgery', 'Honours', 2009),
(7, 'Cross River University of Science and Technology', 'Emergency Care', 'Masters', 2004),
(8, 'Academy of Sports and Physical Training', 'Therapy Studies', 'Higher Certificate', 2007),
(9, 'Amravati University', 'Dental Surgery', 'Honours', 2011),
(10, 'University of Presov', 'Midwifery', 'Honours', 1993);

INSERT INTO Visa (visa_key, visa_type, visa_status, expiry_year) VALUES
(1, 'Work Visa', 'Pending', 2027),
(2, 'Residence Visa', 'Approved', 2028),
(3, 'Work Visa', 'Approved', 2026),
(4, 'Student Visa', 'Expired', 2023),
(5, 'Residence Visa', 'Approved', 2029),
(6, 'Work Visa', 'Pending', 2027),
(7, 'Temporary Visa', 'Approved', 2026),
(8, 'Residence Visa', 'Rejected', 2025),
(9, 'Work Visa', 'Approved', 2028),
(10, 'Temporary Visa', 'Pending', 2026);

INSERT INTO Documents (document_key, has_passport, has_documents) VALUES
(1, false, false),
(2, true, false),
(3, true, false),
(4, true, true),
(5, true, true),
(6, false, true),
(7, true, false),
(8, false, true),
(9, false, false),
(10, true, false);


INSERT INTO Recruitment
(fact_id, candidate_key, skill_key, education_key, visa_key, document_key, candidate_count)
VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2, 1),
(3, 3, 2, 3, 3, 3, 1),
(4, 4, 3, 4, 4, 4, 1),
(5, 5, 4, 5, 5, 5, 1),
(6, 6, 5, 6, 6, 6, 1),
(7, 7, 6, 7, 7, 7, 1),
(8, 8, 7, 8, 8, 8, 1),
(9, 9, 8, 9, 9, 9, 1),
(10, 10, 9, 10, 10, 10, 1);

-- 1st query: retreive information about the number of candidate group by skills and visa status  --

SELECT s.skill, v.visa_status, SUM(f.candidate_count) AS total_candidates
FROM Recruitment f
JOIN Skill s ON f.skill_key = s.skill_key
JOIN Visa v ON f.visa_key = v.visa_key
GROUP BY s.skill, v.visa_status
ORDER BY total_candidates DESC;

-- 2nd Query: Retrieve a Doctor for a role which requires who has a masters, including first name and last name. --

SELECT c.first_name AS "First Name",
c.last_name AS "Last Name",
s.skill AS "Skill",
e.degree AS "Degree",
e.results AS "Award"
FROM Recruitment r
JOIN Candidate c ON r.candidate_key=c.candidate_key
JOIN Skill s ON r.skill_key=s.skill_key
JOIN Education e ON r.education_key=e.education_key
WHERE s.skill='doctor' AND e.results='masters';






