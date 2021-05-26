


CREATE TABLE users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   title VARCHAR(80), 
   generos VARCHAR(80)
); 


CREATE TABLE IF NOT EXISTS ratings (
   userid INT, 
   movieid INT, 
   rating INT, 
   time_stamp BIGINT,
   FOREIGN KEY (userid) REFERENCES users(id),
   FOREIGN KEY (movieid) REFERENCES movies(id)
);


INSERT INTO users (id,genero,edad,ocup,cp) VALUES (7000,'F',25,20,'03100');   

INSERT INTO movies(id,title,generos) VALUES (5000,'Avengers', 'Adventures');

INSERT INTO ratings(userid,movieid,rating,time_stamp) VALUES (1,1193,2,978300760);