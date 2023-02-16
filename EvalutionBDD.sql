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
        four_id             INT NOT NULL,    
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
        prod_desc             VARCHAR(250) NOT NULL,
        prod_photo            VARCHAR(250),
        Affichage             BIT(1),
        prod_stock_phy        INT NOT NULL,
        prod_stock_alert      INT NOT NULL,
        prod_four             INT NOT NULL,
        prod_rub              INT NOT NULL,

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



