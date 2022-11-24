/*Insert 10 students*/
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('195707286854', 'Pontus', 'Pretsell', '1', '25327 Pawling Center', '16577', 'Ugljan');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('191008185015', 'Hugo', 'Corton', '1', '15 Tennyson Street', '75406', 'Kedungharjo');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('201303201926', 'William', 'Dowgill', '1', '3765 Roxbury Park', '77189', 'Yashio-shi');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('201004146182', 'Daniel', 'Rudwell', '1', '1063 Kinsman Circle', '71886', 'Yinjiacheng');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('200502184873', 'Marcus', 'Arden', '1', '356 Oak Valley Hill', '97694', 'Krajan Tegalombo');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('198705250210', 'Pelle', 'Boichat', '0', '7621 Scott Street', '80697', 'Wubao');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('196212149192', 'Anton', 'Shurrocks', '0', '66 Waywood Junction', '91142', 'Kompóti');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('200211133558', 'Ida', 'Sudy', '1', '404 Dryden Park', '49168', 'Šuto Orizare');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('199706127564', 'Felicia', 'Elcoat', '1', '903 Harper Avenue', '80439', 'Jargalant');
insert into student (person_number, first_name, last_name, accepted, address, zip , city) values ('199903061534', 'Jessica', 'Shottin', '1', '78 Bobwhite Junction', '61849', 'Yaoundé');

/*Insert 5 instructors*/
insert into instructor (person_number, first_name, last_name, address, zip , city, can_teach_ensembles) values ('196011124587', 'Norman', 'Noot', '16 Artisan Lane', '12772', 'Barberena', '1');
insert into instructor (person_number, first_name, last_name, address, zip , city, can_teach_ensembles) values ('196912305678', 'Kenneth', 'Yielding', '1 8th Drive', '49329', 'Saniwonorejo', '0');
insert into instructor (person_number, first_name, last_name, address, zip , city, can_teach_ensembles) values ('197209032389', 'Edward', 'Sans', '9 Gina Park', '73789', 'La Concepción', '1');
insert into instructor (person_number, first_name, last_name, address, zip , city, can_teach_ensembles) values ('198204196723', 'Noah', 'Attyeo', '19825 Superior Lane', '87878', 'Tanzybey', '0');
insert into instructor (person_number, first_name, last_name, address, zip , city, can_teach_ensembles) values ('197510280345', 'Terry', 'Brenton', '3288 Monterey Plaza', '33692', 'Xianglan', '1');

/*Insert 8 contact persons*/
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('197512022315', 'Judah', 'De La Salle', '6 Banding Terrace', '79364', 'Dungarvan');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('193607242710', 'Thomas', 'Piche', '30417 Acker Road', '27358', 'Göteborg');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('199208229014', 'Wayne', 'Caroli', '2099 Northwestern Park', '99007', 'Parnaíba');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('199703272600', 'Connor', 'Putland', '8926 Melody Crossing', '62965', 'Salanegara');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('196703293776', 'Christian', 'Kupec', '171 Buhler Way', '23495', 'Sonorejo');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('197501155100', 'Harrison', 'Ellis', '15283 Dapin Drive', '27383', 'Pataypampa');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('195505013713', 'Theodora', 'Whaymand', '14749 Southridge Terrace', '74544', 'Xietang');
insert into contact_person (person_number, first_name, last_name, address, zip , city) values ('195911221934', 'Tilda', 'Sexty', '25 Bellgrove Road', '63936', 'Portland');

/*Add relation between students and contact_person*/
insert into student_contact_person (student_id, contact_person_id, relevance_for_student) values
((SELECT id FROM student WHERE first_name='Pontus'), (SELECT id FROM contact_person WHERE first_name='Judah'), 'Mamma'),
((SELECT id FROM student WHERE first_name='Hugo'), (SELECT id FROM contact_person WHERE first_name='Thomas'), 'Pappa'),
((SELECT id FROM student WHERE first_name='William'), (SELECT id FROM contact_person WHERE first_name='Wayne'), 'Vän'),
((SELECT id FROM student WHERE first_name='Daniel'), (SELECT id FROM contact_person WHERE first_name='Connor'), 'Mamma'),
((SELECT id FROM student WHERE first_name='Marcus'), (SELECT id FROM contact_person WHERE first_name='Christian'), 'Pappa'),
((SELECT id FROM student WHERE first_name='Pelle'), (SELECT id FROM contact_person WHERE first_name='Harrison'), 'Vän'),
((SELECT id FROM student WHERE first_name='Anton'), (SELECT id FROM contact_person WHERE first_name='Theodora'), 'Mamma'),
((SELECT id FROM student WHERE first_name='Ida'), (SELECT id FROM contact_person WHERE first_name='Tilda'), 'Pappa'),
((SELECT id FROM student WHERE first_name='Felicia'), (SELECT id FROM contact_person WHERE first_name='Judah'), 'Vän'),
((SELECT id FROM student WHERE first_name='Jessica'), (SELECT id FROM contact_person WHERE first_name='Thomas'), 'Mamma');


/*Insert 2 instrument_rent*/
insert into instrument_rent(home_delivery, student_id, start_date, end_date) values
('0', (SELECT id FROM student WHERE first_name='William') , '2023-11-10', '2023-12-10'),
('1', (SELECT id FROM student WHERE first_name='Pelle') , '2023-10-19', '2024-10-19');

/*Insert 5 instrument_in_stock, two are rented, rest are not */
insert into instrument_in_stock(type, brand, price, instrument_rent_id) values
('Gitarr', 'Gecko', 699, (SELECT id FROM instrument_rent WHERE student_id=(SELECT id FROM student WHERE first_name='William'))),
('Piano', 'Yamaha', 999, (SELECT id FROM instrument_rent WHERE student_id=(SELECT id FROM student WHERE first_name='Pelle'))),
('Trummor', 'Startone Star', 1199, NULL),
('Trumpet', 'Thomann', 189, NULL),
('Flöjt', 'Hohner', 699, NULL);

/*Insert the different teachable instruments*/
insert into teachable_instrument(instrument) values('Gitarr');
insert into teachable_instrument(instrument) values('Piano');
insert into teachable_instrument(instrument) values('Trummor');
insert into teachable_instrument(instrument) values('Trumpet');
insert into teachable_instrument(instrument) values('Flöjt');

/*Connect instructors to teachable instruments*/
insert into instructor_instrument(instructor_id, teachable_instrument_id) values
((SELECT id FROM instructor WHERE first_name='Norman'), (SELECT id FROM teachable_instrument WHERE instrument='Gitarr')),
((SELECT id FROM instructor WHERE first_name='Norman'), (SELECT id FROM teachable_instrument WHERE instrument='Trummor')),
((SELECT id FROM instructor WHERE first_name='Kenneth'), (SELECT id FROM teachable_instrument WHERE instrument='Piano')),
((SELECT id FROM instructor WHERE first_name='Edward'), (SELECT id FROM teachable_instrument WHERE instrument='Trummor')),
((SELECT id FROM instructor WHERE first_name='Noah'), (SELECT id FROM teachable_instrument WHERE instrument='Trumpet')),
((SELECT id FROM instructor WHERE first_name='Terry'), (SELECT id FROM teachable_instrument WHERE instrument='Flöjt'));

/*Connect students to phone*/
insert into phone_number_student(phone_number, student_id) values
('+46 79 733 39 43', (SELECT id FROM student WHERE first_name='Pontus')),
('+46 79 356 72 16', (SELECT id FROM student WHERE first_name='Hugo')),
('+46 79 034 04 80', (SELECT id FROM student WHERE first_name='William')),
('++46 79 153 62 60', (SELECT id FROM student WHERE first_name='Daniel')),
('+46 79 356 72 17', (SELECT id FROM student WHERE first_name='Marcus')),
('+46 79 356 72 18', (SELECT id FROM student WHERE first_name='Pelle')),
('+46 79 356 72 19', (SELECT id FROM student WHERE first_name='Anton')),
('+46 79 356 72 12', (SELECT id FROM student WHERE first_name='Ida')),
('+46 79 356 72 13', (SELECT id FROM student WHERE first_name='Felicia')),
('+46 79 356 72 14', (SELECT id FROM student WHERE first_name='Jessica'));

/*Connect instructors to phone*/
insert into phone_number_instructor(phone_number, instructor_id) values
('+46 89 733 39 43', (SELECT id FROM instructor WHERE first_name='Norman')),
('+46 71 356 72 16', (SELECT id FROM instructor WHERE first_name='Kenneth')),
('+46 72 034 04 80', (SELECT id FROM instructor WHERE first_name='Edward')),
('++46 73 153 62 60', (SELECT id FROM instructor WHERE first_name='Noah')),
('+46 74 356 72 17', (SELECT id FROM instructor WHERE first_name='Terry'));

/*Connect contact_person to phone*/
insert into phone_number_contact_person(phone_number, contact_person_id) values
('+46 79 731 39 43', (SELECT id FROM contact_person WHERE first_name='Judah')),
('+46 79 352 72 16', (SELECT id FROM contact_person WHERE first_name='Thomas')),
('+46 79 033 04 80', (SELECT id FROM contact_person WHERE first_name='Wayne')),
('++46 79 154 62 60', (SELECT id FROM contact_person WHERE first_name='Connor')),
('+46 79 355 72 17', (SELECT id FROM contact_person WHERE first_name='Christian')),
('+46 79 357 72 18', (SELECT id FROM contact_person WHERE first_name='Harrison')),
('+46 79 358 72 19', (SELECT id FROM contact_person WHERE first_name='Theodora')),
('+46 79 359 72 12', (SELECT id FROM contact_person WHERE first_name='Tilda'));

/*Connect student to email*/
insert into email_student(email, student_id) values 
('pontus@sgms.com', (SELECT id FROM student WHERE first_name='Pontus')),
('hugo@sgms.com', (SELECT id FROM student WHERE first_name='Hugo')),
('william@sgms.com', (SELECT id FROM student WHERE first_name='William')),
('daniel@sgms.com', (SELECT id FROM student WHERE first_name='Daniel')),
('marcus@sgms.com', (SELECT id FROM student WHERE first_name='Marcus')),
('pelle@sgms.com', (SELECT id FROM student WHERE first_name='Pelle')),
('anton@sgms.com', (SELECT id FROM student WHERE first_name='Anton')),
('ida@sgms.com', (SELECT id FROM student WHERE first_name='Ida')),
('felicia@sgms.com', (SELECT id FROM student WHERE first_name='Felicia')),
('jessica@sgms.com', (SELECT id FROM student WHERE first_name='Jessica'));

/*Connect instructor to email*/
insert into email_instructor(email, instructor_id) values
('norman@sgms.com', (SELECT id FROM instructor WHERE first_name='Norman')),
('kenneth@sgms.com', (SELECT id FROM instructor WHERE first_name='Kenneth')),
('edward@sgms.com', (SELECT id FROM instructor WHERE first_name='Edward')),
('noah@sgms.com', (SELECT id FROM instructor WHERE first_name='Noah')),
('terry@sgms.com', (SELECT id FROM instructor WHERE first_name='Terry'));

/*Connect contact_person to email*/
insert into email_contact_person(email, contact_person_id) values
('judah@sgms.com', (SELECT id FROM contact_person WHERE first_name='Judah')),
('thomas@sgms.com', (SELECT id FROM contact_person WHERE first_name='Thomas')),
('wayne@sgms.com', (SELECT id FROM contact_person WHERE first_name='Wayne')),
('connor@sgms.com', (SELECT id FROM contact_person WHERE first_name='Connor')),
('christian@sgms.com', (SELECT id FROM contact_person WHERE first_name='Christian')),
('harrison@sgms.com', (SELECT id FROM contact_person WHERE first_name='Harrison')),
('theodora@sgms.com', (SELECT id FROM contact_person WHERE first_name='Theodora')),
('tilda@sgms.com', (SELECT id FROM contact_person WHERE first_name='Tilda'));

/*Insert one sibling*/
insert into student_sibling(student_id, sibling_id) values 
((SELECT id FROM student WHERE first_name='William'), (SELECT id FROM student WHERE first_name='Hugo')),
((SELECT id FROM student WHERE first_name='Hugo'), (SELECT id FROM student WHERE first_name='William'));

/*Insert 4 different time slots*/
insert into time_slot (start_time, end_time, date) values
('08:00:00', '10:00:00', '2023-11-22'),
('10:00:00', '12:00:00', '2023-11-22'),
('13:00:00', '15:00:00', '2023-11-22'),
('15:00:00', '17:00:00', '2023-11-22');

/*Insert different lesson_price*/
insert into lesson_price(sibling_discount, instructor_pay, skill_level, type, price) values
(0.5, 100, 'beginner', 'individual', 200),
(0.5, 100, 'intermediate', 'individual', 200),
(0.5, 100, 'advanced', 'group', 500),
(0.5, 100, 'intermediate', 'ensemble', 200);


/*Insert the different skill levels*/
insert into skill_level(skill_level) values
('beginner'),
('intermediate'),
('advanced');

/*Insert the different skill levels for student skills*/
insert into student_skill_level(skill_level) values
('beginner'),
('intermediate'),
('advanced');

/*Insert the different instruments for student skills*/
insert into student_instrument(instrument) values
('Flöjt'),
('Trumpet'),
('Trummor'),
('Piano'),
('Gitarr');

/*Insert the different genres*/
insert into genre(genre) values
('Rock'),
('Classic');

/*Insert different instruments for lessons*/
insert into lesson_instrument(instrument) values
('Flöjt'),
('Trumpet'),
('Trummor'),
('Piano'),
('Gitarr');

/*Insert two individual lessons*/
insert into individual_lesson(instrument_id, instructor_id, lesson_price_id, student_id, skill_level_id) values
((SELECT id FROM lesson_instrument WHERE instrument='Gitarr'),
(SELECT id FROM instructor WHERE first_name='Norman'),
(SELECT id FROM lesson_price WHERE skill_level='beginner' AND type='individual'),
(SELECT id FROM student WHERE first_name='William'),
(SELECT id FROM skill_level WHERE skill_level='beginner')),
((SELECT id FROM lesson_instrument WHERE instrument='Trummor'),
(SELECT id FROM instructor WHERE first_name='Edward'),
(SELECT id FROM lesson_price WHERE skill_level='intermediate' AND type='individual'),
(SELECT id FROM student WHERE first_name='Pelle'),
(SELECT id FROM skill_level WHERE skill_level='intermediate'));

/*Insert one group lesson*/
insert into group_lesson(instrument_id, number_of_places, instructor_id, time_slot_id, lesson_price_id, skill_level_id) values
(
    (SELECT id FROM lesson_instrument WHERE instrument='Piano'),
    3,
    (SELECT id FROM instructor WHERE first_name='Kenneth'),
    (SELECT id FROM time_slot WHERE start_time='08:00:00'),
    (SELECT id FROM lesson_price WHERE skill_level='advanced' AND type='group'),
    (SELECT id FROM skill_level WHERE skill_level='advanced')
);

/*Insert one ensemble*/
insert into ensemble(genre_id, number_of_places, instructor_id, time_slot_id, lesson_price_id, skill_level_id) values
(
    (SELECT id FROM genre WHERE genre='Rock'),
    4,
    (SELECT id FROM instructor WHERE first_name='Terry'),
    (SELECT id FROM time_slot WHERE start_time='15:00:00'),
    (SELECT id FROM lesson_price WHERE skill_level='intermediate' AND type='ensemble'),
    (SELECT id FROM skill_level WHERE skill_level='intermediate')
);

/*Generate 4 different instructor availability*/
insert into instructor_availability (start_time, end_time, date, instructor_id, lesson_id) values 
('08:00:00', '09:30:00', '2023-11-22', (SELECT i.id FROM instructor AS i WHERE i.first_name='Norman'), (SELECT id FROM individual_lesson AS l WHERE l.instructor_id=(SELECT id FROM instructor WHERE first_name='Norman'))),
('10:00:00', '10:30:00', '2023-11-22', (SELECT i.id FROM instructor AS i WHERE i.first_name='Edward'), (SELECT id FROM individual_lesson AS l WHERE l.instructor_id=(SELECT id FROM instructor WHERE first_name='Edward'))),
('13:00:00', '16:00:00', '2023-11-23', (SELECT id FROM instructor WHERE first_name='Noah'), NULL),
('08:00:00', '09:30:00', '2023-11-23', (SELECT id FROM instructor WHERE first_name='Terry'), NULL);

/*Connect 2 students to group lesson*/
insert into student_in_group_lesson(student_id, group_lesson_id) values
((SELECT id FROM student WHERE first_name='Anton'), (SELECT id FROM group_lesson WHERE instrument_id=4)),
((SELECT id FROM student WHERE first_name='Ida'), (SELECT id FROM group_lesson WHERE instrument_id=4));

/*Connect 4 students to ensemble*/
insert into student_in_ensemble(student_id, ensemble_id) values
((SELECT id FROM student WHERE first_name='Jessica'), (SELECT id FROM ensemble WHERE genre_id=1)),
((SELECT id FROM student WHERE first_name='Marcus'), (SELECT id FROM ensemble WHERE genre_id=1)),
((SELECT id FROM student WHERE first_name='Daniel'), (SELECT id FROM ensemble WHERE genre_id=1)),
((SELECT id FROM student WHERE first_name='Felicia'), (SELECT id FROM ensemble WHERE genre_id=1));

/*Insert current skill for 2 students*/
insert into current_skill(instrument_id, skill_level_id, student_id) values
((SELECT id FROM student_instrument WHERE instrument='Flöjt'), (SELECT id FROM student_skill_level WHERE skill_level='advanced'), (SELECT id FROM student WHERE first_name='William')),
((SELECT id FROM student_instrument WHERE instrument='Trumpet'), (SELECT id FROM student_skill_level WHERE skill_level='advanced'), (SELECT id FROM student WHERE first_name='Hugo'));

/* Declare FK constraints!!!!!!!*/

