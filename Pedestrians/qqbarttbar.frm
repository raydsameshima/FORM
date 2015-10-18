* qqbarttbar.frm
* q + qbar -> t + tbar
* Reference: Peskin & Schroeder
* by Ray D. Sameshima

*
* \q(p1)                    // t(k1)
*  \                       //
*   \                     //
*    \                   //
*     \                 //
*      *===============*
*     /                 \\
*    /                   \\
*   /                     \\
*  /                       \\
* / qbar(p2)                \\ tbar(k2)
*
*
*
*
*
*
*
*
*


Off statistics;

* momentum
Vectors p,k, pp,kp;
* masses
************************************* will change eMass -> qMass, muMass -> tMass *************************************
Symbols eMass, muMass;

* scattering ampritude (of s-channel)
Symbols Ms, Msc;
* spinors
CFunction R,ub,vb,u,v;

* Lorentz indices
Indices alpha, beta;
* Dirac (or spinor) indices
AutoDeclare Symbols r;
* propagator corresponds to 1/q^2, i.e. the momentum transfer
Symbols propagator;

* a's dummy indices
AutoDeclare Symbols a;

* Mandelstam variables
Symbols [s],[1/s],[t],[1/t],[u],[1/u];

* charge
Symbols [e^2];

* colour indices
AutoDeclare Symbols c;
* Gel-mann matrices

*******************************************************

* (5.2)
Global [M^2] = 1/4 * Msc * Ms;

* label 1 as electron, 2 as muon
id Ms  = R(vb(1,pp),r1)*R(g_(1,alpha),r1,r2)*R(u(1,p),r2)*
         propagator*
         R(ub(2,k),r3)*R(g_(2,alpha),r3,r4)*R(v(2,kp),r4);

id Msc = R(ub(1,p),rr1)*R(g_(1,beta),rr1,rr2)*R(v(1,pp),rr2)*
         propagator*
         R(vb(2,kp),rr3)*R(g_(2,beta),rr3,rr4)*R(u(2,k),rr4);

* sum over the spins
* using (3.66) and (3.67)
* label 1 as electron, 2 as muon
if ((match(propagator*propagator)==1));
  id R(u(1,p?),r1?)*R(ub(1,p?),r2?) = R(g_(1,p)+eMass,r1,r2);
  id R(u(2,p?),r1?)*R(ub(2,p?),r2?) = R(g_(2,p)+muMass,r1,r2);

  id R(v(1,p?),r1?)*R(vb(1,p?),r2?) = R(g_(1,p)-eMass,r1,r2);
  id R(v(2,p?),r1?)*R(vb(2,p?),r2?) = R(g_(2,p)-muMass,r1,r2);

else;
  Print "here is line 58";
endif;

Bracket propagator;
Print [M^2] +s;
.sort;

* contraction or qusi-trace (like a "representation")
* a's are just dummies
repeat;
  id R(a1?, r1?, r2?) * R(a2?, r2?, r3?) = R(a1*a2, r1, r3);
endrepeat;

* take a trace
* a's are just dummies
id R(a1?, r1?, r2?) = a1;
* Bracket propagator;
* .sort;

* a's are dummy  
* Taking the trace of a spin line with index i is accomplished 
* by the commands trace4,i.
#do a1 = 1,2
  trace4, 'a1';
#enddo
Bracket propagator;

.sort

* Let's simplify the expressions
* momemtum conservation: p + pp = k + kp
id p.p = eMass^2;
id pp.pp = eMass^2;
id k.k = muMass^2;
id kp.kp = muMass^2;

Bracket propagator;

#message three terms are the same as eq.(5.10)
Print [M^2] +s;
.sort

* Now we include the color indices inside our propagator:
*   propagator ~ eta_(mu,nu) -> eta_(mu,nu)*d_(c1,c2)
* and taking trace in colour space,
*   d_(c1,c1) = 8

.end
