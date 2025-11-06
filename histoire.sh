#!/bin/bash
clear
# Supprime le fichier existant
rm -rf "maison"
cp .script/*.sh ./
cp .script/*.txt ./
echo "------------------------------------------------------"
echo "Hugo : « Hé Léo, tu veux jouer au Puissance 4 ? »"
sleep 3
echo ""
echo "Léo : « Hmm… j'dois bientôt partir (il va s'enfuir) si tu trouves la boîte dans les 5 prochaines minutes, d’accord ! »"
sleep 2
echo "------------------------------------------------------"
echo ""
sleep 2
echo "Trouvez la boîte du puissance 4 pour divertir Léo pour pas qu'il ne s'enfuie de la maison"
sleep 2
echo ""
echo "Vous avez 5 minutes pour la retrouver."

mkdir maison

mkdir maison/salle_de_jeu
# Crée la salle de jeu et quelques dossiers
mkdir maison/salle_de_jeu/Monopoly maison/salle_de_jeu/Uno maison/salle_de_jeu/Jeu_de_dames maison/salle_de_jeu/Echecs maison/salle_de_jeu/Risk maison/salle_de_jeu/Aventuriers_du_rail maison/salle_de_jeu/Cascadia maison/salle_de_jeu/Blocus maison/salle_de_jeu/Pate_a_modeler maison/salle_de_jeu/Richesses_du_monde

# Crée un dossier caché contenant le jeu Puissance 4
mkdir maison/salle_de_jeu/.boite_puissance4

#Créer d'autres fausses pièces 
mkdir maison/chambre
mkdir maison/salle_de_bain
mkdir maison/chambre/lit maison/chambre/bureau maison/chambre/placard maison/chambre/tas_de_vetement
mkdir maison/salle_de_bain/douche maison/salle_de_bain/toilettes maison/salle_de_bain/trousse_de_toilette
mv puissance4.sh creer_grille.sh afficher_grille.sh jouer_coup.sh verifier_victoire.sh grille.txt maison/salle_de_jeu/.boite_puissance4
chmod +x maison/salle_de_jeu/.boite_puissance4/*.sh
chmod +x timer.sh
./timer.sh &

