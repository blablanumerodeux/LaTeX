module essaiEDTV2

open util/ordering[Time] as temps
open util/relation

abstract sig Time{
estOuvrable :set typeHeure,
precede :lone Time //facultatif, fait pour visualiser l'ordre des heures
}

one sig 
t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15
,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27
,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,t39
,t40,t41,t42,t43,t44,t45,t46,t47,t48
,t49,t50,t51,t52,t53,t54,t55,t56,t57,t58,t59,t60
,t61,t62,t63,t64,t65,t66,t67,t68,t69,t70,t71,t72
,t73,t74,t75,t76,t77,t78,t79,t80,t81,t82,t83,t84
,t85,t86,t87,t88,t89,t90,t91,t92//,t93,t94,t95,t96
//,t97,t98,t99,t100,t101,t102,t103,t104,t105
 extends Time{}

abstract sig typeHeure{}

one sig ouvrable, nonOuvrable extends typeHeure{}

abstract sig technicien{
travaille:some Plage
}

one sig tech1,tech2,tech3,tech4,tech5,tech6,tech7,tech8,tech9,tech10 extends technicien{}

sig Plage{
contient :set Time,
estTravaillePar : set technicien
}

one sig p1,p2,p3,p4,p5,p6,p7,p8 extends Plage{}

//retourne la plage qui  commence le plus tôt
fun anterieure[p,p':Plage] : Plage{
smaller[min[p.contient],min[p'.contient]] =min[p.contient]=>p else p'
}

//retourne la plage qui commence le plus tard
fun posterieure[p,p':Plage]:Plage{
larger[min[p.contient],min[p'.contient]] =min[p.contient]=>p else p'
}

//retourne l'ensemble des heures entre les plages 
fun interplage[p,p':Plage] : set Time{
anterieure[p,p'].contient.max.nexts&posterieure[p,p'].contient.min.prevs
}

//définition de l'échelle des temps
fact{
temps/first={t0}
temps/next=t0->t1+t1->t2+t2->t3+t3->t4+t4->t5
+t5->t6+t6->t7+t7->t8+t8->t9+t9->t10+t10->t11
+t11->t12+t12->t13+t13->t14+t14->t15+t15->t16+t16->t17
+t17->t18+t18->t19+t19->t20+t20->t21+t21->t22+t22->t23
+t23->t24+t24->t25+t25->t26+t26->t27+t27->t28+t28->t29
+t29->t30+t30->t31+t31->t32+t32->t33+t33->t34+t34->t35
+t35->t36+t36->t37+t37->t38+t38->t39+t39->t40+t40->t41
+t41->t42+t42->t43+t43->t44+t44->t45+t45->t46+t46->t47
+t47->t48+t48->t49+t49->t50+t50->t51+t51->t52+t52->t53
+t53->t54+t54->t55+t55->t56+t56->t57+t57->t58+t58->t59
+t59->t60+t60->t61+t61->t62+t62->t63+t63->t64+t64->t65
+t65->t66+t66->t67+t67->t68+t68->t69+t69->t70+t70->t71
+t71->t72+t72->t73+t73->t74+t74->t75+t75->t76+t76->t77
+t77->t78+t78->t79+t79->t80+t80->t81+t81->t82+t82->t83
+t83->t84+t84->t85+t85->t86+t86->t87+t87->t88+t88->t89
+t89->t90+t90->t91+t91->t92//+t92->t93+t93->t94+t94->t95
/*+t95->t96*//*+t96->t97+t97->t98+t98->t99+t99->t100+t100->t101
+t101->t102+t102->t103+t103->t104+t104->t105*/
temps/last={t92}
precede=temps/next
 }

//les heures contenues dans une plage sont ouvrables
fact{
all p:Plage, t :Time | t in p.contient=>t->ouvrable in estOuvrable
//all t : Time | some p : Plage | t->ouvrable in estOuvrable => p->t in contient
}

//Pour toutes les heures ouvrables, il y a une plage
fact{
all t : Time | some p : Plage | t->ouvrable in estOuvrable => p->t in contient 
}

//tout technicien travaille au moins sur deux plages horaires
fact{
//all t : technicien | #(t.travaille)=1
}

//définition des heures ouvrables
fact defEstOuvrable{
estOuvrable=

t8->ouvrable+t9->ouvrable+t10->ouvrable+t11->ouvrable
+t12->ouvrable+t13->ouvrable+t14->ouvrable+t15->ouvrable
+t16->ouvrable+t17->ouvrable+t18->ouvrable+t19->ouvrable
+t20->ouvrable+t21->ouvrable+t22->ouvrable


//+t23->ouvrable
/*+t24->ouvrable+t25->ouvrable+t26->ouvrable+t27->ouvrable
+t28->ouvrable+t29->ouvrable+t30->ouvrable
*/

+t31->ouvrable
+t32->ouvrable+t33->ouvrable+t34->ouvrable+t35->ouvrable
+t36->ouvrable+t37->ouvrable+t38->ouvrable+t39->ouvrable
+t40->ouvrable+t41->ouvrable+t42->ouvrable+t43->ouvrable
+t44->ouvrable+t45->ouvrable

/*
+t46->ouvrable
+t47->ouvrable
+t48->ouvrable+t49->ouvrable+t50->ouvrable+t51->ouvrable
+t52->ouvrable+t53->ouvrable
*/

+t54->ouvrable+t55->ouvrable
+t56->ouvrable+t57->ouvrable+t58->ouvrable+t59->ouvrable
+t60->ouvrable+t61->ouvrable+t62->ouvrable+t63->ouvrable
+t64->ouvrable+t65->ouvrable+t66->ouvrable+t67->ouvrable
+t68->ouvrable

/*
+t69->ouvrable
+t70->ouvrable
+t71->ouvrable
+t72->ouvrable+t73->ouvrable+t74->ouvrable+t75->ouvrable
+t76->ouvrable
*/

+t77->ouvrable+t78->ouvrable+t79->ouvrable
+t80->ouvrable+t81->ouvrable+t82->ouvrable+t83->ouvrable
+t84->ouvrable+t85->ouvrable+t86->ouvrable+t87->ouvrable
+t88->ouvrable+t89->ouvrable+t90->ouvrable+t91->ouvrable

/*
+t92->ouvrable
*/
}

//toute  plage  contient 4 plages horaires consécutives
fact{

all p : Plage | some pl : Time | p->pl in contient &&
 #(p.contient)=8 && heuresConsecutives[p]

}

//caractérisation des heures consécutives
pred heuresConsecutives[p:Plage]{
all q : p.contient | temps/next[q] in p.contient ||
temps/nexts[q]&p.contient=none

}

//deux plages ne peuvent pas contenir les mêmes heures
fact{
//all p,p' :Plage | p!=p'=>p.contient!=p'.contient
}

//un technicien travaille sur deux plages disjointes
fact{
//all tec:technicien,p,p' :Plage | p!=p' &&  tec->p in travaille && tec->p' in travaille=>
//p.contient&p'.contient=none
}

//un technicien ne peut travailler sur deux plages que si elles sont distantes 
//de deux heures
fact{
all tec:technicien,p,p' :Plage | p!=p' &&  tec->p in travaille && tec->p' in travaille=>
#interplage[p,p']>=11
}


//Toutes les plages doivent etre travaillees par au moin un tech 
fact{
all p : Plage | some tec : technicien | tec->p in travaille
}


//estTravaillePar est l'inverse de travaille
fact{
all t : technicien,  p : Plage | t->p in travaille <=>p->t in estTravaillePar
}

//Les plages de 8h et de 23h sont travaillees par au moin 2 tech
fact{
all p : Plage | p->t8 in contient =>#p.estTravaillePar>=2
all p : Plage | p->t23 in contient =>#p.estTravaillePar>=2

all p : Plage | p->t31 in contient =>#p.estTravaillePar>=2
all p : Plage | p->t45 in contient =>#p.estTravaillePar>=2

all p : Plage | p->t54 in contient =>#p.estTravaillePar>=2
all p : Plage | p->t68 in contient =>#p.estTravaillePar>=2

all p : Plage | p->t77 in contient =>#p.estTravaillePar>=2
all p : Plage | p->t91 in contient =>#p.estTravaillePar>=2
}

//il peut y avoir plus de 3 plages 
fact {
//	#Plage>8
}

pred show {

}

run {}//show for 9// but 4 Plage

