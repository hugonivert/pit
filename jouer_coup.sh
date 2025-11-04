#!/bin/bash

fichier="grille.txt"
joueur=$1   # "X" ou "O"

# Demander une colonne valide
while true; do
    read -p "Joueur $joueur, choisissez une colonne (1-7) : " col
    if ! [[ $col =~ ^[1-7]$ ]]; then
        echo ""
        echo "Colonne invalide !"
        echo ""
        continue
    fi
    break
done

# Convertir en index 0-6
col=$((col - 1))

# Lire la grille dans un tableau temporaire
mapfile -t lignes < "$fichier"

# Trouver la première ligne vide de cette colonne (partir du bas)
placed=false
for ((i=${#lignes[@]}-2; i>=0; i-=2)); do
    ligne="${lignes[i]}"
    # Remplacer le caractère de la colonne par le jeton si vide
    pos=$((col*2 + 1))   # chaque colonne prend "| " donc index = col*2+1
    if [[ "${ligne:$pos:1}" == " " ]]; then
        ligne="${ligne:0:$pos}$joueur${ligne:$((pos+1))}"
        lignes[i]="$ligne"
        placed=true
        break
    fi
done

if ! $placed; then
    echo ""
    echo "Colonne pleine ! Choisissez-en une autre."
    echo ""
    exit 1
fi

# Réécrire la grille dans le fichier
printf "%s\n" "${lignes[@]}" > "$fichier"

