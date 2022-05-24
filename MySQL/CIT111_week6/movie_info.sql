USE movie;

INSERT INTO actor
(actor_id, first_name, last_name)

VALUES 
(1, "Tom", "Hanks"),
(2, "Tim", "Allen"), 
(3, "Annie", "Potts"), 
(4, "John", "Ratzenberger"),
(5, "Gene", "Kelly"),
(6, "Cyd", "Charisse"),
(7, "Van", "Johnson"),
(8, "Harrison", "Ford"), 
(9, "Carrie", "Fisher"), 
(10, "Mark", "Hamill");


INSERT INTO movie
(movie_id, title, rating, year, studio)

VALUES 
(101, "Toy Story", "G", 1995, "Pixar"),
(102, "Toy Story", "G", 1999, "Pixar"),
(103, "Brigadoone", "G", 1954, "MGM"),
(104, "The Empire Strikes Back", "PG", 1977, "20th Century Fox");


INSERT INTO movie_cast
(movie_id, actor_id)

VALUES
(101, 1),
(101, 2),
(101, 3),
(101, 4),
(102, 1),
(102, 2),
(102, 3),
(102, 4),
(103, 5),
(103, 6),
(103, 7),
(104, 8),
(104, 9),
(104, 10);