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
  ('2024-03-31','11:00',1,1),
  ('2025-11-8','14:00',1,4),
  ('2025-05-5','18:00',1,2),
  ('2024-06-17','15:00',1,5),
  ('2024-05-15','16:00',1,3),
  ('2025-06-16','11:00',2,2),
  ('2025-01-23','14:00',2,7),
  ('2025-06-20','18:00',2,2),
  ('2025-04-23','15:00',2,2),
  ('2025-05-24','16:00',2,4),
  ('2025-06-16','11:00',3,2),
  ('2025-01-23','14:00',3,7),
  ('2025-06-20','18:00',3,2),
  ('2025-04-23','15:00',3,2),
  ('2025-05-24','16:00',3,4),
  ('2025-06-16','11:00',4,2),
  ('2025-01-23','14:00',4,7),
  ('2025-06-20','18:00',4,2),
  ('2025-04-23','15:00',4,2),
  ('2025-05-24','16:00',4,4);

INSERT INTO instrument_lesson (lesson_id,instrument_id)
VALUES
  (1,1),
  (2,9),
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
  (20,3);

INSERT INTO group_lesson (lesson_id, time_slot, minimum_students, maximum_students)
VALUES
    (2,'','',''),
    (4,'','',''),
    (7,'','',''),
    (10,'','',''),
    (12,'','',''),
    (15,'','',''),
    (17,'','',''),
    (20,'','','');
    
INSERT INTO ensamble (lesson_id, genre)
VALUES 
    (7,'Gospel'),
    (12,'Punk'),
    (17,'Rock');

INSERT INTO student_lesson (student_id, lesson_id)
VALUES 
    (1, 1);

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