A toutes fins utiles voilà mon utilitaire pour rapidement générer l'attestation de déplacement dérogatoire obligatoire en France
depuis le confinement en raison du COVID-19.

Cet utilitaire a été développé sur Mac, mais devrait être portable aisément sur toute platforme sur laquel tourne [Pandoc] ou
[MacTeX]. Il s'adresse à ceux qui sont familiers avec la ligne de commande.

Pour produire un attestation il suffit de taper

    make <motif>

| motif     | libellé |
| --------- | ------- |
| family    | familial impérieux l'assistance aux personnes vulnérables ou la garde d'enfants |
| fitness   | une activité physique individuelle à proximité du domicile |
| health    | ma santé ou celle d'un de mes proches confiné avec moi |
| shopping  | d'effectuer des achats de première nécessité dans des établissements autorisés |
| work      | un déplacement professionnel ne pouvant être différé |



  [pandoc]: https://pandoc.org/installing.html
  [mactex]: https://tug.org/mactex/mactex-download.html
