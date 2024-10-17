## 1. Extract nouns from the user stories or specification

```
As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of movies with their title and release date.
Movies > title, release_date

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of my cinemas with their city name (e.g 'London' or 'Manchester').
Cinemas > city_name

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which cinemas are showing a specific movie.
Movies_Cinemas 

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which movies are being shown at a specific cinema.
Movies_Cinemas
```

```
Nouns:

Movies, title, release_date, Cinemas, city_name, Movies_Cinemas
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| Movies                | title, release_date |
| Cinemas               | city_name           |


1. Name of the first table (always plural): `movies` 

    Column names: `title`, `release_year`

2. Name of the second table (always plural): `cinemas` 

    Column names: `city_name`

## 3. Decide the column types.

```
# EXAMPLE:

Table: movies
id: SERIAL
title: varchar(250)
release_year: int

Table: cinemas
id: SERIAL
city_name: varchar(250)
```

## 4. Design the Many-to-Many relationship

```

1. Can one cinema have many movies? YES
2. Can one movie have many cinemas? YES
```

## 5. Design the Join Table

```
# EXAMPLE

Join table for tables: movies and cinemas
Join table name: movies_cinemas
Columns: movie_id, cinema_id
```

## 6. Write the SQL.

```sql
-- file: students_tags.sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(250),
  release_year INT
);

CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(250)
);

-- Create the join table.
CREATE TABLE movies_cinemas (
  movie_id int,
  cinema_id int,
  constraint fk_movie foreign key(movie_id) references movies(id) on delete cascade,
  constraint fk_cinema foreign key(cinema_id) references cinemas(id) on delete cascade,
  PRIMARY KEY (movie_id, cinema_id)
);

```

## 7. Create the tables.

```bash
psql -h 127.0.0.1 many_to_many < many_to_many.sql
```