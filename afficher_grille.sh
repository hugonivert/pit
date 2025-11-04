#!/bin/bash

fichier="grille.txt"

# Affiche la grille ligne par ligne
while IFS= read -r ligne; do
    echo "$ligne"
done < "$fichier"

