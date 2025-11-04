#!/bin/bash
# 1 Créer la grille

./creer_grille.sh
echo ""
./afficher_grille.sh
echo ""

# 2 Boucle principale du jeu
tour=0
while true; do
    # Déterminer le joueur courant
    if (( tour % 2 == 0 )); then
        joueur="X"
    else
        joueur="O"
    fi

    # Appeler le script pour jouer un coup
    ./jouer_coup.sh "$joueur"

    echo ""
    echo "____________________________________________"
    echo ""
    # Afficher la grille après le coup
    ./afficher_grille.sh
    echo ""


    # Vérifier victoire ou match nul 
    ./verifier_victoire.sh "$joueur"
    if [[ $? -eq 1 ]]; then
    	echo "Le joueur $joueur a gagné !"
    	break
    fi
    if (( tour + 1 == 42 )); then
        echo "Match nul ! La grille est pleine."
        break
    fi
    # Passer au tour suivant
    ((tour++))
done
