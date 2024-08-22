DROP TABLE IF EXISTS Inscription;
DROP TABLE IF EXISTS Epreuve;
DROP TABLE IF EXISTS Competition;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS amateur;
DROP TABLE IF EXISTS Licencié;
DROP TABLE IF EXISTS Sportif;
DROP TABLE IF EXISTS compose;
DROP TABLE IF EXISTS classe;
DROP TABLE IF EXISTS inscrit;
DROP TABLE IF EXISTS spécialise;

CREATE TABLE Club (
    ID_Club BIGINT AUTO_INCREMENT PRIMARY KEY,
    Nom_Club VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Competition (
    ID_Competition BIGINT AUTO_INCREMENT PRIMARY KEY,
    Nom_Competition VARCHAR(100) NOT NULL,
    Date_Competition DATE NOT NULL,
    Ville_Competition VARCHAR(100) NOT NULL,
    Type_Competition VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Epreuve (
    ID_Épreuve BIGINT AUTO_INCREMENT PRIMARY KEY,
    Type_Épreuve VARCHAR(100) NOT NULL,
    Distance FLOAT NOT NULL,
    Conditions_de_realisation TEXT
) ENGINE=InnoDB;

CREATE TABLE Sportif (
    Numéro_dossard_Sportif BIGINT AUTO_INCREMENT PRIMARY KEY,
    Nom_Sportif VARCHAR(50) NOT NULL,
    Prenom_Sportif VARCHAR(50) NOT NULL,
    Adresse_Sportif VARCHAR(100),
    Téléphone_Sportif VARCHAR(20),
    Fax_Sportif VARCHAR(20),
    E_mail_Sportif VARCHAR(100),
    Type_de_sportif ENUM('Licencié', 'Amateur') NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Licencié (
    Numéro_dossardL_Licencié BIGINT PRIMARY KEY,
    Numéro_License_Licencié VARCHAR(50) NOT NULL,
    ID_Club BIGINT,
    FOREIGN KEY (ID_Club) REFERENCES Club(ID_Club),
    FOREIGN KEY (Numéro_dossardL_Licencié) REFERENCES Sportif(Numéro_dossard_Sportif)
) ENGINE=InnoDB;

CREATE TABLE amateur (
    Numéro_dossard_A_amateur BIGINT PRIMARY KEY,
    Certificat_medical VARCHAR(100) NOT NULL,
    Date_certificat DATE NOT NULL,
    FOREIGN KEY (Numéro_dossard_A_amateur) REFERENCES Sportif(Numéro_dossard_Sportif)
) ENGINE=InnoDB;

CREATE TABLE Inscription (
    ID_Inscription BIGINT AUTO_INCREMENT PRIMARY KEY,
    Date_inscription DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE inscrit (
    Numéro_dossard_Sportif BIGINT,
    ID_Competition BIGINT,
    ID_Inscription BIGINT,
    PRIMARY KEY (Numéro_dossard_Sportif, ID_Competition, ID_Inscription),
    FOREIGN KEY (Numéro_dossard_Sportif) REFERENCES Sportif(Numéro_dossard_Sportif),
    FOREIGN KEY (ID_Competition) REFERENCES Competition(ID_Competition),
    FOREIGN KEY (ID_Inscription) REFERENCES Inscription(ID_Inscription)
) ENGINE=InnoDB;

CREATE TABLE spécialise (
    Numéro_dossard_Sportif BIGINT,
    Numéro_dossardL_Licencié BIGINT,
    Numéro_dossard_A_amateur BIGINT,
    PRIMARY KEY (Numéro_dossard_Sportif),
    FOREIGN KEY (Numéro_dossard_Sportif) REFERENCES Sportif(Numéro_dossard_Sportif),
    FOREIGN KEY (Numéro_dossardL_Licencié) REFERENCES Licencié(Numéro_dossardL_Licencié),
    FOREIGN KEY (Numéro_dossard_A_amateur) REFERENCES amateur(Numéro_dossard_A_amateur)
) ENGINE=InnoDB;

CREATE TABLE classe (
    ID_Épreuve BIGINT,
    ID_Épreuve_classe BIGINT,
    PRIMARY KEY (ID_Épreuve),
    FOREIGN KEY (ID_Épreuve) REFERENCES Epreuve(ID_Épreuve)
) ENGINE=InnoDB;

CREATE TABLE compose (
    ID_Competition BIGINT,
    ID_Épreuve BIGINT,
    PRIMARY KEY (ID_Competition, ID_Épreuve),
    FOREIGN KEY (ID_Competition) REFERENCES Competition(ID_Competition),
    FOREIGN KEY (ID_Épreuve) REFERENCES Epreuve(ID_Épreuve)
) ENGINE=InnoDB;
