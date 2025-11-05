#!/bin/bash

fichier="grille.txt"
joueur=$1   # "X" ou "O"

# Lire la grille dans un tableau
mapfile -t lignes < "$fichier"

# Filtrer uniquement les lignes de jetons (ignorer les lignes de séparation)
jeton_lignes=()
for ((i=0; i<${#lignes[@]}; i+=2)); do
    jeton_lignes+=("${lignes[i]}")
done

rows=${#jeton_lignes[@]}
cols=7   # nombre de colonnes

# Fonction pour récupérer le caractère d'une case
get_case() {
    local ligne=$1
    local col=$2
    echo "${jeton_lignes[ligne]:$((col*2 + 1)):1}"
}

# Vérifier horizontalement
for ((i=0; i<rows; i++)); do
    count=0
    for ((j=0; j<cols; j++)); do
        if [[ "$(get_case $i $j)" == "$joueur" ]]; then
            ((count++))
            if ((count == 4)); then
                exit 1  # joueur gagne
            fi
        else
            count=0
        fi
    done
done

# Vérifier verticalement
for ((j=0; j<cols; j++)); do
    count=0
    for ((i=0; i<rows; i++)); do
        if [[ "$(get_case $i $j)" == "$joueur" ]]; then
            ((count++))
            if ((count == 4)); then
                exit 1
            fi
        else
            count=0
        fi
    done
done

# Vérifier diagonale montante (↗)
for ((i=0; i<=rows-4; i++)); do
    for ((j=0; j<=cols-4; j++)); do
        if [[ "$(get_case $i $j)" == "$joueur" && \
              "$(get_case $((i+1)) $((j+1)))" == "$joueur" && \
              "$(get_case $((i+2)) $((j+2)))" == "$joueur" && \
              "$(get_case $((i+3)) $((j+3)))" == "$joueur" ]]; then
            exit 1
        fi
    done
done

# Vérifier diagonale descendante (↘)
for ((i=3; i<rows; i++)); do
    for ((j=0; j<=cols-4; j++)); do
        if [[ "$(get_case $i $j)" == "$joueur" && \
              "$(get_case $((i-1)) $((j+1)))" == "$joueur" && \
              "$(get_case $((i-2)) $((j+2)))" == "$joueur" && \
              "$(get_case $((i-3)) $((j+3)))" == "$joueur" ]]; then
            exit 1
        fi
    done
done

# Personne n'a gagné
exit 0

