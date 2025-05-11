# Rapport Projet IGSD - Des momies et des pyramides

## Description du Projet
Ce projet consistait à créer deux modèles 3D dans Processing :
1. **Une pyramide** contenant des labyrinthes empilés.
2. **Une momie** se déplaçant à l'intérieur de la pyramide.

Le projet a été réalisé en binôme, avec une répartition claire des tâches :
- **Inès** : Pyramide, labyrinthes, déplacements, lumières et intégration de la momie.
- **Alix** : Modélisation de la momie et création du sol de sable autour de la pyramide.

---

## Fonctionnalités Implémentées

### Pyramide et Labyrinthes (Inès)
- **Structure de la pyramide** : Création d'une pyramide externe positionnée au-dessus des labyrinthes.
- **Quatre étages de labyrinthes** : Chaque étage a un labyrinthe de taille différente, avec des portails de téléportation entre eux.
- **Téléportation** : Utilisation des touches `q` (étage supérieur) et `w` (étage inférieur) pour naviguer entre les labyrinthes.
- **Optimisation des performances** : Affichage d'un seul labyrinthe à la fois et simplification du sol à l'intérieur de la pyramide.
- **Lumières** : Utilisation de `ambientLight` et `pointLight` pour différencier les ambiances intérieure et extérieure.
- **Déplacements** :
  - À l'intérieur de la pyramide (`inLab == true`).
  - À l'extérieur (`inLab == false`), accessible via la touche `l`.

### Momie (Alix)
- **Modélisation 3D** :
  - **Corps, bras et tête** : Utilisation de `QUAD_STRIP` avec des bandelettes variables en largeur et couleur (`noise()`).
  - **Yeux** : Sphères aplaties pour un effet réaliste.
  - **Mains** : Fichiers OBJ intégrés et colorés dynamiquement.
- **Déplacement aléatoire** : Implémenté dans le premier labyrinthe uniquement (limitation de temps).

### Sol du Désert (Alix)
- **Texture de sable** : Génération procédurale avec des couleurs aléatoires pour un aspect granuleux.
- **Relief vallonné** : Utilisation d'un tableau 2D et de la fonction `noise()` pour créer des variations de hauteur.

---

## Difficultés Rencontrées
- **Problèmes de taille des labyrinthes** : Résolus en ajustant les variables `wallW` et `wallH`.
- **Téléportation non restreinte** : Les touches `q` et `w` fonctionnent en dehors des portails (limitation non résolue).
- **Performances** : Optimisation nécessaire pour éviter les ralentissements.
- **Modélisation de la momie** : Plusieurs essais requis pour obtenir un résultat satisfaisant.
- **Temps limité** : Certaines fonctionnalités n'ont pas pu être finalisées (ex : momie dans tous les labyrinthes).

---

## Conclusion
Ce projet a permis d'approfondir nos compétences en programmation avec Processing, malgré les défis techniques et les contraintes de temps. La répartition des tâches et la communication au sein du binôme ont été clés pour avancer efficacement.

**Points à améliorer** :
- Finaliser le déplacement de la momie dans tous les labyrinthes.
- Restreindre la téléportation aux portails.
- Optimiser davantage les performances.

---

## Instructions d'Utilisation
1. **Téléchargement** : Clonez le dépôt ou téléchargez les fichiers sources.
2. **Lancement** : Ouvrez le projet dans Processing et exécutez le script principal.
3. **Contrôles** :
   - `q` : Aller à l'étage supérieur.
   - `w` : Aller à l'étage inférieur.
   - `l` : Basculer entre l'intérieur et l'extérieur de la pyramide.

---

## Auteurs
- **Inès** : Pyramide, labyrinthes, lumières, déplacements.
- **Alix** : Momie, sol du désert.
- **Année** : 2023
