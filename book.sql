CREATE DATABASE book_portal;

USE book_portal;

/*publish details*/
CREATE TABLE publishers(
publisherID INT AUTO_INCREMENT PRIMARY KEY,
PublishersName VARCHAR(100),
location VARCHAR (255)
);

/*authors details*/
CREATE TABLE author(
authorID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
biography TEXT
);
SELECT* FROM author;

/*book table details*/

CREATE TABLE book(
isbn VARCHAR (20) PRIMARY KEY,
title VARCHAR(255),
publication_year YEAR NOT NULL,
publisherID INT,
FOREIGN KEY(publisherID) REFERENCES publishers(publisherID) ON DELETE SET NULL
);

SELECT* FROM book;
/*join table for many-to-many relationship*/

CREATE TABLE Book_Authors (
    bookID VARCHAR(20),
    authorID INT,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES book(isbn) ON DELETE CASCADE,
    FOREIGN KEY (authorID) REFERENCES author(authorID) ON DELETE CASCADE
);
SELECT* FROM Book_Authors;