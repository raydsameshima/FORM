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
Vectors p,q;
Indices Um,Lm,U1, ..., U5, L1, ..., L5;
Set U: Um,U1, ..., U5;
Set L: Lm,L1, ..., L5;

Set UL: Um,Lm, <U1,L1>, ..., <U4,L4>;
Set LU: Lm,Um, <L1,U1>, ..., <L4,U4>;

Indices i,j,m,n;
Symbol k;

Local F1 = g(Lm,p,Um);
Local F2 = g(Um,L1,U2,Lm);
Local F3 = g(Um,p,q,U3,Lm) + 2*g(U3,q,p);
Local F4 = g(Um,L1,U2,L3,U4,Lm)
         - 2*g(U4,L1,U2,L3)
         - 2*g(L3,U2,L1,U4);
Local F5 = g(Lm,U1,p,U3,q,U5,Um)
         - 2*g(U5,U1,p,U3,q)
         + 2*g(q,U1,p,U3,U5)
         + 2*g(U3,p,U1,q,U5);

* change notation to product of gamma matrices
repeat;
  id g(?a,i?,j?,?b) = g(?a,i)*g(j,?b);
endrepeat;

* bring low index to the left in the hope
* to meet a correponding upper index
* bring vector arguments to the left

repeat;
  repeat;
* contraction
    id g(i?U[k]) * g(j?L[k]) = d_(m,m);
  endrepeat;

* anti commutator
  id g(i?U) * g(j?L) = -g(j)*g(i) + 2*eta(i,j);
* contraction
  id g(i?UL[k]) * eta(?a, j?LU[k], ?b) = g(?a,?b);
* slash notation
  id g(i?UL) * g(p?) = -g(p)* g(i) + 2*p(i);
  id p?(i?UL[k]) * eta(m?, j?LU[k]) = p(m);
  id eta(?a,i?UL[k],?b) * eta(?c,j?LU[k],?d) = eta(?a,?b,?c,?d);
endrepeat;

* bring low indes to the right in the hope
* to meet a corresponding upper index
repeat;
  repeat;
    id g(i?L[k]) * g(j?U[k]) = d_(m,m);
  endrepeat;

  id g(i?L) * g(j?U) = -g(j)*g(i) + 2*eta(i,j);
  id g(i?UL[k]) * g(p?) = -g(p)*g(i) + 2*p(i);
  id g(i?UL) * g(p?) = - g(p)*g(i) + 2*p(i);
  id p?(i?UL[k]) * eta(m?, j?LU[k]) = p(m);
  id eta(?a,i?UL[k],?b) * eta(?c,j?LU[k],?d) = eta(?a,?b,?c,?d);
endrepeat;

* bring low index to the right in the hope
* to meet a orresponding upper index
repeat;
  repeat;
    id g(i?L[k]) * g(j?U[k]) = d_(m,m);
  endrepeat;

  id g(i?L) * g(j?U) = -g(j)*g(i) + 2*eta(i,j);
  id g(i?UL[k]) * g(p?) = -g(p)*g(i) + 2*p(i);
  id g(i?UL) * g(p?) = - g(p)*g(i) + 2*p(i);
  id p?(i?UL[k]) * eta(m?, j?LU[k]) = p(m);
  id eta(?a,i?UL[k],?b) * eta(?c,j?LU[k],?d) = eta(?a,?b,?c,?d);
endrepeat;

* bring product of gamma matrices with respect to 
* index arguments in standard order
repeat;
  id disorder g(i?UL) * g(j?LU) = -g(j)*g(i) + 2*eta(i,j);
  id g(i?UL[k]) * eta(?a,j?LU[k],?b) = g(?a,?b);
endrepeat;

* contract vector components with gamma matrices
* birng all vector arguments to the left
repeat;
  id g(i?UL[k]) * p?(j?LU[k]) = g(p);
  id g(i?UL) * g(p?) = -g(p)*g(i) + 2*p(i);
  id p?(i?UL[k]) * eta(m?,j?LU[k]) = p(m);
  id eta(?a,i?UL[k],?b) * eta(?c,j?LU[k],?d) = eta(?a,?b,?c,?d);
endrepeat;

* bring product of gamma matrices with respecto to
* vector arguments in standard order
repeat;
  id disorder g(p?)*g(q?) = -g(q)*g(p) + 2*p.q;
endrepeat;

* symmetrize the metric tensor and go bach
* to shorter notation
symmetrize eta;

repeat;
  id g(i?,?a)*g(j?,?b) = g(i,?a,j,?b);
endrepeat;

AntiBracket N;
Print;
.sort
.end
