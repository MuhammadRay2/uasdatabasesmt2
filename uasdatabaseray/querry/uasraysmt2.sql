CREATE DATABASE uasraysmt2;
USE uasraysmt2uasraysmt2;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255), -- Panjang hash sandi dapat disesuaikan
    role ENUM('Admin', 'User')
);

-- Insert minimal 3 data pengguna
INSERT INTO users (username, password, role) VALUES
('ray', 'ray0202', 'Admin'),
('putra', 'ptr225', 'User'),
('purnawan', 'purn05', 'User');

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data profil pengguna
INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Ray Putra', '2005-02-02', '..'),
(2, 'Jack', '2004-05-23', 'nothing.'),
(3, 'Jo', '2004-02-12', 'day after day.');

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data postingan
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Hi, masih belajar', 'daboy.'),
(2, 'nyore bos', 'ambil risiko atau kehilangan kesempatan.'),
(3, 'sebatbut', 'dia yang berani bebas.');

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(1000),
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data komentar
INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 2, 'simple banget.'),
(1, 3, 'kelas bro.'),
(2, 1, 'menyala.');

SELECT u.username, p.full_name, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;

