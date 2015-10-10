* commutator.frm

Symbols hbar,m;
* In general, Functions do not commute.
Functions x,p,H;
Local [H,x] = H*x - x*H;
id H = p^2/(2*m);
Print;
.sort

repeat;
  id x*p = p*x + hbar* i_;
endrepeat;

Print;
*.sort
.clear

Symbols hbar,m;
Functions x,p,H;
Functions V, delV;

Local [H,p] = H*p - p*H;

id H = p^2/(2*m) + V;

id p*V = V*p + hbar*i_ *delV; 

Print [H,p];
.end
