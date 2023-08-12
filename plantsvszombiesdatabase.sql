-- Creacion de la base de datos
CREATE DATABASE plantsvszombiesdatabase;

-- Creacion de las tablas 
CREATE TABLE map(
    id serial PRIMARY KEY,
    name varchar(50),
    photo  varchar(50),
    columns int,
    rows int,
    flowerPot boolean
);

CREATE TABLE zombietype(
id serial PRIMARY KEY,
name varchar(50),
hability varchar(50)
);

CREATE TABLE planttype(
id serial PRIMARY KEY,
name varchar(50),
shootmode varchar(50)
);

CREATE TABLE plant(
id serial PRIMARY KEY,
name varchar(50),
photo varchar(50),
type int REFERENCES planttype(id),
healthpoints int,
damage int,
cost int 
);

CREATE TABLE zombie(
id serial PRIMARY KEY,
name varchar(50),
photo varchar(50),
type int REFERENCES zombietype(id),
healthpoints int,
damage int,
spawnprobability int, 
velocity int
);

CREATE TABLE level(
id serial PRIMARY KEY,
name varchar(50),
dificulty int,
map int REFERENCES map(id),
plants int REFERENCES plant(id),
zombies int REFERENCES zombie(id)
);

--Agregamos registros 

INSERT INTO map (name, photo, columns, rows, flowerPot)
VALUES
    ('Mapa Jardín', 'jardin.jpg', 8, 5, true),
    ('Mapa Ciudad', 'ciudad.png', 10, 6, false),
    ('Mapa Playa', 'playa.jpg', 6, 4, true);

INSERT INTO zombietype (name, hability)
VALUES
    ('Zombi Común', 'Caminan lentamente'),
    ('Zombi Cono', 'Llevan un cono en la cabeza'),
    ('Zombi Balde', 'Llevan un balde en la cabeza'),
    ('Zombi Bailarín', 'Avanza saltando y es más rápido'),
    ('Zombi Escudo', 'Llevan un escudo');

INSERT INTO planttype (name, hability)
VALUES
    ('Girasol', 'Disparo de luz solar'),
    ('Lanzaguisantes', 'Disparo normal'),
    ('Nuez', 'Defensa y recuperación'),
    ('Doble Lanzaguisantes', 'Disparo doble'),
    ('Cactus', 'Disparo de agujas');

INSERT INTO plant(name, photo, type, healthpoints, damage, cost)
VALUES
    ('Zombi Normal', 'zombie_normal.jpg', 1, 100, 20, 70, 1),
    ('Zombi Cono', 'zombie_cone.jpg', 2, 150, 20, 50, 0.8),
    ('Zombi Balde', 'zombie_bucket.jpg', 3, 200, 30, 40, 0.7),
    ('Zombi Bailarín', 'zombie_dancer.jpg', 4, 120, 10, 30, 1.2),
    ('Zombi Escudo', 'zombie_shield.jpg', 5, 180, 25, 20, 0.9);

INSERT INTO zombie (name, photo, type, healthpoints, damage, spawnprobability, velocity)
VALUES
    ('Girasol', 'girazol.jpg', 1, 100, 20, 70, 1),
    ('Lanzaguisantes', 'lanzaguisantes.jpg', 2, 150, 20, 50, 0.8),
    ('Nuez', 'nuez.jpg', 3, 200, 30, 40, 0.7),
    ('Doble Lanzaguizantes', 'doble_lanzaguisantes.jpg', 4, 120, 10, 30, 1.2),
    ('Cactus', 'cactus.jpg', 5, 180, 25, 20, 0.9);

INSERT INTO level (name, dificulty, map, plants, zombies)
VALUES
    ('Nivel 1-1', 1, 1, 1, 1),
    ('Nivel 1-2', 1, 2, 1, 2),
    ('Nivel 1-3', 2, 3, 2, 2),
    ('Nivel 1-4', 2, 1, 2, 3),
    ('Nivel 1-5', 3, 2, 3, 3),
    ('Nivel 1-6', 1, 1, 1, 1),
    ('Nivel 1-7', 1, 2, 1, 2),
    ('Nivel 1-8', 2, 3, 2, 2),
    ('Nivel 1-9', 2, 1, 2, 3),
    ('Nivel 1-10', 3, 2, 3, 3);

