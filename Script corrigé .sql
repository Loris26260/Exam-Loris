LDROP TABLE IF EXISTS Produit_Approvisionne;DROP TABLE IF EXISTS Prix_Fabrique;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Fournisseur_Produit;
DROP TABLE IF EXISTS Fournisseur;
DROP TABLE IF EXISTS Commande_Produit;
DROP TABLE IF EXISTS Fournit;
DROP TABLE IF EXISTS Comprend;
CREATE TABLE Produit_Approvisionne (
    RefProduitA_Produit_Approvisionne BIGINT AUTO_INCREMENT NOT NULL,
    PrixAchatMoy_Produit_Approvisionne BIGINT,
    PRIMARY KEY (RefProduitA_Produit_Approvisionne)
) ENGINE=InnoDB;
CREATE TABLE Prix_Fabrique (
    RefProduitF_Prix_Fabrique BIGINT AUTO_INCREMENT NOT NULL,
    Heure_MainOeuvre_Prix_Fabrique BIGINT,
    PRIMARY KEY (RefProduitF_Prix_Fabrique)
) ENGINE=InnoDB;
CREATE TABLE Produit (
    RefProduit_Produit BIGINT AUTO_INCREMENT NOT NULL,
    Libelle_Produit CHAR(50),
    PrixHT_Produit BIGINT,
    Description_Produit CHAR(255),
    RefProduitA_Produit_Approvisionne BIGINT,
    RefProduitF_Prix_Fabrique BIGINT,
    PRIMARY KEY (RefProduit_Produit),
  FOREIGN KEY (RefProduitA_Produit_Approvisionne) REFERENCES Produit_Approvisionne(RefProduitA_Produit_Approvisionne),
    FOREIGN KEY (RefProduitF_Prix_Fabrique) REFERENCES Prix_Fabrique(RefProduitF_Prix_Fabrique)
) ENGINE=InnoDB;
CREATE TABLE Commande (
    NumCommande_Commande BIGINT AUTO_INCREMENT NOT NULL,
    DateCommande_Commande DATE,
    PRIMARY KEY (NumCommande_Commande)
) ENGINE=InnoDB;
CREATE TABLE Fournisseur_Produit (
    Id_Fournisseur_Prod_Fournisseur BIGINT AUTO_INCREMENT NOT NULL,
    RefProduit_Fournisseur BIGINT,
    Prix_Catalogue_Fournisseur_Produit BIGINT,
    PRIMARY KEY (Id_Fournisseur_Prod_Fournisseur)
) ENGINE=InnoDB;
CREATE TABLE Fournisseur (
    Id_Fournisseur_Fournisseur BIGINT AUTO_INCREMENT NOT NULL,
    NomFournisseur_Fournisseur CHAR(50),
    Adresse_Fournisseur CHAR(100),
    Autres_Details_Fournisseur CHAR(100),
    PRIMARY KEY (Id_Fournisseur_Fournisseur)
) ENGINE=InnoDB;
CREATE TABLE Commande_Produit (
    NumCommande_Prod_Commande_Produit BIGINT AUTO_INCREMENT NOT NULL,
    RefProduit_Commande_Produit BIGINT,
    Quantite_Commande_Produit BIGINT,
    Date_Prevue_Livraison_Commande_Produit DATE,
    Prix_Achat_Commande_Produit BIGINT,
    PRIMARY KEY (NumCommande_Prod_Commande_Produit),
    FOREIGN KEY (RefProduit_Commande_Produit) REFERENCES Produit(RefProduit_Produit)
) ENGINE=InnoDB;
CREATE TABLE Fournit (
    RefProduit_Produit BIGINT NOT NULL,
    Id_Fournisseur_Fournisseur BIGINT NOT NULL,
    Quantite_Fournit BIGINT,
    PRIMARY KEY (RefProduit_Produit, Id_Fournisseur_Fournisseur),
    FOREIGN KEY (RefProduit_Produit) REFERENCES Produit(RefProduit_Produit),
    FOREIGN KEY (Id_Fournisseur_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur_Fournisseur)
) ENGINE=InnoDB;
CREATE TABLE Comprend (
    RefProduit_Produit BIGINT NOT NULL,
    NumCommande_Commande BIGINT NOT NULL,
    Quantite_Comprend BIGINT,
    PRIMARY KEY (RefProduit_Produit, NumCommande_Commande),
    FOREIGN KEY (RefProduit_Produit) REFERENCES Produit(RefProduit_Produit),
    FOREIGN KEY (NumCommande_Commande) REFERENCES Commande(NumCommande_Commande)
) ENGINE=InnoDB;
