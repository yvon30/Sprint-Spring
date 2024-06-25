#!/bin/bash

# Créer le répertoire de sortie temporaire
mkdir -p "out"

# Copier tous les fichiers .java dans le répertoire de sortie temporaire
find "src" -name "*.java" -exec cp {} "out" \;

# Compiler toutes les classes en spécifiant le classpath
javac -cp "lib/*" -d "out" out/*.java

# Créer le fichier JAR en spécifiant le point d'entrée et en incluant les fichiers compilés
jar cfe "lib/front-controller.jar" mg.itu.prom16.controllers.FrontController -C out .

# Supprimer le répertoire de sortie temporaire
if [ -d "out" ]; then
    rm -rf "out"
fi

# Pause pour garder la fenêtre ouverte (équivalent de 'pause' en .bat)
read -p "Press [Enter] key to continue..."
