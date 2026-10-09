-- À exécuter une seule fois dans MySQL (phpMyAdmin, MySQL Workbench ou console)
CREATE DATABASE IF NOT EXISTS universite_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Les tables "etudiant" et "filiere" sont créées automatiquement
-- par Hibernate au premier déploiement (hibernate.hbm2ddl.auto = update).
