
CREATE TABLE auteur (
  id_auteur INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  wikidata_uri VARCHAR(255) NULL
);

CREATE TABLE livre (
  id_livre INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) NOT NULL,
  resume TEXT,
  isbn VARCHAR(20),
  annee INT,
  id_auteur INT,
  FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur)
);

CREATE TABLE theme (
  id_theme INT AUTO_INCREMENT PRIMARY KEY,
  libelle VARCHAR(100) NOT NULL
);

CREATE TABLE livre_theme (
  id_livre INT,
  id_theme INT,
  PRIMARY KEY (id_livre, id_theme),
  FOREIGN KEY (id_livre) REFERENCES livre(id_livre),
  FOREIGN KEY (id_theme) REFERENCES theme(id_theme)
);

CREATE TABLE recherche (
  id_recherche INT AUTO_INCREMENT PRIMARY KEY,
  terme VARCHAR(255) NOT NULL,
  source ENUM('voix','texte') NOT NULL,
  confiance DECIMAL(3,2) NULL,
  date_recherche DATETIME DEFAULT CURRENT_TIMESTAMP
);