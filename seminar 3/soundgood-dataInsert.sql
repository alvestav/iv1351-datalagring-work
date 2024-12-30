INSERT INTO person (first_name, last_name, home_address, phone_number, email) 
VALUES
    ('Ali','Webster','P.O. Box 959, 1435 Urna Road','1-555-277-6731','pretium.neque@hotmail.net'),
    ('Andrew','Mendez','P.O. Box 929, 8984 Iaculis, Road','303-1716','cursus.integer.mollis@hotmail.net'),
    ('Elmo','Richardson','157-5303 Tellus. Ave','225-3257','placerat.cras@aol.couk'),
    ('Karyn','Mullins','Ap #188-8550 Quam. St.','1-814-266-5185','in.condimentum@aol.com'),
    ('Otto','Owens','Ap #655-7731 Aliquam Av.','158-6308','non.massa.non@yahoo.org'),
    ('Graham','Sexton','6252 Sem Avenue','1-571-263-2727','arcu.et.pede@outlook.edu'),
    ('Uma','Mayo','Ap #136-4769 Ut, Rd.','1-583-484-0670','duis@yahoo.org'),
    ('Sharon','Blackburn','Ap #822-1662 Sed St.','1-365-543-1862','natoque@hotmail.com'),
    ('Larissa','Goff','Ap #193-4964 Maecenas Avenue','(254) 467-8219','ornare.fusce@icloud.couk'),
    ('Jessamine','Hardy','P.O. Box 265, 2346 Tellus. Rd.','(654) 615-0388','lacus.vestibulum@icloud.couk');;

INSERT INTO lesson_info (price, discounted_price, skill_level, lesson_type)
VALUES
    ('5', '4', 'Beginner', 'Individual'),
    ('6', '5', 'Intermediate', 'Individual'),
    ('7', '6', 'Advanced', 'Individual'),
    ('8', '7', 'Beginner', 'Group'),
    ('9', '8', 'Intermediate', 'Group'),
    ('10', '9', 'Advanced', 'Group'),
    ('11', '10', 'Beginner', 'Ensamble'),
    ('12', '11', 'Intermediate', 'Ensamble'),
    ('13', '12', 'Advanced', 'Ensamble');

INSERT INTO instrument (type, brand, serial_number, monthly_rent_price)
VALUES
    ('Guitar', 'Yamaha', 'GTR12345', '30.00'),
    ('Piano', 'Casio', 'PNO54321', '50.00'),
    ('Violin', 'Stradivarius', 'VNL67890', '75.00'),
    ('Flute', 'Yamaha', 'FLT11223', '25.00'),
    ('Drums', 'Pearl', 'DRM98765', '60.00'),
    ('Saxophone', 'Selmer', 'SAX13579', '80.00'),
    ('Trumpet', 'Bach', 'TRP24680', '40.00'),
    ('Cello', 'Eastman', 'CLL19283', '70.00'),
    ('Electric Guitar', 'Fender', 'EGTR44567', '45.00'),
    ('Keyboard', 'Roland', 'KYBD55443', '35.00');

INSERT INTO student (skill_level, person_id)
VALUES
    ('Beginner', 1),
    ('Beginner', 2),
    ('Advanced', 3),
    ('Intermediate', 6),
    ('Advanced', 9),
    ('Intermediate', 10);

INSERT INTO instructor (can_teach_ensambles, person_id)
VALUES
    (false, 4),
    (true, 5),
    (true, 7),
    (true, 8);

INSERT INTO instructor_instrument (instructor_id, instrument_id)
VALUES 
    (1,1),
    (1,9),
    (1,5),
    (2,2),
    (2,10),
    (3,4),
    (3,6),
    (3,7),
    (4,3),
    (4,8);

INSERT INTO lesson (date, time, instructor_id, lesson_info_id)
VALUES
    ('2024-03-31','11:00',1,1), --1
    ('2025-11-8','12:00',1,4), --2
    ('2025-05-5','18:00',1,2), --3
    ('2024-06-17','12:00',1,5), --4
    ('2024-05-15','16:00',1,3), --5
    ('2025-06-16','11:00',2,2), --6
    ('2024-12-23','15:00',2,7), --7
    ('2025-06-20','18:00',2,2), --8
    ('2025-04-23','15:00',2,2), --9
    ('2025-05-24','15:00',2,4), --10
    ('2025-06-16','11:00',3,2), --11
    ('2024-12-24','18:00',3,7), --12
    ('2025-06-20','18:00',3,2), --13
    ('2025-04-23','15:00',3,2), --14
    ('2025-05-24','18:00',3,4), --15
    ('2025-06-16','11:00',4,2), --16
    ('2025-01-10','18:00',4,7), --17
    ('2025-06-20','18:00',4,2), --18
    ('2025-04-23','15:00',4,2), --19
    ('2025-05-24','15:00',4,4), --20
    ('2025-01-12','18:00',3,9), --21
    ('2025-01-13','18:00',3,8), --22
    ('2025-01-14','18:00',2,9), --23
    ('2025-01-15','15:00',3,7), --24
    ('2025-01-15','18:00',4,8), --25
    ('2025-01-16','15:00',4,9), --26
    ('2025-01-17','18:00',2,7); --27

INSERT INTO instrument_lesson (lesson_id,instrument_id)
VALUES
    (2,9),
    (1,1),
    (3,5),
    (4,1),
    (5,9),
    (6,2),
    (7,10),
    (8,2),
    (9,10),
    (10,2),
    (11,4),
    (12,6),
    (13,7),
    (14,4),
    (15,6),
    (16,3),
    (17,8),
    (18,3),
    (19,8),
    (20,3),
    (21,1),
    (22,1);

INSERT INTO group_lesson (lesson_id, time_slot, minimum_students, maximum_students)
VALUES
    (2,'2',3,10),
    (4,'2',3,6),
    (7,'3',3,8),
    (10,'3',3,6),
    (12,'4',3,5),
    (15,'4',3,6),
    (17,'4',3,5),
    (20,'3',3,6),
    (21,'4',2,5),
    (22,'4',3,4),
    (23,'4',3,6),
    (24,'3',3,6),
    (25,'4',3,6),
    (26,'3',3,6),
    (27,'4',3,6);
    
INSERT INTO ensamble (lesson_id, genre)
VALUES 
    (7,'Gospel'),
    (12,'Punk'),
    (17,'Rock'),
    (21,'Country'),
    (22,'Gospel'),
    (23,'Punk'),
    (24,'Rock'),
    (25,'Country'),
    (26,'Gospel'),
    (27,'Punk');

INSERT INTO student_lesson (student_id, lesson_id)
VALUES 
    (1, 1),
    (1, 7),
    (3, 7),
    (4, 7),
    (2, 12),
    (1, 21),
    (2, 21),
    (3, 22),
    (4, 22),
    (5, 22),
    (6, 22),
    (1, 23),
    (2, 23),
    (3, 23),
    (4, 23),
    (5, 23),
    (1, 24),
    (2, 24),
    (4, 24),
    (3, 25),
    (6, 25),
    (5, 25),
    (4, 25),
    (4, 26),
    (5, 26),
    (6, 26),
    (2, 27),
    (3, 27),
    (4, 27);

INSERT INTO instrument_lease (start_date, no_months, current_address, student_id, instrument_id)
VALUES 
    ('2024-12-01', 3, 'P.O. Box 959, 1435 Urna Road', 1, 1);

INSERT INTO student_siblings (student1_id, student2_id)
VALUES 
    (1, 2),
    (1, 3),
    (5, 6);

INSERT INTO week_availability (week_number, instructor_id)
VALUES
    ('1', 1);

INSERT INTO weekday_availability (weekday, instructor_id, week_number, date, time)
VALUES
    ('Monday', 1, '1', '2024-01-01', '9:00');