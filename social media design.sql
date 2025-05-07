CREATE DATABASE Instagram;
USE Instagram;

/*Users table*/
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_pic VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;


/*Posts table*/
CREATE TABLE posts (
    postid INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    caption TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

SELECT * FROM posts;

/*Likes table*/
CREATE TABLE likes (
    likeid INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    postid INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, postid),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (postid) REFERENCES posts(postid) ON DELETE CASCADE
);

SELECT * FROM likes;


/*Comments table*/
CREATE TABLE comments (
    commentid INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    postid INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (postid) REFERENCES posts(postid) ON DELETE CASCADE
);

SELECT * FROM comments;

/*Followers table*/
CREATE TABLE followers (
    followerid INT NOT NULL,
    followedid INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (followerid, followedid),
    FOREIGN KEY (followerid) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (followedid) REFERENCES users(user_id) ON DELETE CASCADE
);

SELECT * FROM followers;

/* Media table*/
CREATE TABLE media (
    mediaid INT AUTO_INCREMENT PRIMARY KEY,
    postid INT NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    media_type ENUM('image', 'video') NOT NULL,
    FOREIGN KEY (postid) REFERENCES posts(postid) ON DELETE CASCADE
);
SELECT * FROM media;


/*Stories table*/
CREATE TABLE stories (
    storyid INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

SELECT * FROM stories;

/*Direct Messages table*/
CREATE TABLE direct_messages (
    messageid INT AUTO_INCREMENT PRIMARY KEY,
    senderid INT NOT NULL,
    receiverid INT NOT NULL,
    message_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (senderid) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiverid) REFERENCES users(user_id) ON DELETE CASCADE
);

SELECT * FROM direct_messages;
