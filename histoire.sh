#!/bin/bash
clear

echo "------------------------------------------------------"
echo "👦 Vous : « Hé Léo, tu veux jouer au Puissance 4 ? »"
sleep 2
echo "👨‍🦱 Léo : « Hmm… j'dois bientôt partir/m'enfuir si tu trouves la boîte dans les 5 prochaines minutes, d’accord ! »"
sleep 2
echo "------------------------------------------------------"
echo ""
sleep 2
echo "Trouvez la boîte du puissance 4 pour divertir Léo pour pas qu'il ne s'enfuisse de la maison"
sleep 2
echo ""
echo "Vous avez 5 minutes pour la retrouver."


mkdir maison
# Crée la salle de jeu et quelques dossiers
mkdir -p maison/salle_de_jeu/{Monopoly, Uno, Jeu_de_dames, Echecs, Risk, Aventuriers_du_rail, Cascadia, Blocus, Pate_a_modeler, Richesses_du_monde}

# Crée un dossier caché contenant le jeu Puissance 4
mkdir maison/salle_de_jeu/.boite_puissance4

#Créer d'autres fausses pièces 
mkdir -p maison/chambre/{lit, bureau, placard, tas_de_vetement}
mkdir -p maison/salle_de_bain/{douche, toilettes, trousse_de_toilette}



# ---------- Timer 5 minutes ----------
limit=$((SECONDS + 300))  # 5 minutes = 300 secondes

while (( SECONDS < limit )); do
    # Vérifie si le joueur a lancé le script puissance4.sh
    if pgrep -f "puissance4.sh" > /dev/null; then
        echo ""
        echo "Vous avez démarré le jeu à temps !"
        echo "Lancement de Puissance 4..."
        # On lance le vrai script
        bash "$MAISON_DIR/$BOITE/puissance4.sh"
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
