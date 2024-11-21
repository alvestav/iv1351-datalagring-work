INSERT INTO person (first_name, last_name, home_address, phone_number, email) 
VALUES
    ('Ali','Webster','P.O. Box 959, 1435 Urna Road','1-555-277-6731','pretium.neque@hotmail.net'),
    ('Andrew','Mendez','P.O. Box 929, 8984 Iaculis, Road','303-1716','cursus.integer.mollis@hotmail.net'),
    ('Elmo','Richardson','157-5303 Tellus. Ave','225-3257','placerat.cras@aol.couk'),
    ('Karyn','Mullins','Ap #188-8550 Quam. St.','1-814-266-5185','in.condimentum@aol.com'),
    ('Otto','Owens','Ap #655-7731 Aliquam Av.','158-6308','non.massa.non@yahoo.org');

INSERT INTO lesson_pricing (price, skill_level, lesson_type)
VALUES
    ('5', 'Beginner', 'Individual'),
    ('6', 'Intermediate', 'Individual'),
    ('7', 'Advanced', 'Individual'),
    ('5', 'Beginner', 'Group'),
    ('5', 'Intermediate', 'Group'),
    ('5', 'Advanced', 'Group'),
    ('5', 'Beginner', 'Ensamble'),
    ('5', 'Intermediate', 'Ensamble'),
    ('5', 'Advanced', 'Ensamble');

INSERT INTO student (present_skill_level, person_id)
VALUES
    ('Beginner', (SELECT id FROM person));
    