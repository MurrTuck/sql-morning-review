DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS user_information;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS group_members,
DROP TABLE IF EXISTS group_posts;


CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, 
    username VARCHAR(500), 
    password VARCHAR(3000)
);

-- Using the foreign key with the user_id

CREATE TABLE user_information (
    user_id INTEGER REFERENCES users(user_id)
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    profile_pic VARCHAR(3000),
    birthday DATE
);


CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(3000),
    organizer INTEGER REFERENCES users(user_id),
    creation_date DATE
);


SELECT * FROM users.user_id, groups.group_id, groups.creation_date
INTO group_members
FROM users
JOIN groups ON users.user_id = groups.group_id;

-- SELECT * FROM group_members

CREATE TABLE user_posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    title VARCHAR(100),
    text VARCHAR(3000),
    date DATE
);

CREATE TABLE group_posts (
    id SERIAL PRIMARY KEY,
    group_id INTEGER REFERENCES groups(group_id)
    title VARCHAR(100),
    TEXT VARCHAR(3000),
    date DATE
);

CREATE TABLE user_posts_comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    post_id INTEGER REFERENCES user_posts(id),
    title VARCHAR(100),
    text VARCHAR(3000),
    date DATE
);

CREATE TABLE group_posts_comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    posts_id INTEGER REFERENCES group_posts(id),
    title VARCHAR(100),
    text VARCHAR(3000),
    data DATE
);

CREATE TABLE friends (
    user_id INTEGER REFERENCES users(user_id),
    friend_id INTEGER REFERENCES users(user_id),
    accpted BOOLEAN
);