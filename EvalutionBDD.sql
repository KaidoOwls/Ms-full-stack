DROP DATABASE IF EXISTS BDD;

CREATE DATABASE BDD;

USE BDD;

CREATE TABLE client(
        cli_id      INT NOT NULL AUTO_INCREMENT,
        Type        BIT(1),
        cli_nom     VARCHAR(50) NOT NULL,
        cli_prenom  VARCHAR(50) NOT NULL,
        cli_adresse VARCHAR(100),
        cli_cp      CHAR(5),
        cli_ville   VARCHAR(50),
        cli_tel     VARCHAR(10),
        cli_mail    VARCHAR(50),
        PRIMARY KEY (cli_id)

);

CREATE TABLE commande(
        com_id          INT NOT NULL AUTO_INCREMENT,
        com_date        DATE NOT NULL,
        com_livraison   DATE NOT NULL,
        com_etat        VARCHAR(25),
        editionfacture  BIT(1),
        com_client      INT NOT NULL,
        PRIMARY KEY (com_id),
        FOREIGN KEY (com_client) REFERENCES client (cli_id)

);

CREATE TABLE panier(
        pan_qte             INT NOT NULL,    
        pan_prix_par        FLOAT NOT NULL,
        pan_prix_pro        FLOAT NOT NULL,
        pan_prod            CHAR(6),
        pan_com             INT NOT NULL ,
    
        
        PRIMARY KEY (pan_prod,pan_com),
        FOREIGN KEY (pan_com) REFERENCES commande (com_id)

);

CREATE TABLE fournisseur(
        four_id             INT AUTO_INCREMENT,    
        four_nom            VARCHAR(50) NOT NULL,
        four_adresse        VARCHAR(100) NOT NULL,
        four_cp             CHAR(5),
        four_ville          VARCHAR(50) NOT NULL ,
        four_tel            VARCHAR(10),
        four_mail           VARCHAR(50),
        Type                BIT(1),      
    
        
        PRIMARY KEY (four_id)
);

CREATE TABLE rubrique(
        rub_id             INT NOT NULL,    
        rub_lib            VARCHAR(50) NOT NULL,

        PRIMARY KEY (rub_id)
);

CREATE TABLE produit(
        prod_code             CHAR(6),    
        prod_lib              VARCHAR(100) NOT NULL,
        prod_desc             VARCHAR(250),
        prod_photo            VARCHAR(250),
        affichage             BIT(1),
        prod_prix             INT NOT NULL,
        prod_stock_phy        INT NOT NULL,
        prod_stock_alert      INT NOT NULL,
        prod_four             INT,
        prod_rub              INT,

        PRIMARY KEY (prod_code),
        FOREIGN KEY (prod_four) REFERENCES fournisseur (four_id),
        FOREIGN KEY (prod_rub)  REFERENCES rubrique (rub_id)

);

ALTER TABLE panier
ADD FOREIGN KEY (pan_prod) REFERENCES produit (prod_code);

CREATE INDEX index_client_nom 
on client (cli_nom);

CREATE INDEX index_commande_date
on commande (com_date);

INSERT INTO client (cli_nom, cli_prenom, cli_adresse, cli_cp, cli_ville)
VALUES
('Fleur', 'Diouf', '108, avenue Jeanne Hachette', 60000, 'Beauvais'),
('Cury', 'Stephen', '1, rue Julie Maurice', 54460, 'LIVERDUN'),
('Jacquard', 'Jean-Charles', '83, avenue Gérard Payet', 59299, 'BOESCHEPE'),
('Vannier', 'Raymond', '51, rue Corinne Lacombe', 70200, 'ANDORNAY'),
('Malet', 'Abeau', '6, boulevard Thibault Hebert', 02160, 'MEURIVAL'),
('Bossuet', 'Abeau', '6, impasse Lambert', 26170, 'PROPIAC'),
('Ménétries', 'Abeau', '1, chemin Paris', 47470, 'CAUZAC'),
('Baugé', 'Abeau', '53, chemin de Grondin', 67580, 'FORSTHEIM'),
('Cormier', 'Abeau', '88, rue Lelievre', 63320, 'VERRIERES'),
('Crépin', 'Abeau', '37, place Hamel', 78930, 'GUERVILLE');

INSERT INTO fournisseur (four_nom, four_adresse, four_cp, four_ville)
VALUES
('Valeo','95, avenue Toussaint Chien', 26170, 'PROPIAC'),
('HyperU','11, rue Julien Maurices', 47470, 'CAUZAC'),
('Lamoule','8, avenue Gérard Petin', 67580, 'FORSTHEIM'),
('TapisVolant','55, rue Corinne Labombe', 63320, 'VERRIERES'),
('MosaiquePizza','66, boulevard Stephane Duchet', 78930, 'GUERVILLE');

INSERT INTO produit (prod_code, prod_lib, prod_prix, prod_stock_phy, prod_stock_alert)
VALUES
('AB8756', 'Chips', 5, 500, 250),
('AB8654', 'Lait', 2, 350, 150),
('AB8759', 'Farine', 1, 350, 250),
('AB8757', 'Fromage', 6, 350, 150),
('AB8753', 'Pomme', 2, 550, 300),
('AB8751', 'Carte', 5, 50, 25),
('AB8745', 'Chien', 150, 30, 15),
('AB8796', 'Banane', 1, 500, 250),
('AB8778', 'Chat', 500, 50, 25),
('AC8736', 'Peluche', 35, 50, 25),
('AB8766', 'Ortie', 3, 5000, 2500),
('AD8788', 'Sanglier', 66, 50, 25),
('AB8733', 'Peau', 8, 500, 250),
('AB8744', 'Miroir', 22, 50, 25),
('AB8755', 'Artichaut', 3, 500, 250),
('AB8854', 'Miel', 5, 5000, 2500),
('AB8164', 'Fourchette', 4,  500, 205),
('CB8349', 'Couteau', 4, 500, 205),
('AB8789', 'Asiette', 6, 500, 205),
('AB8436', 'Kiwi', 1, 500, 205);

INSERT INTO commande (com_date ,com_livraison, com_client)
VALUES
('2022-06-17', '2022-06-24',1),
('2022-06-18', '2022-06-23',2),
('2022-10-11', '2022-10-18',3),
('2022-06-19', '2022-06-25',4),
('2022-09-22', '2022-09-28',5),
('2022-09-22', '2022-09-26',6),
('2022-06-18', '2022-06-28',7),
('2022-06-17', '2022-06-27',8),
('2022-06-12', '2022-06-22',9),
('2022-05-13', '2022-05-23',10);

INSERT INTO panier (pan_qte ,pan_prix_par ,pan_prix_pro, pan_prod, pan_com )
VALUES
(75, '55', '25','AB8654',1),
( 55, '55', '25','AB8745',2),
( 57, '55', '25','AC8736',3),
( 65, '55', '25','AB8755',4),
(59, '55', '25','AB8164',5),
( 54, '55', '25','AB8164',6),
(56, '55', '25','CB8349',7),
( 52, '55', '25','AB8789',8),
(45, '55', '25','AB8436',9),
(51, '55', '25','AB8778',10);

DROP USER IF EXISTS 'gestionnaire'@'%'; 
DROP USER IF EXISTS 'approvisionneur'@'%'; 
DROP USER IF EXISTS 'administrateur'@'%'; 

CREATE USER 'gestionnaire'@'%' IDENTIFIED BY '0000';
GRANT SELECT  
ON BDD.produit
TO 'gestionnaire'@'%';
GRANT SELECT  
ON BDD.commande 
TO 'gestionnaire'@'%';
GRANT SELECT  
ON BDD.client
TO 'gestionnaire'@'%';
GRANT SELECT  
ON BDD.panier
TO 'gestionnaire'@'%';
FLUSH PRIVILEGES;

CREATE USER 'approvisionneur'@'%' IDENTIFIED BY '0000';
GRANT SELECT, INSERT
ON BDD.produit
TO 'approvisionneur'@'%';
GRANT SELECT
ON BDD.fournisseur
TO 'approvisionneur'@'%';
FLUSH PRIVILEGES;

CREATE USER 'administrateur'@'%' IDENTIFIED BY '0000';
GRANT ALL PRIVILEGES  
ON BDD.*       
TO 'administrateur'@'%';  
FLUSH PRIVILEGES;
