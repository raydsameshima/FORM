* muonProduction.frm
* electron + positoron -> muon + anti-muon
* Reference: Peskin & Schroeder
* by Ray D. Sameshima

Off statistics;

* momentum
Vectors p,k, pp,kp;
* masses
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

* as dummy indices
AutoDeclare Symbols aaa, bbb;

* Mandelstam variables
Symbols [s],[1/s],[t],[1/t],[u],[1/u];

* charge
Symbols [e^2];

.global

*******************************************************

#procedure amplitude(dummy)

* (5.2)
Global [M^2] = 1/4 * Msc * Ms;

* label 1 as electron, 2 as muon
id Ms  = R(vb(1,pp),r1)*R(g_(1,alpha),r1,r2)*R(u(1,p),r2)*
         propagator*
         R(ub(2,k),r3)*R(g_(2,alpha),r3,r4)*R(v(2,kp),r4);

id Msc = R(ub(1,p),rr1)*R(g_(1,beta),rr1,rr2)*R(v(1,pp),rr2)*
         propagator*
         R(vb(2,kp),rr3)*R(g_(2,beta),rr3,rr4)*R(u(2,k),rr4);

.sort

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
* aaa, bbb are just dummies
repeat;
  id R(aaa?, r1?, r2?) * R(bbb?, r2?, r3?) = R(aaa*bbb, r1, r3);
endrepeat;

* take a trace
* aaa, bbb are just dummies
id R(aaa?, r1?, r2?) = aaa;
* Bracket propagator;
.sort;

* aaa is a dummy  
* Taking the trace of a spin line with index i is accomplished 
* by the commands trace4,i.
#do aaa = 1,2
  trace4, 'aaa';
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

id p.pp  = 1/2*[s] - eMass^2;
id k.kp  = 1/2*[s] - muMass^2;
id k.p   = 1/2*([t] - eMass^2 - muMass^2);
id kp.pp = 1/2*([t] - eMass^2 - muMass^2);
id kp.p  = 1/2*([u] - eMass^2 - muMass^2);
id k.pp  = 1/2*([u] - eMass^2 - muMass^2);

Bracket propagator;
.sort

id propagator = [e^2]*[1/s];
Bracket [e^2],[1/s];

* id [s]*[1/s] = 1;

#message two terms are the same as eq.(5.70)
Print [M^2] +s;
.sort

********************************************
Symbol ECM;
Symbols [cos(theta)], [p^2];
Symbols [sqrt(E-muMass^2)],[sqrt(E-eMass^2)];
* (5,72)
id [s] = ECM^2;
id [1/s] = 1/ECM^2;
id [t] = eMass^2+muMass^2 -2*(ECM^2 - [sqrt(E-muMass^2)]*[sqrt(E-eMass^2)]*[cos(theta)]);
id [u] = eMass^2+muMass^2 -2*(ECM^2 + [sqrt(E-muMass^2)]*[sqrt(E-eMass^2)]*[cos(theta)]);

Bracket [e^2],[cos(theta)];
Print [M^2] +s;

********************************************
* id eMass = 0;
* id muMass = 0;
* Bracket [e^2],[1/s];


Print +s;
#endprocedure;

#call amplitude(dummy)
.end
