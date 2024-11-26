-- sql script for project task 2 by Gustav Alvestav, alvestav@kth.se
-- ver.2, generated through Astah by exporting sql

CREATE TABLE instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type VARCHAR(500) NOT NULL,
 brand VARCHAR(500),
 serial_number VARCHAR(500),
 monthly_rent_price VARCHAR(500)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE lesson_pricing (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price VARCHAR(10),
 skill_level VARCHAR(12),
 lesson_type VARCHAR(100)
);

ALTER TABLE lesson_pricing ADD CONSTRAINT PK_lesson_pricing PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 person_number VARCHAR(12),
 home_address VARCHAR(500),
 phone_number VARCHAR(500),
 email VARCHAR(500),
 sibling_student_id INT GENERATED ALWAYS AS IDENTITY,
 contact_person_id INT GENERATED ALWAYS AS IDENTITY
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 present_skill_level VARCHAR(12) NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_instrument (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student_instrument ADD CONSTRAINT PK_student_instrument PRIMARY KEY (student_id,instrument_id);


CREATE TABLE discount (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 discount_rate VARCHAR(10)
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (student_id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 can_teach_ensambles BIT(1),
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_instrument (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instrument_id);


CREATE TABLE instrument_lease (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_date DATE NOT NULL,
 no_months VARCHAR(2),
 current_address VARCHAR(500),
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instrument_lease ADD CONSTRAINT PK_instrument_lease PRIMARY KEY (id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 date DATE,
 hours TIMESTAMP(10),
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_pricing_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE student_lesson (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_id,lesson_id);


CREATE TABLE week_availability (
 week_number VARCHAR(2) NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE week_availability ADD CONSTRAINT PK_week_availability PRIMARY KEY (week_number,instructor_id);


CREATE TABLE weekday_availability (
 weekday VARCHAR(20) NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 week_number VARCHAR(2) NOT NULL,
 date DATE,
 hours TIMESTAMP(10)
);

ALTER TABLE weekday_availability ADD CONSTRAINT PK_weekday_availability PRIMARY KEY (weekday,instructor_id,week_number);


CREATE TABLE group_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot VARCHAR(10),
 minimum_students VARCHAR(10),
 maximum_students VARCHAR(10)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE instrument_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instrument_lesson ADD CONSTRAINT PK_instrument_lesson PRIMARY KEY (lesson_id,instrument_id);


CREATE TABLE ensamble (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(500)
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (lesson_id);


ALTER TABLE person ADD CONSTRAINT FK_person_0 FOREIGN KEY (sibling_student_id) REFERENCES student (id);
ALTER TABLE person ADD CONSTRAINT FK_person_1 FOREIGN KEY (contact_person_id) REFERENCES person (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE student_instrument ADD CONSTRAINT FK_student_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_instrument ADD CONSTRAINT FK_student_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE discount ADD CONSTRAINT FK_discount_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE instrument_lease ADD CONSTRAINT FK_instrument_lease_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE instrument_lease ADD CONSTRAINT FK_instrument_lease_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (lesson_pricing_id) REFERENCES lesson_pricing (id);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE week_availability ADD CONSTRAINT FK_week_availability_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE weekday_availability ADD CONSTRAINT FK_weekday_availability_0 FOREIGN KEY (instructor_id,week_number) REFERENCES week_availability (instructor_id,week_number);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE instrument_lesson ADD CONSTRAINT FK_instrument_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE instrument_lesson ADD CONSTRAINT FK_instrument_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id);