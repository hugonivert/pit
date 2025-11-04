#!/bin/bash

fichier="grille.txt"

# Supprime le fichier existant
rm -f "$fichier"

rows=6
cols=7

for ((i=0; i<rows; i++)); do
    # Ligne vide avec des | |
    ligne=""
    for ((j=0; j<cols; j++)); do
        ligne+="| "
    done
    ligne+="|" 
    echo "$ligne" >> "$fichier"

    # Ligne de séparation
    sep=""
    for ((j=0; j<cols; j++)); do
        sep+="+-"
    done
    sep+="+"
    echo "$sep" >> "$fichier"
done

echo "Grille créée dans $fichier"

