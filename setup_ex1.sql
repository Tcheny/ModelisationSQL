CREATE TABLE lists
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (255),
    PRIMARY KEY (id)
);

INSERT INTO lists(name) VALUES ('Backlogs'),('A faire'), ('En cours'), ('Fait');

CREATE TABLE cards(
    id INT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    list_id INT,
    PRIMARY KEY (id), FOREIGN KEY(list_id) REFERENCES lists(id) ON DELETE SET NULL, INDEX (list_id)
);

INSERT INTO cards(name, list_id) VALUES
    ('Faire une requête SQL', 4),
    ('Faire une appli NodeJS', 2),
    ('Connecter l''appli à la BDD', 1),
    ('Créer des routes d''API', 2),
    ('Uiliser un ORM sur une base rationnelle', 1),
    ('Utiliser un ORM sur une base non-relationnelle', 4),
    ('Créer une web app pour interroger l''API', 2),
    ('Créer une relation one to many', 3),
    ('Créer une relation many to many', 3);

INSERT INTO users(lastname, firstname) VALUES
    ('Bajat', 'Jovana'),
    ('Be','Eugenie'),
    ('Belferoum', 'Nassim'),
    ('Chable','Stanislas'),
    ('Chekroun', 'Michael'),
    ('Cohen','Benjamin'),
    ('Coudoumie', 'Axel'),
    ('Drame', 'Boubacar'),
    ('El Bakkal','Amelle'),
    ('Endeki','Geoffrey'),
    ('Hattou','Faissal'),
    ('Heinis','Steve');

CREATE TABLE users_cards(
    user_id INT,
    card_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, card_id), INDEX (user_id), INDEX (card_id)
);

INSERT INTO users_cards(user_id, card_id) VALUES
    (1,1),
    (1,9),
    (2,2),
    (2,4),
    (2,7),
    (2,9),
    (3,1),
    (3,3),
    (3,8),
    (4,1),
    (4,6),
    (5,8),
    (5,3),
    (5,4),
    (5,1),
    (6,7),
    (7,7),
    (8,6),
    (8,5),
    (9,4),
    (9,3),
    (10,3),
    (11,2),
    (11,1),
    (12,8);
CREATE TABLE lists
(
    id INT NOT NULL
    AUTO_INCREMENT,
    name VARCHAR
    (255),
    PRIMARY KEY
    (id)
);

    INSERT INTO lists
        (name)
    VALUES
        ('Backlogs'),
        ('A faire'),
        ('En cours'),
        ('Fait');

CREATE TABLE cards(
    id INT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    list_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(list_id) REFERENCES lists(id) ON DELETE SET NULL,
    INDEX (list_id)
);

INSERT INTO cards(name, list_id) VALUES
    ('Faire une requête SQL', 4),
    ('Faire une appli NodeJS', 2),
    ('Connecter l''appli à la BDD', 1),
    ('Créer des routes d''API', 2),
    ('Uiliser un ORM sur une base rationnelle', 1),
    ('Utiliser un ORM sur une base non-relationnelle', 4),
    ('Créer une web app pour interroger l''API', 2),
    ('Créer une relation one to many', 3),
    ('Créer une relation many to many', 3)

INSERT INTO users(lastname, firstname) VALUES
    ('Bajat', 'Jovana'),
    ('Be','Eugenie'),
    ('Belferoum', 'Nassim'),
    ('Chable','Stanislas'),
    ('Chekroun', 'Michael'),
    ('Cohen','Benjamin'),
    ('Coudoumie', 'Axel'),
    ('Drame', 'Boubacar'),
    ('El Bakkal','Amelle'),
    ('Endeki','Geoffrey'),
    ('Hattou','Faissal'),
    ('Heinis','Steve');

CREATE TABLE users_cards(
    user_id INT,
    card_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, card_id), INDEX (user_id), INDEX (card_id)
);

INSERT INTO users_cards(user_id, card_id) VALUES
    (1,1),
    (1,9),
    (2,2),
    (2,4),
    (2,7),
    (2,9),
    (3,1),
    (3,3),
    (3,8),
    (4,1),
    (4,6),
    (5,8),
    (5,3),
    (5,4),
    (5,1),
    (6,7),
    (7,7),
    (8,6),
    (8,5),
    (9,4),
    (9,3),
    (10,3),
    (11,2),
    (11,1),
    (12,8);
