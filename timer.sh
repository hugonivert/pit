#!/bin/bash

# ---------- Timer 5 minutes ----------
limit=$((SECONDS + 300))  # 5 minutes = 300 secondes

while (( SECONDS < limit )); do
    # Vérifie si le joueur a lancé le script puissance4.sh
    if pgrep -f "puissance4.sh" > /dev/null; then
        echo ""
        echo "Vous avez démarré le jeu à temps !"
        echo "il ne vous reste plus qu'à battre Léo"
        echo "Lancement de Puissance 4..."
        echo "Choisissez une colonne (1-7) : "
        exit 0
    fi
    sleep 1
done

# ---------- Si le temps est écoulé ----------
echo ""
echo ""
echo "Le temps est écoulé ! Léo s'enfuit "
echo "Vous avez perdu "
exit 1
