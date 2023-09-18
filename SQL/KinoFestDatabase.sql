USE MASTER;

DROP DATABASE KinoFest;

CREATE DATABASE KinoFest;

GO --go to the database
    USE KinoFest;

--create each table in the database
--Directors
CREATE TABLE Directors(
    dir_id int PRIMARY KEY,
    dir_first_name varchar(50) NOT NULL, --We need to know who the director is, otherwise we can't contact them.
    dir_last_name varchar(50) NOT NULL, --We need to know who the director is, otherwise we can't contact them.
    dir_birth_year int
);

--Genre
CREATE TABLE Genre(
    gen_id int IDENTITY(1,1) PRIMARY KEY, --Start at 1 and increment by 1.
    gen_name varchar(60)
);

--Movies
CREATE TABLE Movies(
    mov_id int PRIMARY KEY,
    mov_title varchar(100) NOT NULL, --We must have the title of the movie to know which movie it is.
    mov_duration_min int,
    mov_genre_id int FOREIGN KEY REFERENCES Genre(gen_id), --nothing in the movies should change when a genre changes. A movie can exist in the database without a genre.
    mov_publication_year int
);

--Users
CREATE TABLE Users(
    use_id int PRIMARY KEY,
    use_user_name varchar(50) NOT NULL, --the user name must be set, otherwise the user can't login. we're not making a password, but we probably should.
    use_password varchar(50) NOT NULL, --the password should be encrypte. the user must have a password to their account.
    use_email varchar(50) NOT NULL
);

--Actors
CREATE TABLE Actors(
    act_id int PRIMARY KEY,
    act_first_name varchar(50),
    act_last_name varchar(50),
    act_birth_year int
);

--Shows
CREATE TABLE Shows(
    sho_id int PRIMARY KEY,
    sho_movie_id int FOREIGN KEY REFERENCES Movies(mov_id) ON UPDATE CASCADE, --if the movie is changed, the show should change too
    sho_total_count int
);

--Cinemas
CREATE TABLE Cinemas(
    cin_id int PRIMARY KEY,
    cin_name varchar(30),
    cin_address varchar(100),
);

--Halls
CREATE TABLE Halls(
    hal_id int PRIMARY KEY,
    hal_cinema_id int FOREIGN KEY REFERENCES Cinemas(cin_id) ON DELETE CASCADE, --if the cinema is deleted, it halls should be deleted as well
    hal_total_seats int,
    hal_number int
);

--Seats
CREATE TABLE Seats(
    sea_id int PRIMARY KEY,
    sea_hall_id int FOREIGN KEY REFERENCES Halls(hal_id) ON DELETE CASCADE --if the hall is deleted, its seats should be deleted too.
);

--Tickets
CREATE TABLE Tickets(
    tic_id int PRIMARY KEY,
    tic_show_id int FOREIGN KEY REFERENCES Shows(sho_id) ON UPDATE CASCADE, --if the show is changed, the ticket should be changed too.
    tic_user_id int FOREIGN KEY REFERENCES Users(use_id) ON UPDATE CASCADE, --if the user change their informaiton, that should be reflecte on the ticket.
    tic_seat_id int FOREIGN KEY REFERENCES Seats(sea_id) ON UPDATE CASCADE, --if the seat is changed, that should be reflected on the ticket.
    tic_price float
);

--MovieDirectors
CREATE TABLE MovieDirectors(
    modir_id int PRIMARY KEY,
    modir_director_id int FOREIGN KEY REFERENCES Directors(dir_id) ON DELETE CASCADE, --if the movie director is deleted, the connection between movie and director should be removed.
    modir_movie_id int FOREIGN KEY REFERENCES Movies(mov_id) ON DELETE CASCADE --if the movie is deleted, remove the reference between movie and director.
);

--MovieActors
CREATE TABLE MovieActors(
    moact_id int PRIMARY KEY,
    moact_actor_id int FOREIGN KEY REFERENCES Actors(act_id) ON DELETE CASCADE, --if the actor is deleted, we assume they are still alive, remove the reference between actor and movie.
    moact_movie_id int FOREIGN KEY REFERENCES Movies(mov_id) ON DELETE CASCADE --if the movie is deleted, remove the reference between actor and movie.
);

--ShowsHalls
CREATE TABLE ShowsHalls(
    shoha_id int PRIMARY KEY,
    shoha_show_id int FOREIGN KEY REFERENCES Shows(sho_id) ON DELETE CASCADE, --if the show is deleted, remove the connection between the show and the hall
    shoha_hall_id int FOREIGN KEY REFERENCES Halls(hal_id) ON DELETE CASCADE --if the hall is deleted, we suppose it's not a demolishion going on here, we want to remove the connection between show and hall.
);

--Directors
INSERT INTO
    Directors(
        dir_id,
        dir_first_name,
        dir_last_name,
        dir_birth_year
    )
VALUES
    (1, 'Bram', 'Stoker', 1847),
    (2, 'Peter', 'Jackson', 1961),
    (3, 'Pierre', 'Morel', 1964),
    (4, 'Chad', 'Stahelski', 1968),
    (5, 'John', 'McTiernan', 1951);

--Genre
INSERT INTO
    Genre(gen_id, gen_name)
VALUES
    (1, 'Horror'),
    (2, 'Fantasy'),
    (3, 'Action'),
    (4, 'Thriller'),
    (5, 'Comedy');

--Movies
INSERT INTO
    Movies (
        mov_id,
        mov_title,
        mov_duration_min,
        mov_genre_id,
        mov_publication_year
    )
VALUES
    (1, 'Dracula', 85, 1, 1958),
    (2, 'The Lord of the Rings: The Fellowship of the Ring', 178, 2, 2001),
    (3, 'Taken', 93, 3, 2008),
    (4, 'John Wick', 101, 3, 2014),
    (5, 'The Hunt for Red October', 135, 4, 1990);

--Users
INSERT INTO
    Users (use_id, use_user_name, use_email, use_password)
VALUES
    (1, 'Alice Johnson', 'alice@example.com', 'GoatInTheNose!123'),
    (2, 'Bob Smith', 'bob@example.com', 'PorkInTheEar@123'),
    (3, 'Emily Davis', 'emily@example.com', 'SmurfOnTheHouse?321'),
    (4, 'Michael Brown', 'michael@example.com', 'ToddlersOnTheCar!123'),
    (5, 'Sophia Wilson', 'sophia@example.com', 'MushroomsFromTheEyes?123');

--Actors
INSERT INTO
    Actors(
        act_id,
        act_first_name,
        act_last_name,
        act_birth_year
    )
VALUES
    (1, 'Christopher', 'Lee', 1922),
    (2, 'Viggo', 'Mortensen', 1958),
    (3, 'Liam', 'Neeson', 1952),
    (4, 'Keanu', 'Reeves', 1964),
    (5, 'Sean', 'Connery', 1930);

--Shows
INSERT INTO
    Shows(sho_id, sho_movie_id, sho_total_count)
VALUES
    (1, 1, 5),
    (2, 2, 3),
    (3, 3, 4),
    (4, 4, 6),
    (5, 5, 7);

--Cinemas
INSERT INTO
    Cinemas(cin_id, cin_name, cin_address)
VALUES
    (1, 'Copenhagen Cineplex', '123 Storgade, Copenhagen'),
    (2, 'Aarhus Cineworld', '456 Langgade, Aarhus'),
    (3, 'Odense Film Palace', '789 Hovedvej, Odense'),
    (4, 'Esbjerg Movie House', '101 Strandvej, Esbjerg'),
    (5, 'Aalborg ScreenCity', '555 Pladsen, Aalborg');

--Halls
INSERT INTO
    Halls (
        hal_id,
        hal_cinema_id,
        hal_total_seats,
        hal_number
    )
VALUES
    (1, 1, 100, 1),
    (2, 1, 85, 2),
    (3, 2, 120, 1),
    (4, 2, 110, 2),
    (5, 3, 90, 1),
    (6, 3, 80, 2),
    (7, 4, 75, 1),
    (8, 4, 70, 2),
    (9, 5, 150, 1),
    (10, 5, 140, 2);

--Seats
INSERT INTO
    Seats(sea_id, sea_hall_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3);

--Tickets
INSERT INTO
    Tickets(
        tic_id,
        tic_show_id,
        tic_user_id,
        tic_seat_id,
        tic_price
    )
VALUES
    (1, 1, 1, 1, 100),
    (2, 2, 2, 2, 125),
    (3, 3, 3, 3, 175),
    (4, 4, 4, 4, 110),
    (5, 5, 5, 5, 150);

--MovieDirectors
INSERT INTO
    MovieDirectors(modir_id, modir_director_id, modir_movie_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

--MovieActors
INSERT INTO
    MovieActors(moact_id, moact_actor_id, moact_movie_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);

--ShowsHalls
INSERT INTO
    ShowsHalls(shoha_id, shoha_show_id, shoha_hall_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);