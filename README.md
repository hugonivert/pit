# Jeu en Bash : Puissance 4

## 🧩 Description
Ce projet est un petit **jeu de Puissance 4 directement dans la commande interactivement**, entièrement codé en **Bash**.  
Il permet de jouer à deux joueurs l'un contre l'autre au puissance 4 classique

Le jeu s’appuie sur un fichier `grille.txt` pour stocker l’état de la grille entre les tours.

---

## ⚙️ Fichiers

| Fichier | Rôle |
|----------|------|
| `puissance4.sh` | Script global, qui lance la partie de puissance 4 et utilise les scripts suivants. |
| `creer_grille.sh` | Crée une nouvelle grille vide (6 lignes × 7 colonnes) dans `grille.txt`. |
| `afficher_grille.sh` | Affiche la grille actuelle ligne par ligne. |
| `jouer_coup.sh` | Permet à un joueur (`X` ou `O`) de jouer un coup dans une colonne. |
| `verification_grille.sh` | Vérifie à chaque appel si 4 symboles identiques sont alignés (horizontalement, verticalement, diagonalement). |

---

## 🚀 Utilisation

> ⚠️ **Attention :**
> Avant de lancer les scripts, vous devez vous donner les droits d’exécution :
> ```bash
> chmod +x *.sh
> ```


### 1. Lancer une partie
```bash
bash puissance4.sh
```

### 2. Créer une grille
```bash
bash creer_grille.sh
```
### 3. Jouer un coup X ou O
```bash
bash jouer_coup.sh X
```
ou
```bash
bash jouer_coup.sh O
```
### 4. Afficher la grille actuelle
```bash
bash afficher_grille.sh
```
### 5. Vérifier si un des joueurs a gagné (4 symboles alignés)
```bash
bash verification_grille.sh
```
