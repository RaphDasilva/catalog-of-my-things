CREATE TABLE IF NOT EXISTS labels (
  id              SERIAL PRIMARY KEY,
  title           VARCHAR(50) NOT NULL,
  color           VARCHAR(50) NOT NULL,
);

CREATE TABLE IF NOT EXISTS genres (
  id              SERIAL PRIMARY KEY,
);

CREATE TABLE IF NOT EXISTS authors (
  id              SERIAL PRIMARY KEY,
);

CREATE TABLE IF NOT EXISTS sources (
  id              SERIAL PRIMARY KEY,
);

CREATE TABLE IF NOT EXISTS books (
  id              SERIAL PRIMARY KEY,
  publish_date    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  archived        BOOLEAN NOT NULL DEFAULT FALSE,
  publisher       VARCHAR(50) NOT NULL,
  cover_state     VARCHAR(20) NOT NULL,
  genre_id        INT,
  author_id       INT,
  source_id       INT,
  label_id        INT,

  CONSTRAINT fk_genre
    FOREIGN KEY(genre_id)
	  REFERENCES genres(id),
  CONSTRAINT fk_author
    FOREIGN KEY(author_id)
    REFERENCES authors(id),
  CONSTRAINT fk_source
    FOREIGN KEY(source_id)
    REFERENCES sources(id),
  CONSTRAINT fk_label
    FOREIGN KEY(label_id)
    REFERENCES labels(id)
);

CREATE TABLE IF NOT EXISTS labe_books (
  id              SERIAL PRIMARY KEY,
  label_id        INT NOT NULL,
  book_id         INT NOT NULL,

  CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
    REFERENCES labels(id),
  CONSTRAINT fk_book
    FOREIGN KEY(book_id) 
    REFERENCES books(id)
);