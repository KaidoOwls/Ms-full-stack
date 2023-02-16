DROP DATABASE IF EXISTS exo;

CREATE DATABASE exo;

USE exo;

CREATE TABLE Client(
        cli_num     INT NOT NULL AUTO_INCREMENT,
        cli_nom     VARCHAR(50) NOT NULL,
        cli_adresse VARCHAR(50) NOT NULL,
        cli_tel     VARCHAR(30),
        PRIMARY KEY (cli_num)

);

CREATE TABLE Commande(
        com_num     INT NOT NULL AUTO_INCREMENT,
        cli_num     INT NOT NULL,
        com_date    DATE NOT NULL,
        com_obs     VARCHAR(30),
        PRIMARY KEY (com_num),
        FOREIGN KEY (cli_num) REFERENCES Client (cli_num)
);

CREATE TABLE Produit(
        pro_num     INT NOT NULL AUTO_INCREMENT,
        pro_libelle VARCHAR(50),
        pro_description VARCHAR(100),
        PRIMARY KEY (pro_num)
);

CREATE TABLE Detail(
        com_num     INT NOT NULL ,
        pro_num     INT NOT NULL ,
        det_qte     INT ,
        PRIMARY KEY (com_num,pro_num),
        FOREIGN KEY (com_num) REFERENCES Commande (com_num)
);

-- droits--

CREATE USER 'util1'@'%' IDENTIFIED BY 'mot_de_passe';
GRANT ALL PRIVILEGES             -- accorder tous les privilèges
ON hotel.*              -- sur la BDD nom_de_la_base complète (*)
TO 'util1'@'%';   -- à "utilisateur", connecté depuis "adresse_ip"
FLUSH PRIVILEGES;                -- activer les droits nouvellement affectés

CREATE USER 'util2'@'%' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT 
ON hotel.* 
TO 'util2'@'%';
FLUSH PRIVILEGES;

CREATE USER 'util3'@'%' IDENTIFIED BY 'mot_de_passe';
GRANT SELECT 
ON hotel.station 
TO 'util3'@'%';
FLUSH PRIVILEGES;







