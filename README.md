A toutes fins utiles voilà mon utilitaire pour rapidement générer l'attestation de déplacement dérogatoire obligatoire en France
depuis le confinement en raison du COVID-19.

![][sample]

Cet utilitaire a été développé sur Mac, mais devrait être portable aisément sur toute platforme sur laquel tourne [Pandoc] ou
[MacTeX]. Il s'adresse à ceux qui sont familiers avec la ligne de commande.

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


  [mactex]: https://tug.org/mactex/mactex-download.html
  [pandoc]: https://pandoc.org/installing.html
  [sample]: https://github.com/marcastel/tex-covid19/blob/master/shopping-20200404-1437.pdf

<!-- vim: set digraph nospell :-->
