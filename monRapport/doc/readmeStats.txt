--------------------------Doc stats (aussi appele "macro 2")--------------------------


----------Specs----------

Cette macro traite les donnees extraites de SM7 sur une periode donnee et cree une nouvelle feuille excel contenant  des statistiques concernant les IM.

Cette macro traite : 
	-les IM non attribue a "ALLIANCE"
	-les IM annules (AN)
	-les tickets sans numero d'IM

compte : 
	-le nombre d'IM recu par jour
	-le nombre d'IM resolu par jour
	-le nombre d'IM reçu par jour par tech
	-le nombre d'IM conforme par jour
	-le nombre d'IM conforme par jour par tech
	-le nombre d'IM scannes par jour par tech

calcule : 
	-le taux de satisfaction par jour
	-le nombre d'IM en backlogs

et liste : 
	-les IM recu par jour
	-les IM resolu par jour
	-les IM en backlogs
	-les IM conforme par jour(Y,N,vide)
	-les IM resolu par jour par tech


----------Contraintes----------

-La feuille excel extraite de SM7 doit etre la premiere et la seul d'un fichier excel pour fonctionner correctement.
-Excel doit etre configure de facon a ce que les colonnes soient affiches en lettre et non en chiffre. Pour faire le changement : 
	-dans Excel (pas l'editeur de VBA)
	-bouton Office 
	-options excel
	-onglet "Formules"
	-partie "manipulation de formules"
	-decocher "style de reference L1C1"
	-OK
-"ed repair time"(date ou l'evenement est resolu(sur le RI)) doit etre en colonne 		"BK"
-"ed faxtime"(reception du fax) doit etre en colonne 						"E"
-"delay"(1h,2h,8h) doit etre en colonne 							"AE"
-"ed code panne"(AN-> pour les tickets resolu/cloturer par jour) doit etre en colonne 		"AW"
-"resolved groupe" doit etre en colonne 							"BM"
-"ed scanning"(NON,Oui Correct, Oui incorrect, vide) doit etre en colonne 			"AG"
-"IM" doit etre en colonne 									"B"
-"resolved time"(resolu) doit etre en colonne 							"BO"
-"probleme status"(closed, resolved, open, work in progress) doit etre en colonne 		"BI"
-"ed conformity RI" doit etre en colonne 							"BY"
-"Site visite Tech" doit etre en colonne 							"C"
-"ed Satisfaction" doit etre en colonne 							"AF"
-"ed provider"(ALLIANCE) doit etre en colonne 							"AC"
-"opened by" doit etre en colonne 								"BA"
-"open groupe" doit etre en colonne 								"AZ"
-"open time" doit etre en colonne 								"CA"


-Version supporté Office 2007
-Chaque cellule ne doit faire qu'une ligne