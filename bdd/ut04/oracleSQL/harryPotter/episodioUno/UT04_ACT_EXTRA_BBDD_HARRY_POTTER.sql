/* =========================================================
   HOGWARTS (Oracle) - SOLO CREATE TABLE + INSERTS
   ========================================================= */

------------------------------------------------------------
-- 0) CREATE DDBB-USER-SCHEME
------------------------------------------------------------

CREATE USER hogwarts 
IDENTIFIED BY hogwarts123 
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO hogwarts; 
ALTER USER hogwarts QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO hogwarts;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER, CREATE SYNONYM TO hogwarts;
ALTER USER hogwarts QUOTA UNLIMITED ON users;

------------------------------------------------------------
-- 1) CREATE TABLE
------------------------------------------------------------

-- "HOUSE" => LAS CASAS DE HOGWARTS
CREATE TABLE house (
  id   NUMBER PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  wing VARCHAR2(20) NOT NULL,
  head_teacher NUMBER,  -- (sin FK aquí por petición: solo CREATE + INSERT)
  founder      NUMBER   -- (sin FK aquí por petición: solo CREATE + INSERT)
);

-- "PERSON" => TODAS LAS PERSONAS (ALUMNOS, PROFESORES, PERSONAL, FUNDADORES...)
CREATE TABLE person (
  id         NUMBER PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL,
  last_name  VARCHAR2(50) NOT NULL,
  email      VARCHAR2(50) NOT NULL,
  rol        VARCHAR2(15) DEFAULT 'student',
  house_id   NUMBER,
  CONSTRAINT fk_person_house
    FOREIGN KEY (house_id) REFERENCES house(id)
);

-- "COURSE" => TODAS LAS ASIGNATURAS DE HOGWARTS
CREATE TABLE course (
  id         NUMBER PRIMARY KEY,
  name       VARCHAR2(50),
  teacher_id NUMBER UNIQUE,
  CONSTRAINT fk_course_teacher
    FOREIGN KEY (teacher_id) REFERENCES person(id)
);

-- "ENROLLMENT" => LAS MATRÍCULAS (QUIÉN ESTÁ APUNTADO A QUÉ ASIGNATURAS)
CREATE TABLE enrollment (
  person_enrollment NUMBER,
  course_enrollment NUMBER,
  CONSTRAINT pk_enrollment PRIMARY KEY (person_enrollment, course_enrollment),
  CONSTRAINT fk_enroll_person FOREIGN KEY (person_enrollment) REFERENCES person(id),
  CONSTRAINT fk_enroll_course FOREIGN KEY (course_enrollment) REFERENCES course(id)
);

-- "HOUSE_POINTS" => REGISTRO DE EVENTOS DE PUNTOS.
-- MODIFICADO: sin IDENTITY (para no depender de trigger / identity) + secuencia en inserts
CREATE TABLE house_points (
  id       NUMBER PRIMARY KEY,
  giver    NUMBER,
  receiver NUMBER,
  points   NUMBER,
  CONSTRAINT fk_points_giver    FOREIGN KEY (giver) REFERENCES person(id),
  CONSTRAINT fk_points_receiver FOREIGN KEY (receiver) REFERENCES person(id)
);

-- Secuencia para generar IDs de HOUSE_POINTS (MODIFICADO)
CREATE SEQUENCE house_points_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

------------------------------------------------------------
-- 2) INSERTS
------------------------------------------------------------

-- house
INSERT INTO house (id, name, wing) VALUES (1, 'Gryffindor','north-east');
INSERT INTO house (id, name, wing) VALUES (2, 'Hufflepuff','north-west');
INSERT INTO house (id, name, wing) VALUES (3, 'Ravenclaw','south-east');
INSERT INTO house (id, name, wing) VALUES (4, 'Slytherin','south-west');

-- person
INSERT INTO person VALUES(1, 'Euan', 'Abercrombie', 'euan_abercrombie@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(2, 'Katie', 'Bell', 'katie_bell@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(3, 'Lavender', 'Brown', 'lavender_brown@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(4, 'Ritchie', 'Coote', 'ritchie_coote@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(5, 'Colin', 'Creevey', 'colin_creevey@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(6, 'Dennis', 'Creevey', 'dennis_creevey@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(7, 'Seamus', 'Finnigan', 'seamus_finnigan@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(8, 'Hermione', 'Granger', 'hermione_granger@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(9, 'Angelina', 'Johnson', 'angelina_johnson@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(10, 'Lee', 'Jordan', 'lee_jordan@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(11, 'Andrew', 'Kirke', 'andrew_kirke@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(12, 'Neville', 'Longbottom', 'neville_longbottom@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(13, 'Natalie', 'McDonald', 'natalie_mcdonald@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(14, 'Mary', 'Macdonald', 'mary_macdonald@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(15, 'Cormac', 'McLaggen', 'cormac_mclaggen@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(16, 'Parvati', 'Patil', 'parvati_patil@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(17, 'Jimmy', 'Peakes', 'jimmy_peakes@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(18, 'Sally-Anne', 'Perks', 'sally-anne_perks@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(19, 'Harry', 'Potter', 'harry_potter@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(20, 'Demelza', 'Robins', 'demelza_robins@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(21, 'Jack', 'Sloper', 'jack_sloper@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(22, 'Alicia', 'Spinnet', 'alicia_spinnet@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(23, 'Dean', 'Thomas', 'dean_thomas@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(24, 'Romilda', 'Vane', 'romilda_vane@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(25, 'Fred', 'Weasley', 'fred_weasley@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(26, 'George', 'Weasley', 'george_weasley@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(27, 'Ginny', 'Weasley', 'ginny_weasley@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(28, 'Ron', 'Weasley', 'ron_weasley@hogwarts.com', 'student', 1);
INSERT INTO person VALUES(29, 'Oliver', 'Wood', 'oliver_wood@hogwarts.com', 'student', 1);

INSERT INTO person VALUES(30, 'Hannah', 'Abbott', 'hannah_abbott@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(31, 'Susan', 'Bones', 'susan_bones@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(32, 'Eleanor', 'Branstone', 'eleanor_branstone@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(33, 'Owen', 'Cauldwell', 'owen_cauldwell@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(34, 'Cedric', 'Diggory', 'cedric_diggory@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(35, 'Justin', 'Finch-Fletchley', 'justin_finch-fletchley@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(36, 'Ernie', 'Macmillan', 'ernie_macmillan@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(37, 'Laura', 'Madley', 'laura_madley@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(38, 'Eloise', 'Midgeon', 'eloise_midgeon@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(39, 'Zacharias', 'Smith', 'zacharias_smith@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(40, 'Kevin', 'Whitby', 'kevin_whitby@hogwarts.com', 'student', 2);
INSERT INTO person VALUES(41, 'Rose', 'Zeller', 'rose_zeller@hogwarts.com', 'student', 2);

INSERT INTO person VALUES(42, 'Stewart', 'Ackerley', 'stewart_ackerley@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(43, 'Marcus', 'Belby', 'marcus_belby@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(44, 'Terry', 'Boot', 'terry_boot@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(45, 'Mandy', 'Brocklehurst', 'mandy_brocklehurst@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(46, 'Cho', 'Chang', 'cho_chang@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(47, 'Eddie', 'Carmichael', 'eddie_carmichael@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(48, 'Penelope', 'Clearwater', 'penelope_clearwater@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(49, 'Michael', 'Corner', 'michael_corner@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(50, 'Roger', 'Davies', 'roger_davies@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(51, 'Marietta', 'Edgecombe', 'marietta_edgecombe@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(52, 'S', 'Fawcett', 's_fawcett@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(53, 'Anthony', 'Goldstein', 'anthony_goldstein@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(54, 'Luna', 'Lovegood', 'luna_lovegood@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(55, 'Padma', 'Patil', 'padma_patil@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(56, 'Orla', 'Quirke', 'orla_quirke@hogwarts.com', 'student', 3);
INSERT INTO person VALUES(57, 'Lisa', 'Turpin', 'lisa_turpin@hogwarts.com', 'student', 3);

INSERT INTO person VALUES(58, 'Malcolm', 'Baddock', 'malcolm_baddock@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(59, 'Miles', 'Bletchley', 'miles_bletchley@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(60, 'Millicent', 'Bullstrode', 'millicent_bullstrode@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(61, 'Vincent', 'Crabbe', 'vincent_crabbe@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(62, 'Marcus', 'Flint', 'marcus_flint@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(63, 'Gregory', 'Goyle', 'gregory_goyle@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(64, 'Terence', 'Higgs', 'terence_higgs@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(65, 'Draco', 'Malfoy', 'draco_malfoy@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(66, 'Theodore', 'Nott', 'theodore_nott@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(67, 'Pansy', 'Parkinson', 'pansy_parkinson@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(68, 'Graham', 'Pritchard', 'graham_pritchard@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(69, 'Adrian', 'Pucey', 'adrian_pucey@hogwarts.com', 'student', 4);
INSERT INTO person VALUES(70, 'Blaise', 'Zabini', 'blaise_zabini@hogwarts.com', 'student', 4);

INSERT INTO person VALUES(71, 'Sirius', 'Black', 'sirius_black@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(72, 'James', 'Potter', 'james_potter@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(73, 'Lily', 'Potter', 'lily_potter@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(74, 'Arthur', 'Weasley', 'arthur_weasley@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(75, 'Bill', 'Weasley', 'bill_weasley@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(76, 'Charlie', 'Weasley', 'charlie_weasley@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(77, 'Molly', 'Weasley', 'molly_weasley@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(78, 'Percy', 'Weasley', 'percy_weasley@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(79, 'Justin', 'Finch-Fletchley', 'justin_finch-fletchley@hogwarts.com', 'PAS', 2);
INSERT INTO person VALUES(80, 'Nymphadora', 'Tonks', 'nymphadora_tonks@hogwarts.com', 'PAS', 2);
INSERT INTO person VALUES(81, 'Filius', 'Flitwick', 'filius_flitwick@hogwarts.com', 'PAS', 3);
INSERT INTO person VALUES(82, 'Regulus', 'Black', 'regulus_black@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(83, 'Bellatrix', 'Lestrange', 'bellatrix_lestrange@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(84, 'Rabastan', 'Lestrange', 'rabastan_lestrange@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(85, 'Rodolphus', 'Lestrange', 'rodolphus_lestrange@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(86, 'Abraxas', 'Malfoy', 'abraxas_malfoy@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(87, 'Lucius', 'Malfoy', 'lucius_malfoy@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(88, 'Narcissa', 'Malfoy', 'narcissa_malfoy@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(89, 'Tom', 'Riddle', 'tom_riddle@hogwarts.com', 'PAS', 4);
INSERT INTO person VALUES(90, 'Peter', 'Pettigrew', 'peter_pettigrew@hogwarts.com', 'PAS', 1);

INSERT INTO person VALUES(91, 'Godric', 'Gryffindor', 'godric_gryffindor@hogwarts.com', 'PAS', 1);
INSERT INTO person VALUES(92, 'Helga', 'Hufflepuff', 'helga_hufflepuff@hogwarts.com', 'PAS', 2);
INSERT INTO person VALUES(93, 'Rowena', 'Ravenclaw', 'rowena_ravenclaw@hogwarts.com', 'PAS', 3);
INSERT INTO person VALUES(94, 'Salazar', 'Slytherin', 'salazar_slytherin@hogwarts.com', 'PAS', 4);

INSERT INTO person VALUES(95, 'Albus', 'Dumbledore', 'albus_dumbledore@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(96, 'Rubeus', 'Hagrid', 'rubeus_hagrid@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(97, 'Minerva', 'McGonagall', 'minerva_mcgonagall@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(98, 'Pomona', 'Sprout', 'pomona_sprout@hogwarts.com', 'teacher', 2);
INSERT INTO person VALUES(99, 'Severus', 'Snape', 'severus_snape@hogwarts.com', 'teacher', 4);
INSERT INTO person VALUES(100, 'Cuthbert', 'Binns', 'cuthbert_binns@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(101, 'Aurora', 'Sinistra', 'aurora_sinistra@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(102, 'Rolanda', 'Hooch', 'rolanda_hooch@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(103, 'Charity', 'Burbage', 'charity_burbage@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(104, 'Sybill', 'Trelawney', 'sybill_trelawney@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(105, 'Septima', 'Vector', 'septima_vector@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(106, 'Bathsheda', 'Babbling', 'bathsheda_babbling@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(107, 'Horace', 'Slughorn', 'horace_slughorn@hogwarts.com', 'teacher', 4);
INSERT INTO person VALUES(108, 'Alastor', 'Moody', 'alastor_moody@hogwarts.com', 'teacher', 1);
INSERT INTO person VALUES(109, 'Remus', 'Lupin', 'remus_lupin@hogwarts.com', 'teacher', 1);

-- course
INSERT INTO course (id, name, teacher_id) VALUES
  (1,'Potions', (SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'));
INSERT INTO course (id, name, teacher_id) VALUES
  (2,'Transfiguration', (SELECT id FROM person WHERE first_name='Minerva' AND last_name='McGonagall'));
INSERT INTO course (id, name, teacher_id) VALUES
  (3,'Charms', (SELECT id FROM person WHERE first_name='Filius' AND last_name='Flitwick'));
INSERT INTO course (id, name, teacher_id) VALUES
  (4,'Herbology', (SELECT id FROM person WHERE first_name='Pomona' AND last_name='Sprout'));
INSERT INTO course (id, name, teacher_id) VALUES
  (5,'Defense Against the Dark Arts', (SELECT id FROM person WHERE first_name='Remus' AND last_name='Lupin'));
INSERT INTO course (id, name, teacher_id) VALUES
  (6,'Astronomy', (SELECT id FROM person WHERE first_name='Aurora' AND last_name='Sinistra'));
INSERT INTO course (id, name, teacher_id) VALUES
  (7,'Flying', (SELECT id FROM person WHERE first_name='Rolanda' AND last_name='Hooch'));
INSERT INTO course (id, name, teacher_id) VALUES
  (8,'Muggle Studies', (SELECT id FROM person WHERE first_name='Charity' AND last_name='Burbage'));
INSERT INTO course (id, name, teacher_id) VALUES
  (9,'History of Magic', (SELECT id FROM person WHERE first_name='Cuthbert' AND last_name='Binns'));
INSERT INTO course (id, name, teacher_id) VALUES
  (10,'Headmaster', (SELECT id FROM person WHERE first_name='Albus' AND last_name='Dumbledore'));
INSERT INTO course (id, name, teacher_id) VALUES
  (11,'Care of Magical Creatures', (SELECT id FROM person WHERE first_name='Rubeus' AND last_name='Hagrid'));
INSERT INTO course (id, name, teacher_id) VALUES
  (12,'Divination', (SELECT id FROM person WHERE first_name='Sybill' AND last_name='Trelawney'));
INSERT INTO course (id, name, teacher_id) VALUES
  (13,'Arithmancy', (SELECT id FROM person WHERE first_name='Septima' AND last_name='Vector'));
INSERT INTO course (id, name, teacher_id) VALUES
  (14,'Ancient Runes', (SELECT id FROM person WHERE first_name='Bathsheda' AND last_name='Babbling'));

-- enrollment
INSERT ALL
  INTO enrollment VALUES (1,1) INTO enrollment VALUES (1,2) INTO enrollment VALUES (1,3) INTO enrollment VALUES (1,4) INTO enrollment VALUES (1,5) INTO enrollment VALUES (1,6)
  INTO enrollment VALUES (2,1) INTO enrollment VALUES (2,2) INTO enrollment VALUES (2,3) INTO enrollment VALUES (2,4) INTO enrollment VALUES (2,5) INTO enrollment VALUES (2,6)
  INTO enrollment VALUES (3,1) INTO enrollment VALUES (3,2) INTO enrollment VALUES (3,3) INTO enrollment VALUES (3,4) INTO enrollment VALUES (3,5) INTO enrollment VALUES (3,6)
  INTO enrollment VALUES (4,1) INTO enrollment VALUES (4,2) INTO enrollment VALUES (4,3) INTO enrollment VALUES (4,4) INTO enrollment VALUES (4,5) INTO enrollment VALUES (4,6)
  INTO enrollment VALUES (5,1) INTO enrollment VALUES (5,2) INTO enrollment VALUES (5,3) INTO enrollment VALUES (5,4) INTO enrollment VALUES (5,5) INTO enrollment VALUES (5,6)
  INTO enrollment VALUES (6,1) INTO enrollment VALUES (6,2) INTO enrollment VALUES (6,3) INTO enrollment VALUES (6,4) INTO enrollment VALUES (6,5) INTO enrollment VALUES (6,6)
  INTO enrollment VALUES (7,1) INTO enrollment VALUES (7,2) INTO enrollment VALUES (7,3) INTO enrollment VALUES (7,4) INTO enrollment VALUES (7,5) INTO enrollment VALUES (7,6)
  INTO enrollment VALUES (8,1) INTO enrollment VALUES (8,2) INTO enrollment VALUES (8,3) INTO enrollment VALUES (8,4) INTO enrollment VALUES (8,5) INTO enrollment VALUES (8,6)
  INTO enrollment VALUES (9,1) INTO enrollment VALUES (9,2) INTO enrollment VALUES (9,3) INTO enrollment VALUES (9,4) INTO enrollment VALUES (9,5) INTO enrollment VALUES (9,6)
  INTO enrollment VALUES (10,1) INTO enrollment VALUES (10,2) INTO enrollment VALUES (10,3) INTO enrollment VALUES (10,4) INTO enrollment VALUES (10,5) INTO enrollment VALUES (10,6)
  INTO enrollment VALUES (11,1) INTO enrollment VALUES (11,2) INTO enrollment VALUES (11,3) INTO enrollment VALUES (11,4) INTO enrollment VALUES (11,5) INTO enrollment VALUES (11,6)
  INTO enrollment VALUES (12,1) INTO enrollment VALUES (12,2) INTO enrollment VALUES (12,3) INTO enrollment VALUES (12,4) INTO enrollment VALUES (12,5) INTO enrollment VALUES (12,6)
  INTO enrollment VALUES (13,1) INTO enrollment VALUES (13,2) INTO enrollment VALUES (13,3) INTO enrollment VALUES (13,4) INTO enrollment VALUES (13,5) INTO enrollment VALUES (13,6)
  INTO enrollment VALUES (14,1) INTO enrollment VALUES (14,2) INTO enrollment VALUES (14,3) INTO enrollment VALUES (14,4) INTO enrollment VALUES (14,5) INTO enrollment VALUES (14,6)
  INTO enrollment VALUES (15,1) INTO enrollment VALUES (15,2) INTO enrollment VALUES (15,3) INTO enrollment VALUES (15,4) INTO enrollment VALUES (15,5) INTO enrollment VALUES (15,6)
  INTO enrollment VALUES (16,1) INTO enrollment VALUES (16,2) INTO enrollment VALUES (16,3) INTO enrollment VALUES (16,4) INTO enrollment VALUES (16,5) INTO enrollment VALUES (16,6)
  INTO enrollment VALUES (17,1) INTO enrollment VALUES (17,2) INTO enrollment VALUES (17,3) INTO enrollment VALUES (17,4) INTO enrollment VALUES (17,5) INTO enrollment VALUES (17,6)
  INTO enrollment VALUES (18,1) INTO enrollment VALUES (18,2) INTO enrollment VALUES (18,3) INTO enrollment VALUES (18,4) INTO enrollment VALUES (18,5) INTO enrollment VALUES (18,6)
  INTO enrollment VALUES (19,1) INTO enrollment VALUES (19,2) INTO enrollment VALUES (19,3) INTO enrollment VALUES (19,4) INTO enrollment VALUES (19,5) INTO enrollment VALUES (19,6)
  INTO enrollment VALUES (20,1) INTO enrollment VALUES (20,2) INTO enrollment VALUES (20,3) INTO enrollment VALUES (20,4) INTO enrollment VALUES (20,5) INTO enrollment VALUES (20,6)
  INTO enrollment VALUES (21,1) INTO enrollment VALUES (21,2) INTO enrollment VALUES (21,3) INTO enrollment VALUES (21,4) INTO enrollment VALUES (21,5) INTO enrollment VALUES (21,6)
  INTO enrollment VALUES (22,1) INTO enrollment VALUES (22,2) INTO enrollment VALUES (22,3) INTO enrollment VALUES (22,4) INTO enrollment VALUES (22,5) INTO enrollment VALUES (22,6)
  INTO enrollment VALUES (23,1) INTO enrollment VALUES (23,2) INTO enrollment VALUES (23,3) INTO enrollment VALUES (23,4) INTO enrollment VALUES (23,5) INTO enrollment VALUES (23,6)
  INTO enrollment VALUES (24,1) INTO enrollment VALUES (24,2) INTO enrollment VALUES (24,3) INTO enrollment VALUES (24,4) INTO enrollment VALUES (24,5) INTO enrollment VALUES (24,6)
  INTO enrollment VALUES (25,1) INTO enrollment VALUES (25,2) INTO enrollment VALUES (25,3) INTO enrollment VALUES (25,4) INTO enrollment VALUES (25,5) INTO enrollment VALUES (25,6)
  INTO enrollment VALUES (26,1) INTO enrollment VALUES (26,2) INTO enrollment VALUES (26,3) INTO enrollment VALUES (26,4) INTO enrollment VALUES (26,5) INTO enrollment VALUES (26,6)
  INTO enrollment VALUES (27,1) INTO enrollment VALUES (27,2) INTO enrollment VALUES (27,3) INTO enrollment VALUES (27,4) INTO enrollment VALUES (27,5) INTO enrollment VALUES (27,6)
  INTO enrollment VALUES (28,1) INTO enrollment VALUES (28,2) INTO enrollment VALUES (28,3) INTO enrollment VALUES (28,4) INTO enrollment VALUES (28,5) INTO enrollment VALUES (28,6)
  INTO enrollment VALUES (29,1) INTO enrollment VALUES (29,2) INTO enrollment VALUES (29,3) INTO enrollment VALUES (29,4) INTO enrollment VALUES (29,5) INTO enrollment VALUES (29,6)
  INTO enrollment VALUES (30,1) INTO enrollment VALUES (30,2) INTO enrollment VALUES (30,3) INTO enrollment VALUES (30,4) INTO enrollment VALUES (30,5) INTO enrollment VALUES (30,6)
  INTO enrollment VALUES (31,1) INTO enrollment VALUES (31,2) INTO enrollment VALUES (31,3) INTO enrollment VALUES (31,4) INTO enrollment VALUES (31,5) INTO enrollment VALUES (31,6)
  INTO enrollment VALUES (32,1) INTO enrollment VALUES (32,2) INTO enrollment VALUES (32,3) INTO enrollment VALUES (32,4) INTO enrollment VALUES (32,5) INTO enrollment VALUES (32,6)
  INTO enrollment VALUES (33,1) INTO enrollment VALUES (33,2) INTO enrollment VALUES (33,3) INTO enrollment VALUES (33,4) INTO enrollment VALUES (33,5) INTO enrollment VALUES (33,6)
  INTO enrollment VALUES (34,1) INTO enrollment VALUES (34,2) INTO enrollment VALUES (34,3) INTO enrollment VALUES (34,4) INTO enrollment VALUES (34,5) INTO enrollment VALUES (34,6)
  INTO enrollment VALUES (35,1) INTO enrollment VALUES (35,2) INTO enrollment VALUES (35,3) INTO enrollment VALUES (35,4) INTO enrollment VALUES (35,5) INTO enrollment VALUES (35,6)
  INTO enrollment VALUES (36,1) INTO enrollment VALUES (36,2) INTO enrollment VALUES (36,3) INTO enrollment VALUES (36,4) INTO enrollment VALUES (36,5) INTO enrollment VALUES (36,6)
  INTO enrollment VALUES (37,1) INTO enrollment VALUES (37,2) INTO enrollment VALUES (37,3) INTO enrollment VALUES (37,4) INTO enrollment VALUES (37,5) INTO enrollment VALUES (37,6)
  INTO enrollment VALUES (38,1) INTO enrollment VALUES (38,2) INTO enrollment VALUES (38,3) INTO enrollment VALUES (38,4) INTO enrollment VALUES (38,5) INTO enrollment VALUES (38,6)
  INTO enrollment VALUES (39,1) INTO enrollment VALUES (39,2) INTO enrollment VALUES (39,3) INTO enrollment VALUES (39,4) INTO enrollment VALUES (39,5) INTO enrollment VALUES (39,6)
  INTO enrollment VALUES (40,1) INTO enrollment VALUES (40,2) INTO enrollment VALUES (40,3) INTO enrollment VALUES (40,4) INTO enrollment VALUES (40,5) INTO enrollment VALUES (40,6)
  INTO enrollment VALUES (41,1) INTO enrollment VALUES (41,2) INTO enrollment VALUES (41,3) INTO enrollment VALUES (41,4) INTO enrollment VALUES (41,5) INTO enrollment VALUES (41,6)
  INTO enrollment VALUES (42,1) INTO enrollment VALUES (42,2) INTO enrollment VALUES (42,3) INTO enrollment VALUES (42,4) INTO enrollment VALUES (42,5) INTO enrollment VALUES (42,6)
  INTO enrollment VALUES (43,1) INTO enrollment VALUES (43,2) INTO enrollment VALUES (43,3) INTO enrollment VALUES (43,4) INTO enrollment VALUES (43,5) INTO enrollment VALUES (43,6)
  INTO enrollment VALUES (44,1) INTO enrollment VALUES (44,2) INTO enrollment VALUES (44,3) INTO enrollment VALUES (44,4) INTO enrollment VALUES (44,5) INTO enrollment VALUES (44,6)
  INTO enrollment VALUES (45,1) INTO enrollment VALUES (45,2) INTO enrollment VALUES (45,3) INTO enrollment VALUES (45,4) INTO enrollment VALUES (45,5) INTO enrollment VALUES (45,6)
  INTO enrollment VALUES (46,1) INTO enrollment VALUES (46,2) INTO enrollment VALUES (46,3) INTO enrollment VALUES (46,4) INTO enrollment VALUES (46,5) INTO enrollment VALUES (46,6)
  INTO enrollment VALUES (47,1) INTO enrollment VALUES (47,2) INTO enrollment VALUES (47,3) INTO enrollment VALUES (47,4) INTO enrollment VALUES (47,5) INTO enrollment VALUES (47,6)
  INTO enrollment VALUES (48,1) INTO enrollment VALUES (48,2) INTO enrollment VALUES (48,3) INTO enrollment VALUES (48,4) INTO enrollment VALUES (48,5) INTO enrollment VALUES (48,6)
  INTO enrollment VALUES (49,1) INTO enrollment VALUES (49,2) INTO enrollment VALUES (49,3) INTO enrollment VALUES (49,4) INTO enrollment VALUES (49,5) INTO enrollment VALUES (49,6)
  INTO enrollment VALUES (50,1) INTO enrollment VALUES (50,2) INTO enrollment VALUES (50,3) INTO enrollment VALUES (50,4) INTO enrollment VALUES (50,5) INTO enrollment VALUES (50,6)
  INTO enrollment VALUES (51,1) INTO enrollment VALUES (51,2) INTO enrollment VALUES (51,3) INTO enrollment VALUES (51,4) INTO enrollment VALUES (51,5) INTO enrollment VALUES (51,6)
  INTO enrollment VALUES (52,1) INTO enrollment VALUES (52,2) INTO enrollment VALUES (52,3) INTO enrollment VALUES (52,4) INTO enrollment VALUES (52,5) INTO enrollment VALUES (52,6)
  INTO enrollment VALUES (53,1) INTO enrollment VALUES (53,2) INTO enrollment VALUES (53,3) INTO enrollment VALUES (53,4) INTO enrollment VALUES (53,5) INTO enrollment VALUES (53,6)
  INTO enrollment VALUES (54,1) INTO enrollment VALUES (54,2) INTO enrollment VALUES (54,3) INTO enrollment VALUES (54,4) INTO enrollment VALUES (54,5) INTO enrollment VALUES (54,6)
  INTO enrollment VALUES (55,1) INTO enrollment VALUES (55,2) INTO enrollment VALUES (55,3) INTO enrollment VALUES (55,4) INTO enrollment VALUES (55,5) INTO enrollment VALUES (55,6)
  INTO enrollment VALUES (56,1) INTO enrollment VALUES (56,2) INTO enrollment VALUES (56,3) INTO enrollment VALUES (56,4) INTO enrollment VALUES (56,5) INTO enrollment VALUES (56,6)
  INTO enrollment VALUES (57,1) INTO enrollment VALUES (57,2) INTO enrollment VALUES (57,3) INTO enrollment VALUES (57,4) INTO enrollment VALUES (57,5) INTO enrollment VALUES (57,6)
  INTO enrollment VALUES (58,1) INTO enrollment VALUES (58,2) INTO enrollment VALUES (58,3) INTO enrollment VALUES (58,4) INTO enrollment VALUES (58,5) INTO enrollment VALUES (58,6)
  INTO enrollment VALUES (59,1) INTO enrollment VALUES (59,2) INTO enrollment VALUES (59,3) INTO enrollment VALUES (59,4) INTO enrollment VALUES (59,5) INTO enrollment VALUES (59,6)
  INTO enrollment VALUES (60,1) INTO enrollment VALUES (60,2) INTO enrollment VALUES (60,3) INTO enrollment VALUES (60,4) INTO enrollment VALUES (60,5) INTO enrollment VALUES (60,6)
  INTO enrollment VALUES (61,1) INTO enrollment VALUES (61,2) INTO enrollment VALUES (61,3) INTO enrollment VALUES (61,4) INTO enrollment VALUES (61,5) INTO enrollment VALUES (61,6)
  INTO enrollment VALUES (62,1) INTO enrollment VALUES (62,2) INTO enrollment VALUES (62,3) INTO enrollment VALUES (62,4) INTO enrollment VALUES (62,5) INTO enrollment VALUES (62,6)
  INTO enrollment VALUES (63,1) INTO enrollment VALUES (63,2) INTO enrollment VALUES (63,3) INTO enrollment VALUES (63,4) INTO enrollment VALUES (63,5) INTO enrollment VALUES (63,6)
  INTO enrollment VALUES (64,1) INTO enrollment VALUES (64,2) INTO enrollment VALUES (64,3) INTO enrollment VALUES (64,4) INTO enrollment VALUES (64,5) INTO enrollment VALUES (64,6)
  INTO enrollment VALUES (65,1) INTO enrollment VALUES (65,2) INTO enrollment VALUES (65,3) INTO enrollment VALUES (65,4) INTO enrollment VALUES (65,5) INTO enrollment VALUES (65,6)
  INTO enrollment VALUES (66,1) INTO enrollment VALUES (66,2) INTO enrollment VALUES (66,3) INTO enrollment VALUES (66,4) INTO enrollment VALUES (66,5) INTO enrollment VALUES (66,6)
  INTO enrollment VALUES (67,1) INTO enrollment VALUES (67,2) INTO enrollment VALUES (67,3) INTO enrollment VALUES (67,4) INTO enrollment VALUES (67,5) INTO enrollment VALUES (67,6)
  INTO enrollment VALUES (68,1) INTO enrollment VALUES (68,2) INTO enrollment VALUES (68,3) INTO enrollment VALUES (68,4) INTO enrollment VALUES (68,5) INTO enrollment VALUES (68,6)
  INTO enrollment VALUES (69,1) INTO enrollment VALUES (69,2) INTO enrollment VALUES (69,3) INTO enrollment VALUES (69,4) INTO enrollment VALUES (69,5) INTO enrollment VALUES (69,6)
  INTO enrollment VALUES (70,1) INTO enrollment VALUES (70,2) INTO enrollment VALUES (70,3) INTO enrollment VALUES (70,4) INTO enrollment VALUES (70,5) INTO enrollment VALUES (70,6)
SELECT 1 FROM dual;

-- house_points (MODIFICADO: se incluye ID con secuencia)
INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
  (SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),
  -50
);

INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
  (SELECT id FROM person WHERE first_name='Ron' AND last_name='Weasley'),
  -50
);

INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Severus' AND last_name='Snape'),
  (SELECT id FROM person WHERE first_name='Hermione' AND last_name='Granger'),
  -50
);

INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Minerva' AND last_name='McGonagall'),
  (SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),
  50
);

INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Albus' AND last_name='Dumbledore'),
  (SELECT id FROM person WHERE first_name='Harry' AND last_name='Potter'),
  100
);

INSERT INTO house_points (id, giver, receiver, points) VALUES
(
  house_points_seq.NEXTVAL,
  (SELECT id FROM person WHERE first_name='Pomona' AND last_name='Sprout'),
  (SELECT id FROM person WHERE first_name='Hermione' AND last_name='Granger'),
  20
);

COMMIT;