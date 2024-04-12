# README

Addon qui met à jour automatiquement le motd de guilde.

Commandes :

* `/calchnip on` : active l'addon
* `/calchnip off` : désactive l'addon
* `/calchnip check` : vérifie et met à jour le motd si l'addon est activé.
* `/calchnip show <YYYY-MM-DD>` : affiche le motd calculé pour la date donnée au format IS0 8601

Par défaut, l'addon est activé.

## Développement

L'addon est composé de deux fichiers :

* `CalChnip.lua` : contient l'implémentation des commandes et la mise à jour du motd (en pratique toute la logique de l'addon 😉).
* `CalChnipData.lua` : contient les données permettant de composer le motd : en pratique une collection indexée par les 366 jours d'année. Ce fichier est généré par le script `GenerateData.scala` en se basant sur le calendrier défini dans le fichier `resources/data.json`.
    - Exécuter `scala-cli GenerateData.scala` pour le mettre à jour
