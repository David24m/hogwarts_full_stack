DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id serial primary key,
  first_name varchar(255),
  last_name varchar(255),
  house varchar(255),
  age INT
);
