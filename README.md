# Create and Explore Simple Dataset with SQL

As the basis of relational database, SQL has so many commands. In the previous <a href="https://github.com/KharismaBima/CFPB-Complaints-Data-Exploration-with-SQL">project</a>, I've shown how I use some of the commands like DQL, Aggregate Functions, and Converting Data Types during data exploration process.
So this time I'll practice more SQL commands, and going through some little challenges. Because well.. If it less challenging it'll be bored right? and also at least I can explore my own dataset that I've created.

## Let get started!
### Let's make the dataset of Jujutsu High School Student using CREATE TABLE, and fill its values using INSERT INTO function

<details>

<summary> <code> SQL Query </code> </summary>

```sql
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
('101', 'Kirara', 'Hoshi', null, 18, 165, 58, null, 'Senior');
```

</details>

The upper table should look like this 

| id  | firstname | lastname  | ability                    | age | height | weight | grade         | class     |
|-----|-----------|-----------|----------------------------|-----|--------|--------|---------------|-----------|
| 108 | Itadori   | Yuuji     | Sukuna Vessel              | 15  | 178    | 80     |               | Freshman  |
| 109 | Nobara    | Kugisaki  | Cursed Energy Manipulation | 16  | 160    | 55     | Grade 3       | Freshman  |
| 107 | Megumi    | Fushiguro | Summoning Curse            | 15  | 175    | 60     | Grade 2       | Freshman  |
| 106 | Maki      | Zenin     | Weapon Mastery             | 16  | 170    | 55     | Graded 4      | Sophomore |

### We also have the Record of Student Battles during Season 1, let's also make it into the dataset

<details>

<summary> <code> SQL Query </code> </summary>

```sql
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
```

</details>

The upper table should look like this

| battle_id | battle_event             | id  | opponent           | battle_status                      |
|-----------|--------------------------|-----|--------------------|------------------------------------|
| 1         | Sugisawa HS Arc          | 108 | Cursed Spirit      | Opponent Annihiliated              |
| 1         | Sugisawa HS Arc          | 107 | Cursed Spirit      | Opponent Annihiliated              |
| 2         | Roppongi Building Arc    | 108 | Cursed Spirit      | Opponent Annihiliated              |
| 2         | Roppongi Building Arc    | 109 | Cursed Spirit      | Opponent Annihiliated              |
| 3         | Eishu Juvenile Arc       | 108 | Finger Bearer      | Opponent Annihiliated              |

## Challenge
Find how many battles did the sophomore students face in season 1
<details>

<summary> <code> SQL Solution </code> </summary>

```sql
SELECT s.firstname, s.lastname, sb.battle_event, sb.opponent
FROM student s
INNER JOIN student_battle sb
ON s.id=sb.id
WHERE Class = 'Sophomore'
```

</details>

### Answer

The sophomores have been involved in a battles **five** times during season 1, and Yuta Okkotsu is the only sophomore who hasn't involved in a single battle.

## More Challenges!!
1. There's many Jujutsu High Schools across Japan, let's specify the dataset by naming it "Tokyo_student".
2. Let's change the "id" column name to "student_id" in both tables using ALTER and RENAME command.
3. Let's Merge firstname and lastname column as new studentname column in Tokyo_student table.
4. Counting how many times Yuuji involved in a battle during season 1 using JOIN function, and subquery.
5. Finding the students who doesn't have any battle (or appearance) in season 1.
6. Wait, who is Zoro? he's not one of Jujutsu HS student. Get rid of him from the data using DELETE function!

### The queries and the results are available in this repository. Cheers!







