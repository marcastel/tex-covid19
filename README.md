A toutes fins utiles voilà mon utilitaire pour rapidement générer l'attestation de déplacement dérogatoire obligatoire en France
depuis le confinement en raison du COVID-19.

[![][image]][sample]

Cet utilitaire a été développé sur Mac, mais devrait être portable aisément sur toute platforme sur laquelle tourne [Pandoc] et
[MacTeX]. Il s'adresse à ceux qui sont familiers avec la ligne de commande.

# Utilisation

Pour produire un attestation il suffit de taper

    make <motif>

| motif     | libellé |
| :-------- | :------ |
| family    | familial impérieux l'assistance aux personnes vulnérables ou la garde d'enfants |
| fitness   | une activité physique individuelle à proximité du domicile |
| health    | ma santé ou celle d'un de mes proches confiné avec moi |
| shopping  | d'effectuer des achats de première nécessité dans des établissements autorisés |
| work      | un déplacement professionnel ne pouvant être différé |

Une [attestation en PDF][sample] sera automatiquement produite; le fichier sera automatiquement horodaté.

Pour ajouter la durée du déplacement il suffit de rajouter le paramètre `TIMESLOT` avec la période de déplacement envisagée:

    make <motif> TIMESLOT='de 10h à 14h'

Par défaut, l'horodatage est celui de la date à laquelle l'attestation est produite. Si vous préparer votre attestation en avance,
vous pouvez préciser le paramètre `TIMESTAMP`:

    make <motif> TIMESTAMP=20201231-1200

# Personnalisation

Pour personnaliser l'utilitaire, il faut éditer le fichier `Makefile` et modifier les variables suivantes:

    USER_FULLNAME   = Emmanuel Macron
    USER_BIRTHDATE  = 21 décembre 1977
    USER_BIRTHPLACE = Amiens
    USER_ADDRESS    = 55 Rue du Faubourg Saint-Honoré
    USER_CITY       = à Paris

# Installation

GitHub étant un repère de développeurs, je pars du principe que vous êtes autonome pour installer et utiliser cet utilitaire.
En cas contraire, ouvrez une [issue][issues] et je me ferais un plaisir d'y répondre.

  [image]:  https://user-images.githubusercontent.com/6306262/78451161-0df2d480-7684-11ea-81d6-1be431921076.png
  [issues]: https://github.com/marcastel/tex-covid19/issues
  [mactex]: https://tug.org/mactex/mactex-download.html
  [pandoc]: https://pandoc.org/installing.html
  [sample]: https://github.com/marcastel/tex-covid19/files/4431362/shopping-20200404-1437.pdf

<!-- vim: set digraph nospell :-->
