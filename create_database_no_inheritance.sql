CREATE TABLE genre (
 genre_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre  VARCHAR(50) NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (genre_id);


CREATE TABLE instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE lesson_type (
 lesson_type_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type VARCHAR(50) NOT NULL
);

ALTER TABLE lesson_type ADD CONSTRAINT PK_lesson_type PRIMARY KEY (lesson_type_id);


CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 address VARCHAR(100) NOT NULL,
 zip CHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE phone_number (
 phone_number VARCHAR(50) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (phone_number,person_id);


CREATE TABLE skill_level (
 skill_level_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(12) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (skill_level_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 accepted BIT(1) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_contact_person (
 person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_contact_person ADD CONSTRAINT PK_student_contact_person PRIMARY KEY (person_id,student_id);


CREATE TABLE student_sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE student_sibling ADD CONSTRAINT PK_student_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE time_slot  (
 time_slot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIME(6) NOT NULL,
 end_time TIME(6) NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE time_slot  ADD CONSTRAINT PK_time_slot  PRIMARY KEY (time_slot_id);


CREATE TABLE current_skill (
 student_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE current_skill ADD CONSTRAINT PK_current_skill PRIMARY KEY (student_id,skill_level_id,instrument_id);


CREATE TABLE email (
 person_id INT NOT NULL,
 email VARCHAR(50) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (person_id,email);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 can_teach_ensembles BIT(1) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instrument_id);


CREATE TABLE lesson_price (
 lesson_price_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibiling_discount DECIMAL(10) NOT NULL,
 instructor_pay INT NOT NULL,
 lesson_type_id INT NOT NULL,
 skill_level_id INT,
 price INT NOT NULL
);

ALTER TABLE lesson_price ADD CONSTRAINT PK_lesson_price PRIMARY KEY (lesson_price_id);


CREATE TABLE rental (
 rental_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 home_delivery BIT(1) NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (rental_id);


CREATE TABLE ensemble (
 ensemble_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 lesson_price_id INT NOT NULL,
 genre_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 number_of_places INT NOT NULL,
 min_students INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);


CREATE TABLE group_lesson (
 group_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 lesson_price_id INT NOT NULL,
 instrument_id INT NOT NULL,
 number_of_places INT NOT NULL,
 min_students INT NOT NULL,
 time_slot_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE individual_lesson (
 individual_lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 instructor_id INT NOT NULL,
 lesson_price_id INT NOT NULL,
 time_slot_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);


CREATE TABLE instrument_in_stock  (
 instument_in_stock_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT NOT NULL,
 brand VARCHAR(50) NOT NULL,
 price INT NOT NULL,
 rental_id INT
);

ALTER TABLE instrument_in_stock  ADD CONSTRAINT PK_instrument_in_stock  PRIMARY KEY (instument_in_stock_id);


CREATE TABLE student_in_ensemble (
 student_id INT NOT NULL,
 ensemble_id INT NOT NULL
);

ALTER TABLE student_in_ensemble ADD CONSTRAINT PK_student_in_ensemble PRIMARY KEY (student_id,ensemble_id);


CREATE TABLE student_in_group_lesson (
 student_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE student_in_group_lesson ADD CONSTRAINT PK_student_in_group_lesson PRIMARY KEY (student_id,group_lesson_id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE NO ACTION;


ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE NO ACTION;
ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;


ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;
ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (student_id) ON DELETE NO ACTION;


ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id) ON DELETE CASCADE;
ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_2 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE CASCADE;


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE;


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE NO ACTION;


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE CASCADE;


ALTER TABLE lesson_price ADD CONSTRAINT FK_lesson_price_0 FOREIGN KEY (lesson_type_id) REFERENCES lesson_type (lesson_type_id) ON DELETE NO ACTION;
ALTER TABLE lesson_price ADD CONSTRAINT FK_lesson_price_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id) ON DELETE NO ACTION;


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (lesson_price_id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_3 FOREIGN KEY (time_slot_id) REFERENCES time_slot  (time_slot_id) ON DELETE NO ACTION;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (lesson_price_id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_3 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_4 FOREIGN KEY (time_slot_id) REFERENCES time_slot  (time_slot_id) ON DELETE NO ACTION;


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (skill_level_id) REFERENCES skill_level (skill_level_id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_4 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (lesson_price_id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_5 FOREIGN KEY (time_slot_id) REFERENCES time_slot  (time_slot_id);


ALTER TABLE instrument_in_stock  ADD CONSTRAINT FK_instrument_in_stock_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE NO ACTION;
ALTER TABLE instrument_in_stock  ADD CONSTRAINT FK_instrument_in_stock_1 FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE NO ACTION;


ALTER TABLE student_in_ensemble ADD CONSTRAINT FK_student_in_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;
ALTER TABLE student_in_ensemble ADD CONSTRAINT FK_student_in_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (ensemble_id) ON DELETE NO ACTION;


ALTER TABLE student_in_group_lesson ADD CONSTRAINT FK_student_in_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION;
ALTER TABLE student_in_group_lesson ADD CONSTRAINT FK_student_in_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id) ON DELETE NO ACTION;


