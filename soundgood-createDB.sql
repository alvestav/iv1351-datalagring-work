-- sql script for project task 2 by Gustav Alvestav, alvestav@kth.se
-- ver.1

CREATE TABLE person (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    person_number VARCHAR(12),
    home_address VARCHAR(500),
    phone_number VARCHAR(500),
    email VARCHAR(500),
    sibling_student_id INT,
    contact_person_id INT,
    CONSTRAINT pk_id PRIMARY KEY (id),
    CONSTRAINT unique_person_number UNIQUE (person_number),
    CONSTRAINT fk_sibling_student FOREIGN KEY (sibling_student_id) REFERENCES student(id) ON DELETE SET NULL,
    CONSTRAINT fk_contact_person FOREIGN KEY (contact_person_id) REFERENCES person(id) ON DELETE SET NULL
);

CREATE TABLE student (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    present_skill_level VARCHAR(12) NOT NULL,
    person_id INT,
    CONSTRAINT pk_student PRIMARY KEY (id),
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE instructor (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    can_teach_ensambles BOOlEAN,
    person_id INT,
    CONSTRAINT pk_instructor PRIMARY KEY (id),
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE lesson_pricing (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    price VARCHAR(10),
    skill_level VARCHAR(12),
    lesson_type VARCHAR(100),
    CONSTRAINT pk_lesson_pricing PRIMARY KEY (id)
);

CREATE TABLE lesson (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    date DATE,
    hours TIMESTAMP(10),
    instructor_id INT,
    lesson_pricing_id INT,
    CONSTRAINT pk_lesson PRIMARY KEY (id),
    CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE SET NULL,
    CONSTRAINT fk_lesson_pricing_id FOREIGN KEY (lesson_pricing_id) REFERENCES lesson_pricing(id) ON DELETE SET NULL
);

CREATE TABLE instrument (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    type VARCHAR(500) NOT NULL,
    brand VARCHAR(500),
    serial_number VARCHAR(500),
    monthly_rent_price VARCHAR(500),
    CONSTRAINT pk_instrument PRIMARY KEY (id)
);

CREATE TABLE instrument_lease (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    start_date DATE NOT NULL,
    no_months VARCHAR(2),
    current_address VARCHAR(500),
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    CONSTRAINT pk_instrument_lease PRIMARY KEY (id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE
);

CREATE TABLE discount (
    student_id INT NOT NULL,
    discount_rate VARCHAR(10),
    CONSTRAINT pk_discount PRIMARY KEY (student_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

CREATE TABLE week_availability (
    instructor_id INT NOT NULL,
    week_number VARCHAR(2),
    CONSTRAINT pk_week_availability PRIMARY KEY (instructor_id),
    CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

CREATE TABLE weekday_availability (
    instructor_id INT NOT NULL,
    date DATE,
    weekday VARCHAR(20),
    hours TIMESTAMP(10),
    CONSTRAINT pk_weekday_availability PRIMARY KEY (instructor_id),
    CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES week_availability(instructor_id) ON DELETE CASCADE
);

CREATE TABLE student_instrument (
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    CONSTRAINT pk_student_instrument PRIMARY KEY (student_id, instrument_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE
);

CREATE TABLE student_lesson (
    student_id INT NOT NULL,
    lesson_id INT NOT NULL,
    CONSTRAINT pk_student_lesson PRIMARY KEY (student_id, lesson_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    CONSTRAINT fk_lesson_id FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
);

CREATE TABLE instructor_instrument (
    instructor_id INT NOT NULL,
    instrument_id INT NOT NULL,
    CONSTRAINT pk_instructor_instrument PRIMARY KEY (instructor_id, instrument_id),
    CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
    CONSTRAINT fk_instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE
);

CREATE TABLE group_lesson (
    lesson_id INT NOT NULL,
    time_slot VARCHAR(10),
    minimum_students VARCHAR(10),
    maximum_students VARCHAR(10),
    CONSTRAINT pk_group_lesson PRIMARY KEY (lesson_id),
    CONSTRAINT fk_lesson_id FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
);

CREATE TABLE ensamble (
    lesson_id INT NOT NULL,
    genre VARCHAR(500),
    CONSTRAINT pk_ensamble PRIMARY KEY (lesson_id),
    CONSTRAINT fk_lesson_id FOREIGN KEY (lesson_id) REFERENCES group_lesson(lesson_id) ON DELETE CASCADE
);