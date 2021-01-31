SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS avg_typing_speed;
DROP TABLE IF EXISTS game_default_quiz;
DROP TABLE IF EXISTS interview_quiz_mark;
DROP TABLE IF EXISTS interview_quiz;
DROP TABLE IF EXISTS longword_quiz;
DROP TABLE IF EXISTS shortword_quiz;
DROP TABLE IF EXISTS quiz_category;
DROP TABLE IF EXISTS member_;




/* Create Tables */

CREATE TABLE avg_typing_speed
(
	id varchar(40) NOT NULL,
	avg_typing_speed int,
	typing_date datetime DEFAULT NOW(), SYSDATE()
);


CREATE TABLE game_default_quiz
(
	game_default_quiz_no int NOT NULL AUTO_INCREMENT,
	game_code int NOT NULL,
	game_default_quiz text NOT NULL,
	game_default_quiz_info text NOT NULL,
	game_default_quiz_category varchar(40) NOT NULL,
	PRIMARY KEY (game_default_quiz_no)
);


CREATE TABLE interview_quiz
(
	interview_quiz_no int NOT NULL AUTO_INCREMENT,
	category_no int NOT NULL,
	interview_quiz text NOT NULL,
	interview_quiz_info text NOT NULL,
	PRIMARY KEY (interview_quiz_no)
);


CREATE TABLE interview_quiz_mark
(
	id varchar(40) NOT NULL,
	interview_quiz_no int NOT NULL
);


CREATE TABLE longword_quiz
(
	longword_quiz_no int NOT NULL AUTO_INCREMENT,
	category_no int NOT NULL,
	longword_quiz varchar(100) NOT NULL,
	longword_quiz_info text NOT NULL,
	PRIMARY KEY (longword_quiz_no)
);


CREATE TABLE member_
(
	id varchar(40) NOT NULL,
	password varchar(2000) NOT NULL,
	nickname varchar(40) NOT NULL,
	sign_date datetime DEFAULT NOW(), SYSDATE() NOT NULL,
	profile_img varchar(40) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (nickname)
);


CREATE TABLE quiz_category
(
	category_no int NOT NULL AUTO_INCREMENT,
	id varchar(40) NOT NULL,
	category_name varchar(40) NOT NULL,
	game_code int NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE shortword_quiz
(
	shortword_quiz_no int NOT NULL AUTO_INCREMENT,
	category_no int NOT NULL,
	shortword_quiz varchar(40) NOT NULL,
	shortword_quiz_info text NOT NULL,
	PRIMARY KEY (shortword_quiz_no)
);



/* Create Foreign Keys */

ALTER TABLE interview_quiz_mark
	ADD FOREIGN KEY (interview_quiz_no)
	REFERENCES interview_quiz (interview_quiz_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE avg_typing_speed
	ADD FOREIGN KEY (id)
	REFERENCES member_ (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE interview_quiz_mark
	ADD FOREIGN KEY (id)
	REFERENCES member_ (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE quiz_category
	ADD FOREIGN KEY (id)
	REFERENCES member_ (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE interview_quiz
	ADD FOREIGN KEY (category_no)
	REFERENCES quiz_category (category_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE longword_quiz
	ADD FOREIGN KEY (category_no)
	REFERENCES quiz_category (category_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shortword_quiz
	ADD FOREIGN KEY (category_no)
	REFERENCES quiz_category (category_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



