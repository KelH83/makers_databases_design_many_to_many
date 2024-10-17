## 1. Extract nouns from the user stories or specification

```
As a coach
So I can get to know all students
I want to keep a list of students' names.
Students > names

As a coach
So I can get to know all students
I want to assign tags to students (for example, "happy", "excited", etc).
Student_tags > tag_names

As a coach
So I can get to know all students
I want to be able to assign the same tag to many different students.
Students > tag_id

As a coach
So I can get to know all students
I want to be able to assign many different tags to a student.
Student > students_tags
```

```
Nouns:

Students, Tags, student_name, student_id, tag_name, tag_id, Students_tags
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| Students              | student_id, student_name
| Tags                  | tag_id,tag_name
| Student_tags          | student_id, tag_id

1. Name of the first table (always plural): `students` 

    Column names: `student_id`, `student_name`

2. Name of the second table (always plural): `tags` 

    Column names: `tag_id`,`tag_name`

## 3. Decide the column types.

```
# EXAMPLE:

Table: students
id: SERIAL
student_name: varchar(250)

Table: tags
id: SERIAL
tag_name: text
```

## 4. Design the Many-to-Many relationship

```

1. Can one student have many tags? YES
2. Can one tag have many students? YES
```

## 5. Design the Join Table

```
# EXAMPLE

Join table for tables: students and tags
Join table name: students_tags
Columns: student_id, tag_id
```

## 6. Write the SQL.

```sql
-- file: students_tags.sql

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  student_name VARCHAR(250)
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(250)
);

-- Create the join table.
CREATE TABLE students_tags (
  student_id int,
  tag_id int,
  constraint fk_student foreign key(student_id) references students(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
  PRIMARY KEY (student_id, tag_id)
);

```

## 7. Create the tables.

```bash
psql -h 127.0.0.1 many_students < many_to_many.sql
```