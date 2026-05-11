INSERT INTO Prisoner (Prisoner_ID, Last_Name, First_Name, Date_Of_Birth, Block, Room, Start_Of_Term, End_Of_Term) VALUES 
    (1,  'Smith',    'Alex',    '1990-05-15', 1, 101, '2023-01-10', '2025-01-10'),
    (2,  'Johnson',  'Dmitry',  '1985-08-22', 1, 102, '2022-06-15', '2027-06-15'),
    (3,  'Williams', 'Sergey',  '1995-12-03', 2, 201, '2023-03-20', '2024-03-20'),
    (4,  'Brown',    'Andrey',  '1988-04-17', 2, 202, '2021-11-01', '2026-11-01'),
    (5,  'Jones',    'Oleg',    '1992-07-30', 3, 301, '2023-09-05', '2028-09-05'),
    (6,  'Davis',    'Maxim',   '1980-01-25', 3, 302, '2020-12-12', '2030-12-12'),
    (7,  'Miller',   'Eugene',  '1998-03-14', 1, 103, '2024-01-15', '2026-01-15'),
    (8,  'Wilson',   'Vladimir','1975-09-09', 2, 203, '2019-05-20', '2029-05-20'),
    (9,  'Moore',    'Nikolai', '1993-11-28', 3, 303, '2022-08-01', '2024-08-01'),
    (10, 'Taylor',   'Artyom',  '2000-02-19', 1, 104, '2024-02-10', '2025-02-10')
;

INSERT INTO Criminal_Code_Article (Article_ID, Article_Code, Description) VALUES 
    (1,  '105',   'Murder'),
    (2,  '158',   'Robbery'),
    (3,  '161',   'Armed Robbery'),
    (4,  '228',   'Illegal acquisition, storage, transportation, manufacturing, processing of narcotic substances'),
    (5,  '111',   'Intentional infliction of grievous bodily harm'),
    (6,  '158.1', 'Petty theft'),
    (7,  '264.1', 'Traffic violation by a person subjected to administrative punishment'),
    (8,  '207',   'Knowingly false report of an act of terrorism'),
    (9,  '119',   'Threat of murder or infliction of grievous bodily harm'),
    (10, '306',   'Escape from prison')
;

INSERT INTO Prisoner_Article (Prisoner_ID, Article_ID, Conviction_Date, Sentence_Years) VALUES 
    (1, 1, '2023-01-10', 2),
    (1, 2, '2023-01-10', 2),
    (2, 3, '2022-06-15', 5),
    (2, 5, '2022-06-15', 5),
    (3, 4, '2023-03-20', 1),
    (4, 1, '2021-11-01', 5),
    (4, 3, '2021-11-01', 5),
    (5, 4, '2023-09-05', 5),
    (5, 6, '2023-09-05', 5),
    (6, 1, '2020-12-12', 10),
    (6, 2, '2020-12-12', 10),
    (7, 6, '2024-01-15', 2),
    (8, 1, '2019-05-20', 10),
    (9, 9, '2022-08-01', 2),
    (9, 4, '2022-08-01', 2),
    (10, 7, '2024-02-10', 1)
;

INSERT INTO Employee (Employee_ID, Last_Name, First_Name, Job_Title, Date_Of_Admission) VALUES 
    (1,  'Sokolov',   'Ivan',    'Department Head',    '2010-03-15'),
    (2,  'Kozlov',    'Peter',   'Senior Inspector',   '2015-07-20'),
    (3,  'Novikov',   'Alex',    'Inspector',          '2018-11-01'),
    (4,  'Morozova',  'Elena',   'Inspector',          '2019-02-10'),
    (5,  'Petrova',   'Maria',   'Psychologist',       '2016-09-05'),
    (6,  'Volkov',    'Denis',   'Guard',              '2020-01-15'),
    (7,  'Zaitsev',   'Artyom',  'Guard',              '2021-06-20'),
    (8,  'Solovyova', 'Anna',    'Medical Worker',     '2017-04-12'),
    (9,  'Vasiliev',  'Oleg',    'Guard',              '2022-03-01'),
    (10, 'Pavlov',    'Nikita',  'Inspector',          '2023-08-14')
;

INSERT INTO Conscription (Conscription_ID, Prisoner_ID, Date, Description) VALUES 
    (1,  1, '2024-01-20', 'Violation of daily routine'),
    (2,  2, '2023-12-10', 'Refusal to work'),
    (3,  3, '2024-01-15', 'Fight with another prisoner'),
    (4,  4, '2023-11-05', 'Insulting an employee'),
    (5,  5, '2024-01-10', 'Possession of prohibited items'),
    (6,  6, '2023-10-25', 'Attempted escape'),
    (7,  7, '2024-02-01', 'Violation of fire safety rules'),
    (8,  8, '2023-09-15', 'Refusal of medical examination'),
    (9,  9, '2024-01-05', 'Fight with another prisoner'),
    (10, 10,'2024-02-10', 'Profanity in a public place'),
    (11, 2, '2024-01-25', 'Property damage'),
    (12, 5, '2024-02-05', 'Failure to comply with lawful employee demands')
;

INSERT INTO Punishment (Punishment_ID, Conscription_ID, Start_Date, End_Date, Description) VALUES 
    (1,  1, '2024-01-21', '2024-01-28', 'Segregation unit for 7 days'),
    (2,  2, '2023-12-11', '2023-12-20', 'Visitation suspension for 10 days'),
    (3,  3, '2024-01-16', '2024-01-30', 'Segregation unit for 15 days'),
    (4,  4, '2023-11-06', '2023-11-12', 'Reprimand with entry in personal file'),
    (5,  5, '2024-01-11', '2024-01-18', 'Segregation unit for 8 days'),
    (6,  6, '2023-10-26', '2023-11-25', 'Stricter confinement conditions for 30 days'),
    (7,  7, '2024-02-02', '2024-02-09', 'Warning'),
    (8,  8, '2023-09-16', '2023-09-23', 'Reprimand'),
    (9,  9, '2024-01-06', '2024-01-20', 'Segregation unit for 15 days'),
    (10, 10,'2024-02-11', '2024-02-14', 'Verbal warning'),
    (11, 11,'2024-01-26', '2024-02-05', 'Segregation unit for 10 days'),
    (12, 12,'2024-02-06', '2024-02-13', 'Reprimand')
;

INSERT INTO Duty_Schedule (Duty_Schedule_ID, Employee_ID, Date, Start_Time, End_Time) VALUES 
    (1,  1, '2024-03-01', '08:00:00', '17:00:00'),
    (2,  2, '2024-03-01', '08:00:00', '17:00:00'),
    (3,  3, '2024-03-01', '20:00:00', '08:00:00'),
    (4,  4, '2024-03-02', '08:00:00', '17:00:00'),
    (5,  5, '2024-03-02', '20:00:00', '08:00:00'),
    (6,  6, '2024-03-03', '08:00:00', '17:00:00'),
    (7,  7, '2024-03-03', '20:00:00', '08:00:00'),
    (8,  8, '2024-03-04', '08:00:00', '17:00:00'),
    (9,  9, '2024-03-04', '20:00:00', '08:00:00'),
    (10, 10,'2024-03-05', '08:00:00', '17:00:00'),
    (11, 1, '2024-03-05', '20:00:00', '08:00:00'),
    (12, 2, '2024-03-06', '08:00:00', '17:00:00'),
    (13, 3, '2024-03-06', '20:00:00', '08:00:00'),
    (14, 4, '2024-03-07', '08:00:00', '17:00:00'),
    (15, 5, '2024-03-07', '20:00:00', '08:00:00'),
    (16, 6, '2024-03-08', '08:00:00', '17:00:00'),
    (17, 7, '2024-03-08', '20:00:00', '08:00:00'),
    (18, 8, '2024-03-09', '08:00:00', '17:00:00'),
    (19, 9, '2024-03-09', '20:00:00', '08:00:00'),
    (20, 10,'2024-03-10', '08:00:00', '17:00:00')
;

INSERT INTO Visit (Visit_ID, Prisoner_ID, Employee_ID, Visitor_Last_Name, Visitor_First_Name, Document, Visit_Date, Description) VALUES 
    (1,  1, 3, 'Smith',    'Olga',    'Passport 4512 345678', '2024-01-15', 'Wife'),
    (2,  1, 3, 'Smith',    'Ivan',    'Passport 4512 345679', '2024-02-10', 'Brother'),
    (3,  2, 4, 'Johnson',  'Irina',   'Passport 4512 345680', '2023-12-20', 'Mother'),
    (4,  3, 4, 'Williams', 'Tatiana', 'Passport 4512 345681', '2024-01-05', 'Sister'),
    (5,  4, 3, 'Brown',    'Svetlana','Passport 4512 345682', '2023-11-15', 'Wife'),
    (6,  5, 5, 'Sidorov',  'Mikhail', 'Passport 4512 345683', '2024-01-25', 'Lawyer'),
    (7,  6, 6, 'Davis',    'Ekaterina','Passport 4512 345684','2023-10-10', 'Wife'),
    (8,  7, 7, 'Miller',   'Natalia', 'Passport 4512 345685', '2024-02-01', 'Mother'),
    (9,  8, 8, 'Wilson',   'Lyudmila','Passport 4512 345686', '2023-09-05', 'Wife'),
    (10, 9, 9, 'Moore',    'Denis',   'Passport 4512 345687', '2024-01-30', 'Brother'),
    (11, 10,10, 'Taylor',   'Anna',    'Passport 4512 345688', '2024-02-15', 'Mother'),
    (12, 2, 3, 'Johnson',  'Sergey',  'Passport 4512 345689', '2024-01-18', 'Father'),
    (13, 5, 4, 'Williams', 'Andrey',  'Passport 4512 345690', '2024-02-05', 'Brother'),
    (14, 1, 5, 'Smith',    'Olga',    'Passport 4512 345678', '2024-02-20', 'Wife'),
    (15, 8, 6, 'Wilson',   'Alex',    'Passport 4512 345691', '2024-01-12', 'Son')
;