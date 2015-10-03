* leviCivita.frm

Dimension 3;
Indices i,j,k,p,q,r;
Local f0 = e_(i,j,k) * e_(p,q,r);
Local f1 = e_(i,j,k) * e_(p,q,k);
Local f2 = e_(i,j,k) * e_(p,j,k);
Local f3 = e_(i,j,k) * e_(i,j,k);
* Einstein summation convention:
contract;
* to print each term of an expression on a separate line:
Print +s;
.end
