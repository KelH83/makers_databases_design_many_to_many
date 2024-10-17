--EXERCISE
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  student_name VARCHAR(250)
);

INSERT INTO students (student_name) VALUES ('Kelly Howes');
INSERT INTO students (student_name) VALUES ('Kimiko Dogue');
INSERT INTO students (student_name) VALUES ('Twyla Kitty');
INSERT INTO students (student_name) VALUES ('Tokyo Hisser');
INSERT INTO students (student_name) VALUES ('Kiyomi Barker');
INSERT INTO students (student_name) VALUES ('Mini Panther');
INSERT INTO students (student_name) VALUES ('Yuki Snake');

DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(250)
);

INSERT INTO tags (tag_name) VALUES ('Happy');
INSERT INTO tags (tag_name) VALUES ('Paranoid');
INSERT INTO tags (tag_name) VALUES ('Cuddly');
INSERT INTO tags (tag_name) VALUES ('Neutral');
INSERT INTO tags (tag_name) VALUES ('Stubborn');
INSERT INTO tags (tag_name) VALUES ('Snappy');
INSERT INTO tags (tag_name) VALUES ('Indifferent');

DROP TABLE IF EXISTS students_tags;

CREATE TABLE students_tags (
  student_id int,
  tag_id int,
  constraint fk_student foreign key(student_id) references students(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
  PRIMARY KEY (student_id, tag_id)
);

INSERT INTO students_tags (student_id, tag_id) VALUES (1, 1);
INSERT INTO students_tags (student_id, tag_id) VALUES (2, 2);
INSERT INTO students_tags (student_id, tag_id) VALUES (2, 3);
INSERT INTO students_tags (student_id, tag_id) VALUES (3, 1);
INSERT INTO students_tags (student_id, tag_id) VALUES (3, 3);
INSERT INTO students_tags (student_id, tag_id) VALUES (3, 4);
INSERT INTO students_tags (student_id, tag_id) VALUES (4, 4);
INSERT INTO students_tags (student_id, tag_id) VALUES (4, 7);

--CHALLENGE

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(250),
  release_year INT
);

INSERT INTO movies (title, release_year) VALUES ('Lord of the rings', 2001);
INSERT INTO movies (title, release_year) VALUES ('The Matrix', 1999);
INSERT INTO movies (title, release_year) VALUES ('Inception', 2010);
INSERT INTO movies (title, release_year) VALUES ('Fear and loathing in Las Vegas', 1998);
INSERT INTO movies (title, release_year) VALUES ('Nightmare on elm street 3', 1987);
INSERT INTO movies (title, release_year) VALUES ('Carry on camping', 1969);
INSERT INTO movies (title, release_year) VALUES ('Shutter Island', 2010);

DROP TABLE IF EXISTS cinemas;

CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(250)
);

INSERT INTO cinemas (city_name) VALUES ('Liverpool');
INSERT INTO cinemas (city_name) VALUES ('Peterborough');
INSERT INTO cinemas (city_name) VALUES ('Cambridge');
INSERT INTO cinemas (city_name) VALUES ('London');
INSERT INTO cinemas (city_name) VALUES ('Belfast');
INSERT INTO cinemas (city_name) VALUES ('Glasgow');
INSERT INTO cinemas (city_name) VALUES ('Manchester');

DROP TABLE IF EXISTS movies_cinemas;

CREATE TABLE movies_cinemas (
  movie_id int,
  cinema_id int,
  constraint fk_movie foreign key(movie_id) references movies(id) on delete cascade,
  constraint fk_cinema foreign key(cinema_id) references cinemas(id) on delete cascade,
  PRIMARY KEY (movie_id, cinema_id)
);

INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (1, 1);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (1, 3);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (1, 5);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (1, 7);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (2, 2);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (2, 4);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (2, 6);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (3, 1);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (3, 2);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (3, 3);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (3, 4);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (3, 5);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (4, 1);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (4, 2);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (4, 4);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (5, 1);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (5, 3);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (6, 4);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (6, 7);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (7, 1);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (7, 3);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (7, 4);
INSERT INTO movies_cinemas (movie_id, cinema_id) VALUES (7, 7);

