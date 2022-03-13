/* Basic SQL Project II: Jujutsu High School Project */
--Create Table, DML Functions, Join Functions, Subqueries, Aggregate Functions

--Let's make the dataset of Jujutsu High School Student
CREATE TABLE Student (
    ID int,
    FirstName varchar(255),
    LastName varchar(255),
    Ability varchar(255),
    Age int,
    Height int,
    Weight int,
    Grade varchar (255),
    Class varchar(255)    
)

INSERT INTO student (id, firstname, lastname, ability, age, height, weight, grade, class)
VALUES 
('108', 'Itadori', 'Yuuji', 'Sukuna Vessel', 15, 178, 80, null, 'Freshman'),
('109', 'Nobara', 'Kugisaki', 'Cursed Energy Manipulation', 16, 160, 55, 'Grade 3','Freshman'),
('107', 'Megumi', 'Fushiguro', 'Summoning Curse', 15, 175, 60, 'Grade 2', 'Freshman'),
('106', 'Maki', 'Zenin', 'Weapon Mastery', 16, 170, 55, 'Graded 4', 'Sophomore'),
('69', 'Roronoa', 'Zoro', 'Sword Mastery', 22, 178, 85, 'infinity', 'Sophomore'),
('105', 'Toge', 'Inumaki', 'Cursed Speech', 17, 164, 58, 'Semi-Grade 1', 'Sophomore'),
('104', 'Panda', null , 'Physical Strength', 3, 200, 150, 'Semi-Grade 2', 'Sophomore'),
('103', 'Yuta', 'Okkotsu', 'Rika Cursed Spirit', 17, 165, 57, 'Special Grade', 'Sophomore'),
('102', 'Kinji', 'Hakari', null, 19, 187, 85, null, 'Senior'),
('101', 'Kirara', 'Hoshi', null, 18, 165, 58, null, 'Senior')


--Make the dataset of Student Battles in Season 1
CREATE TABLE Student_Battle (
    Battle_ID int,
    Battle_Event varchar (255),
    id int,
    Opponent varchar(255),
    Battle_status varchar(255)
)

INSERT INTO student_battle(battle_id, battle_event, id, opponent, battle_status)
VALUES 
(1, 'Sugisawa HS Arc', 108, 'Cursed Spirit', 'Opponent Annihiliated'),
(1, 'Sugisawa HS Arc', 107, 'Cursed Spirit', 'Opponent Annihiliated'),
(2, 'Roppongi Building Arc', 108, 'Cursed Spirit', 'Opponent Annihiliated'),
(2, 'Roppongi Building Arc', 109, 'Cursed Spirit', 'Opponent Annihiliated'),
(3, 'Eishu Juvenile Arc', 108, 'Finger Bearer', 'Opponent Annihiliated'),
(3, 'Eishu Juvenile Arc', 109, 'Cursed Spirit', 'Opponent Annihiliated'),
(3, 'Eishu Juvenile Arc', 107, 'Cursed Spirit', 'Opponent Annihiliated'),
(3, 'Eishu Juvenile Arc', 107, 'Sukuna', 'Yuuji Killed by Sukuna'),
(4, 'Kyoto Student Visit', 107, 'Aoi Todo', 'Stopped by Toge and Panda'),
(4, 'Kyoto Student Visit', 109, 'Mai Zenin', 'Stopped by Todo'),
(5, 'Kinema Theater Arc', 108, 'Transfigured Human', 'Opponent Annihiliated'),
(5, 'Kinema Theater Arc', 108, 'Mahito', 'Opponent Escaped'),
(5, 'Kinema Theater Arc', 108, 'Junpei Yoshino', 'Opponent Annihiliated'),
(6, 'Kyoto Goodwill Event Arc', 108, 'Aoi Todo', 'Interupted by Hanami'),
(6, 'Kyoto Goodwill Event Arc', 104, 'Mechamaru', 'Panda win'),
(6, 'Kyoto Goodwill Event Arc', 106, 'Kasumi Miwa', 'Maki Win'),
(6, 'Kyoto Goodwill Event Arc', 109, 'Momo Nishimiya', 'Nobara Lost (Momo helped by Mai)'),
(6, 'Kyoto Goodwill Event Arc', 106, 'Mai Zenin', 'Maki Win'),
(6, 'Kyoto Goodwill Event Arc', 107, 'Noritoshi Kamo', 'Interupted by Hanami'),
(6, 'Kyoto Goodwill Event Arc', 107, 'Hanami', 'Yuji and Todo take over the Battle'),
(6, 'Kyoto Goodwill Event Arc', 106, 'Hanami', 'Yuji and Todo take over the Battle'),
(6, 'Kyoto Goodwill Event Arc', 105, 'Hanami', 'Yuji and Todo take over the Battle'),
(6, 'Kyoto Goodwill Event Arc', 84, 'Hanami', 'Yuji and Todo take over the Battle'),
(6, 'Kyoto Goodwill Event Arc', 108, 'Hanami', 'Opponent Annihiliated (by Gojo)'),
(6, 'Kyoto Goodwill Event Arc', 86, 'Hanami', 'Opponent Annihiliated (by Gojo)'),
(7, 'Yasohachi Bridge Arc', 107, 'Cursed Spirit', 'Opponent Annihiliated'),
(7, 'Yasohachi Bridge Arc', 107, 'Finger Bearer', 'Opponent Annihiliated'),
(7, 'Yasohachi Bridge Arc', 108, 'Eso', 'Opponent Annihiliated'),
(7, 'Yasohachi Bridge Arc', 109, 'Kechizu', 'Opponent Annihiliated')


--Find how many battles the sophomore students face in season 1
SELECT s.firstname, s.lastname, sb.battle_event, sb.opponent
FROM student s
INNER JOIN student_battle sb
ON s.id=sb.id
WHERE Class = 'Sophomore'


/* Challenges */

--1. There's many Jujutsu High Schools across Japan, specify the dataset by naming it "Tokyo_student"
ALTER TABLE student
RENAME TO Tokyo_student

--2. Change the "id" column name to "student_id" in both tables
ALTER TABLE Tokyo_student
RENAME COLUMN id TO student_id

ALTER TABLE student_battle
RENAME COLUMN id TO student_id

--3. Merge firstname and lastname column as new studentname column in Tokyo_student table
SELECT student_id, CONCAT(firstname,' ',lastname) AS studentname, ability, age, height, weight, grade, class
FROM Tokyo_student

--4. Count how many times Yuuji involved in a battle during season 1
SELECT COUNT(sb.*) AS Yuuji_Battles
FROM (SELECT student_id, CONCAT(firstname,' ',lastname) AS studentname, ability, age, height, weight, grade, class
FROM Tokyo_student) AS ts
JOIN student_battle AS sb
ON ts.student_id = sb.student_id
WHERE ts.studentname = 'Itadori Yuuji' 

--Yuuji has involved in 9 battles in Season 1

--5. Show the students who doesn't have any battle (or appearance) in season 1
SELECT ts.studentname, ts.student_id
FROM (SELECT student_id, CONCAT(firstname,' ',lastname) AS studentname, ability, age, height, weight, grade, class
FROM Tokyo_student) AS ts
LEFT JOIN student_battle AS sb
ON ts.student_id = sb.student_id
WHERE battle_event IS NULL

--Hoshi, Hakari, Zoro, and Okkotsu doesn't involve any battle in Season 1

--6. Wait, who is Zoro? Get rid of him from the data!
DELETE FROM Tokyo_student WHERE student_id = 69