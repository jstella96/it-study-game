SET SESSION FOREIGN_KEY_CHECKS=0;

/*1. 멤버 기본  2. 기본제공 카테고리*/
/*1] 멤버 기본  */
DROP TABLE IF EXISTS avg_typing_speed;
DROP TABLE IF EXISTS interview_quiz_mark;
DROP TABLE IF EXISTS interview_quiz;
DROP TABLE IF EXISTS longword_quiz;
DROP TABLE IF EXISTS shortword_quiz;
DROP TABLE IF EXISTS quiz_category;
DROP TABLE IF EXISTS member_;


CREATE TABLE avg_typing_speed
(
	id varchar(40) NOT NULL,
	avg_typing_speed int NOT NULL,
	typing_date datetime DEFAULT current_timestamp
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
	sign_date datetime  DEFAULT current_timestamp NOT NULL,
	profile_img varchar(40) NOT NULL,
    target_typing_speed int,
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

/*2] 기본제공 카테고리  */

/*배포판 확정 -default_quiz_category */
select *from default_quiz_category order by default_quiz_category_no;
/*배포판 확정 -default_quiz*/
select *from  default_quiz where default_quiz_category_no = 1;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 1;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 2;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 3;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 4;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 5;
SET @rownum:=0; 
select @rownum:=@rownum+1 as rownum, default_quiz.* from default_quiz where default_quiz_category_no = 6;

/*재 부팅시 여기부터 시작*/

/*drop and create*/
DROP TABLE IF EXISTS default_quiz;
DROP TABLE IF EXISTS default_quiz_category;

CREATE TABLE default_quiz_category
(
	default_quiz_category_no int NOT NULL AUTO_INCREMENT,
	default_quiz_category_name varchar(20),
	game_code int,
	PRIMARY KEY (default_quiz_category_no)
);
CREATE TABLE default_quiz
(
	default_quiz_no int NOT NULL AUTO_INCREMENT,
	default_quiz_category_no int NOT NULL,
	default_quiz text NOT NULL,
	default_quiz_info text NOT NULL,
	PRIMARY KEY (default_quiz_no)
);

/*
ALTER TABLE default_quiz
	ADD FOREIGN KEY (default_quiz_category_no)
	REFERENCES default_quiz_category (default_quiz_category_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;
*/


/*긴글연습 부분 카테고리 이름은 바뀔 수 있음*/
INSERT INTO default_quiz_category VALUES(0,'자바코드',1);
INSERT INTO default_quiz_category VALUES(0,'오라클쿼리',1);
/*짧은글 연습부분 카테고리 이름은 바뀔 수 있음*/
INSERT INTO default_quiz_category VALUES(0,'스프링/기초',2);
/*인터뷰 부분 카테고리 이름은 바뀔 수 있음*/
INSERT INTO default_quiz_category VALUES(0,'기초it용어',3);
INSERT INTO default_quiz_category VALUES(0,'백엔드',3);
INSERT INTO default_quiz_category VALUES(0,'프론트엔드',3);


/*긴글연습 부분 - 자바코드 */
INSERT INTO default_quiz VALUES(0,1,'자바코드 1','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 6','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 7','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 8','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 9','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 10','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 11','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 12','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 13','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 14','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 15','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 16','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 17','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 18','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 19','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,1,'자바코드 20','자바코드 1 info');
/*긴글연습 부분 - 오라클 쿼리 */
INSERT INTO default_quiz VALUES(0,2,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,2,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'오라클쿼리5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 6','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 7','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 8','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 9','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 10','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 11','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 12','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 13','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 14','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 15','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 16','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 17','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 18','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 19','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,2,'자바코드 20','자바코드 1 info');

/*짧은글연습 부분 - 스프링/기본*/
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리10','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리15','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리20','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리25','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리30','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리35','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,3,'오라클쿼리40','자바코드 1 info');

/*인터뷰 부분 - 기초 용어 10개로 줄임*/
INSERT INTO default_quiz VALUES(0,4,'인터뷰1','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,4,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'오라클쿼리5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'자바코드 6','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'자바코드 7','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'자바코드 8','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'자바코드 9','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,4,'자바코드 10','자바코드 1 info');



/*인터뷰 부분 - 백엔드 */
INSERT INTO default_quiz VALUES(0,5,'인터뷰21','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,5,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'오라클쿼리5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'자바코드 6','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'자바코드 7','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'자바코드 8','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'자바코드 9','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,5,'자바코드 10','자바코드 1 info');



/*인터뷰 부분 - 기초 용어 */
INSERT INTO default_quiz VALUES(0,6,'인터뷰31','오라클쿼리 1 info');
INSERT INTO default_quiz VALUES(0,6,'오라클쿼리2','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'오라클쿼리3','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'오라클쿼리4','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'오라클쿼리5','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'자바코드 6','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'자바코드 7','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'자바코드 8','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'자바코드 9','자바코드 1 info');
INSERT INTO default_quiz VALUES(0,6,'자바코드 10','자바코드 1 info');


commit

