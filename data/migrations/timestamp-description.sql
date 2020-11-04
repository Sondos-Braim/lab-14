/*This command will create a table into our database that will have the author's name and an id. */
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));
/*This commad will insert the names of authors inside the table that we crated and it will take the data from the first table. */
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
/*This coomad will create a new column in the books table which will have the forign key from the authors table. */
ALTER TABLE books ADD COLUMN author_id INT;
/*This command will give the author-id column in the books table the data from the authors table. */
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
/*This command will delete the clumn in the books table that has the authors' names. */
ALTER TABLE books DROP COLUMN author;
/*This command will give the id from the books table a constraint as a forign key from the authors table. */
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
