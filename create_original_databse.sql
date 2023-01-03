CREATE TABLE contact_person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 address  VARCHAR(100) NOT NULL,
 zip CHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE email_contact_person (
 contact_person_id INT NOT NULL,
 email VARCHAR(50) NOT NULL
);

ALTER TABLE email_contact_person ADD CONSTRAINT PK_email_contact_person PRIMARY KEY (contact_person_id,email);


CREATE TABLE genre (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 address  VARCHAR(100) NOT NULL,
 zip CHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL,
 can_teach_ensembles BIT(1) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE lesson_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(100) NOT NULL UNIQUE
);

ALTER TABLE lesson_instrument ADD CONSTRAINT PK_lesson_instrument PRIMARY KEY (id);


CREATE TABLE lesson_price (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibling_discount DECIMAL(10) NOT NULL,
 instructor_pay INT NOT NULL,
 skill_level VARCHAR(50),
 type VARCHAR(50) NOT NULL,
 price INT NOT NULL
);

ALTER TABLE lesson_price ADD CONSTRAINT PK_lesson_price PRIMARY KEY (id);


CREATE TABLE phone_number_contact_person (
 phone_number VARCHAR(50) NOT NULL,
 contact_person_id INT NOT NULL
);

ALTER TABLE phone_number_contact_person ADD CONSTRAINT PK_phone_number_contact_person PRIMARY KEY (phone_number,contact_person_id);


CREATE TABLE phone_number_instructor (
 phone_number VARCHAR(50) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE phone_number_instructor ADD CONSTRAINT PK_phone_number_instructor PRIMARY KEY (phone_number,instructor_id);


CREATE TABLE skill_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(12) NOT NULL UNIQUE
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 accepted BIT(1) NOT NULL,
 address  VARCHAR(100) NOT NULL,
 zip CHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_contact_person (
 student_id INT NOT NULL,
 contact_person_id INT NOT NULL,
 relevance_for_student VARCHAR(500) NOT NULL
);

ALTER TABLE student_contact_person ADD CONSTRAINT PK_student_contact_person PRIMARY KEY (student_id,contact_person_id);


CREATE TABLE student_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(100) NOT NULL UNIQUE
);

ALTER TABLE student_instrument ADD CONSTRAINT PK_student_instrument PRIMARY KEY (id);


CREATE TABLE student_sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE student_sibling ADD CONSTRAINT PK_student_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE student_skill_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(12) NOT NULL UNIQUE
);

ALTER TABLE student_skill_level ADD CONSTRAINT PK_student_skill_level PRIMARY KEY (id);


CREATE TABLE teachable_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(100) NOT NULL UNIQUE
);

ALTER TABLE teachable_instrument ADD CONSTRAINT PK_teachable_instrument PRIMARY KEY (id);


CREATE TABLE time_slot (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_time TIME(6) NOT NULL,
 end_time TIME(6) NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (id);


CREATE TABLE current_skill (
 instrument_id INT NOT NULL,
 skill_level_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE current_skill ADD CONSTRAINT PK_current_skill PRIMARY KEY (instrument_id,skill_level_id,student_id);


CREATE TABLE email_instructor (
 email VARCHAR(50) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE email_instructor ADD CONSTRAINT PK_email_instructor PRIMARY KEY (email,instructor_id);


CREATE TABLE email_student (
 email VARCHAR(50) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE email_student ADD CONSTRAINT PK_email_student PRIMARY KEY (email,student_id);


CREATE TABLE ensemble (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre_id INT NOT NULL,
 number_of_places INT NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 lesson_price_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT NOT NULL,
 number_of_places INT NOT NULL,
 instructor_id INT NOT NULL,
 time_slot_id INT NOT NULL,
 lesson_price_id INT NOT NULL,
 skill_level_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL,
 lesson_price_id INT NOT NULL,
 student_id INT NOT NULL,
 skill_level_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


CREATE TABLE instructor_availability (
 start_time TIME(6) NOT NULL,
 end_time TIME(6) NOT NULL,
 date DATE NOT NULL,
 instructor_id INT NOT NULL,
 lesson_id INT
);


CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 teachable_instrument_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,teachable_instrument_id);


CREATE TABLE instrument_rent (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 home_delivery BIT(1) NOT NULL,
 student_id INT NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL
);

ALTER TABLE instrument_rent ADD CONSTRAINT PK_instrument_rent PRIMARY KEY (id);


CREATE TABLE phone_number_student (
 phone_number VARCHAR(50) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE phone_number_student ADD CONSTRAINT PK_phone_number_student PRIMARY KEY (phone_number,student_id);


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


CREATE TABLE instrument_in_stock (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type VARCHAR(100) NOT NULL,
 brand VARCHAR(100) NOT NULL,
 price INT NOT NULL,
 instrument_rent_id INT DEFAULT NULL
);

ALTER TABLE instrument_in_stock ADD CONSTRAINT PK_instrument_in_stock PRIMARY KEY (id);


ALTER TABLE email_contact_person ADD CONSTRAINT FK_email_contact_person_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id) ON DELETE CASCADE;


ALTER TABLE phone_number_contact_person ADD CONSTRAINT FK_phone_number_contact_person_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id) ON DELETE CASCADE;


ALTER TABLE phone_number_instructor ADD CONSTRAINT FK_phone_number_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;


ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_contact_person ADD CONSTRAINT FK_student_contact_person_1 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id) ON DELETE NO ACTION;


ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_sibling ADD CONSTRAINT FK_student_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (id) ON DELETE NO ACTION;


ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_0 FOREIGN KEY (instrument_id) REFERENCES student_instrument (id) ON DELETE CASCADE;
ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_1 FOREIGN KEY (skill_level_id) REFERENCES student_skill_level (id) ON DELETE CASCADE;
ALTER TABLE current_skill ADD CONSTRAINT FK_current_skill_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE email_instructor ADD CONSTRAINT FK_email_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;


ALTER TABLE email_student ADD CONSTRAINT FK_email_student_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id) ON DELETE NO ACTION;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_3 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (id) ON DELETE NO ACTION;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instrument_id) REFERENCES lesson_instrument (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (time_slot_id) REFERENCES time_slot (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_3 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (id) ON DELETE NO ACTION;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_4 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id) ON DELETE NO ACTION;


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instrument_id) REFERENCES lesson_instrument (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (lesson_price_id) REFERENCES lesson_price (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_4 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id) ON DELETE NO ACTION;


ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION;
ALTER TABLE instructor_availability ADD CONSTRAINT FK_instructor_availability_1 FOREIGN KEY (lesson_id) REFERENCES individual_lesson (id) ON DELETE SET NULL;


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (teachable_instrument_id) REFERENCES teachable_instrument (id) ON DELETE CASCADE;


ALTER TABLE instrument_rent ADD CONSTRAINT FK_instrument_rent_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;


ALTER TABLE phone_number_student ADD CONSTRAINT FK_phone_number_student_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;


ALTER TABLE student_in_ensemble ADD CONSTRAINT FK_student_in_ensemble_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_in_ensemble ADD CONSTRAINT FK_student_in_ensemble_1 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id) ON DELETE NO ACTION;


ALTER TABLE student_in_group_lesson ADD CONSTRAINT FK_student_in_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION;
ALTER TABLE student_in_group_lesson ADD CONSTRAINT FK_student_in_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id) ON DELETE NO ACTION;


ALTER TABLE instrument_in_stock ADD CONSTRAINT FK_instrument_in_stock_0 FOREIGN KEY (instrument_rent_id) REFERENCES instrument_rent (id) ON DELETE SET NULL;


