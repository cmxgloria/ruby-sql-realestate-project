CREATE DATABASE realestate_app;

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  image_url VARCHAR(500),
  price INTEGER,
  address VARCHAR(200)
);

INSERT INTO houses(name, image_url, price, address)
VALUES ('Macleod','https://i2.au.reastatic.net/800x600/3ee52706a4d1f2621d9f2132de78aa3a2058051622f0a86dca033a28b337fc92/image.jpg',1400000,'83 Gresswell Road Macleod Vic 3085');

INSERT INTO houses(name, image_url, price, address)
VALUES ('Toorak','https://i2.au.reastatic.net/800x600/29e266f520d4acf9b806d8e53d5425ee2c9bf14253071034b0b9333e31297569/image.jpg',2900000,'1 Denham Place Toorak Vic 3142');

INSERT INTO houses(name, image_url, price, address)
VALUES ('Brighton','https://i2.au.reastatic.net/1110x535/21b344c73af11e238bb53a052dbf751763f23a5691c3c1ef04f7914e3bb9576a/image.jpg',2400000,'81 Bay Street Brighton Vic 3186');

INSERT INTO houses(name, image_url, price, address)
VALUES ('Footscray','https://i2.au.reastatic.net/800x600/b2112f7f811d1f66b3c2a9c333108803ecd475219eb5b4d79319256d06a3d371/image.jpg',790000,'6 Souter Crescent Footscray Vic 3011');

CREATE TABLE users (
id SERIAL PRIMARY KEY,
  email VARCHAR(300),
  password_digest VARCHAR(400)
);


ALTER TABLE houses ADD COLUMN user_id INTEGER;

ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE houses ADD CONSTRAINT user_id_fk FOREIGN KEY(user_id) REFERENCES users (id) ON DELETE CASCADE;
