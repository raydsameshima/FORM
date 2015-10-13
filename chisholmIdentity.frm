* 2.5.5 Dirac Algebra

Off statistics;

Function g;
CFunction eta;
Indices Um,Lm,U1, ..., U4, L1, ..., L4;

Set U: Um,U1, ..., U4;
Set L: Lm,L1, ..., L4;

Set UL: Um,Lm, <U1,L1>, ..., <U4,L4>;
Set LU: Lm,Um, <L1,U1>, ..., <L4,U4>;

Indices i,j;
Symbols k,N;

Local F1 = g(Um)*g(U1)*g(Lm);
Local F2 = g(Um)*g(U1)*g(U2)*g(Lm);
Local F3 = g(Um)*g(U1)*g(U2)*g(U3)*g(Lm) 
         + 2*g(U3)*g(U2)*g(U1);
Local F4 = g(Um)*g(U1)*g(U2)*g(U3)*g(U4)*g(Lm) 
         - 2*g(U4)*g(U1)*g(U2)*g(U3)
         - 2*g(U3)*g(U2)*g(U1)*g(U4);

* using the specific form that we've given,
* bring g(Lm) to the left to cancel it with g(Um)
* and use rewrite rule for meric tensor eta
repeat;
  id g(Um) * g(Lm) = N;
* anti-commutation relation
  id g(i?) * g(Lm) = -g(Lm) * g(i) + 2*eta(i,Lm);
  id g(i?U[k]) * eta(?a,j?L[k]) = g(?a);
endrepeat;

Print;
.sort

* using disorder, bring product of gamma matrices in standard order
repeat;
  id disorder g(i?U) * g(j?U) = -g(j)*g(i) + 2*eta(i,j);
endrepeat;
* AntiBracket makes N inside ().
AntiBracket N;
Print;
.sort

* specialize to he case N=4
id N = 4;
AntiBracket eta;
Print;
.clear

************************************************************

Off statistics;

Symbol N;
Dimension N;
Function g;
CFunction eta;
Vector p,q;
Indices Um, Lm, U1, ..., U5, L1, ..., L5; 
Set U: Um, U1, ..., U5;
Set L: Lm, L1, ..., L5;
Set UL: Um, Lm, <U1, L1>, ..., <U5, L5>;
Set LU: Lm, Um, <L1, U1>, ..., <L5, U5>;
Index i,j,m,n;
Symbol k;

Local F1 = g(Lm, p, Um);
Local F2 = g(Um, L1, U2, Lm);
Local F3 = g(Um, p, q, U3, Lm) + 2 * g(U3, q, p); 
Local F4 = g(Um, L1, U2, L3, U4, Lm)
         - 2 * g(U4, L1, U2, L3)
         - 2 * g(L3, U2, L1, U4);
Local F5 = g(Lm, U1, p, U3, q, U5, Um)
         - 2 * g(U5, U1, p, U3, q) 
         + 2 * g(q, U1, p, U3, U5) 
         + 2 * g(U3, p, U1, q, U5);

* change notation to product of gamma matrices 
repeat;
  id g(?a, i?, j?, ?b) = g(?a, i) * g(j, ?b);
endrepeat;

* bring low index to the left in the hope
* to meet a corresponding upper index
* bring vector arguments to the left *
repeat;
  repeat;
    id g(i?U[k]) * g(j?L[k]) = d_(m,m);
  endrepeat;

  id g(i?U) * g(j?L) = - g(j) * g(i) + 2*eta(i, j); 
  id g(i?UL[k]) * eta(?a, j?LU[k], ?b) = g(?a, ?b); 
  id g(i?UL) * g(p?) = - g(p) * g(i) + 2*p(i);
  id p?(i?UL[k]) * eta(m?, j?LU[k]) = p(m);
  id eta(?a, i?UL[k], ?b) * eta(?c, j?LU[k], ?d) = eta(?a, ?b, ?c, ?d); 
endrepeat;

* bring low index to the right in the hope
* to meet a corresponding upper index 
repeat;
  repeat;
  id g(i?L[k]) * g(j?U[k]) = d_(m,m);
  endrepeat;

  id g(i?L) * g(j?U) = - g(j) * g(i) + 2*eta(i, j); 
  id g(i?UL[k]) * eta(?a, j?LU[k], ?b) = g(?a, ?b); 
  id p?(i?UL[k]) * eta(j?LU[k], m?) = p(m);
  id eta(?a, i?UL[k], ?b) * eta(?c, j?LU[k], ?d) = eta(?a, ?b, ?c, ?d); 
endrepeat;

* bring product of gamma matrices with respect to
* index arguments in standard order *
repeat;
  id disorder g(i?UL) * g(j?UL) = - g(j) * g(i) + 2*eta(i,j);
  id g(i?UL[k]) * eta(?a, j?LU[k], ?b) = g(?a, ?b); 
endrepeat;

* contract vector components with gamma matrices
* bring all vector arguments to the left *
repeat;
  id g(i?UL[k]) * p?(j?LU[k]) = g(p);
  id g(i?UL) * g(p?) = - g(p) * g(i) + 2 * p(i); 
  id p?(i?UL[k]) * eta(m?, j?LU[k]) = p(m);
  id eta(?a, i?UL[k], ?b) * eta(?c, j?LU[k], ?d) = eta(?a, ?b, ?c, ?d); 
endrepeat;

* bring product of gamma matrices with respect to
* vector arguments in standard order
repeat;
  id disorder g(p?) * g(q?) = - g(q) * g(p) + 2*p.q; 
endrepeat;

* symmetrize the metric tensor and
* go back to short notation 
symmetrize eta;
repeat;
  id g(i?,?a) * g(j?,?b) = g(i, ?a, j, ?b); 
endrepeat;

AntiBracket N; 
Print;
.sort

* specialize to the case N = 4
id N = 4;
AntiBracket eta;
Print;
.clear

****************************************************************

Off statistics;

Function g,G;
CFunction eta,eps,del;
Indices a,b,c,d,k,m,n,r;

* make the let-hand side of the equality
Local [Gabc] = 1/6 * e_(1,2,3)*e_(a,b,c)*g(a)*g(b)*g(c);
contract;

id g(1) = g(a) * eta(a,a);
id g(2) = g(b) * eta(b,b);
id g(3) = g(c) * eta(c,c);

Print +s [Gabc];
.sort

* define the right-hand side of the equality
* implicitly assume Einstein's summation convention
Local [g5] = i_ * g(0)*g(1)*g(2)*g(3);
Local F2   = i_ * eps(a,b,c,d)*[g5]*g(d);
sum d,0,1,2,3;
Print +s F2;
.sort

* compute the difference of the left and right hand side
Local F = F2 - [Gabc];

repeat;
  id g(a?) * g(a?) = eta(a,a);
  id disorder g(a?) * g(b?) = -g(b)*g(a) + 2*eta(a,b);
endrepeat;
.sort

* work out the contraction of repeated indices and
* show that for all combinations of indices the result equals zero
Symbols x,y,z;
Local R = sum_(a,0,3, sum_(b,0,3, (sum_(c,0,3 F * x^a * y^b * z^c))));
Bracket x,y,z;
* Print;
.sort

repeat;
  id g(a?) * g(a?) = eta(a,a);
  id disorder g(a?) * g(b?) = -g(b)*g(a) + 2*eta(a,b);
endrepeat;

id eps(?a) = e_(?a);
id eta(a?,a?) = -1 + 2*d_(0,a);
id eta(a?,b?) = d_(a,b);
id e_(0,1,2,3) = 1;
Print R;
.end
