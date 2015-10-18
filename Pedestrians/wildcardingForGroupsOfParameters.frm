* wildcardingForGroupsOfParameters.frm
* section 2.4.3

Symbols x,y;
CFunctions f,g;
* Local F = f(x,x,x) + f(0);
Local F = f(x,x,x) + f;

* ?a pattern hits both (x,x,x) and (0) (or the empty sequence of abbreviation of it)
* ?a (a variable that starts with a question mark) represents any sequence of adjacent arguments in a function call.
* We call this an argument sequence wildcard.
* Wildcards variables do NOT have to be declared.
id f(?a) = g(0,?a,0,?a,0);
Print;
*.sort
.clear

Symbols w,x,y,z;
Indices W,X,Y,Z;
CFunction F;
Tensor S(Symmetric), C(Cyclic);

Local expr = F(x,y,z) + S(X,W,Z) + C(X,Y,Z);

* there is only one general rule that determines which option will be taken:
* from left to right, the argument sequence wildcards will refer to 
* lesser number of arguments.
* That is, (?a) hits (x,y), (w?) hits (z) and ?b hits nothing.
id F(?a,w?,?b) = F(w,0,?a,0,?b); 

* Symmetry properties may change the way in which the option of matching is chosen,
* or in case (anti)symmetric tensors even ignore the replacement rule
* (pattern matching would often be too costly).
id S(?a,W?,?b) = S(W,0,?a,0,?b); 
id C(?a,W?,?b) = C(W,0,?a,0,?b); 
Print expr;
.clear

* metric and Ricci tensor
Tensors g,R;
Indices i,j,k,l,m,n,low,up;
Local T1 = g(i,low,j,up) * R(j,low,k,low);
* second R is indeed a Riemann curvature tensor
Local T2 = g(i,up,j,up) * R(i,low,k,low,j,low,l,low); 

id g(i?,low,j?,up) * R?(?a,j?,low,?b) = R(?a,i,low,?b);
id g(i?, up,j?,up) * R?(?a,i?,low,?b,j?,low,?c) = R(?a,?b,?c);
id g(i?, up,j?,up) * R?(?a,j?,low,?b,i?,low,?c) = R(?a,?b,?c);
Print;
*.sort
.clear

* Of course the above implementation of upper and lower indices 
* is somewhat cumbersome.
* So let us introduce a shorter notation such as U(i) and L(j):

Functions g,R,L,U;
Indices i,j,k,l,m,n;
Local T1 = g(L(i),U(j)) * R(L(j),L(k));
Local T2 = g(U(i),U(j)) * R(L(i),L(k),L(j),L(l));

id g(L(i?), U(j?)) * R?(?a,L(j?),?b) = R(?a,L(i),?b);
id g(U(i?), U(j?)) * R?(?a,L(i?),?b,L(j?),?c) = R(?a,?b,?c);
id g(U(i?), U(j?)) * R?(?a,L(j?),?b,L(i?),?c) = R(?a,?b,?c);

Print;
.clear

Functions g,R,L,U;
Indices i,j,k,l,m,n,low,up;
Local T1 = g(L(i),U(j)) * R(L(j),L(k));
Local T2 = g(U(i),U(j)) * R(L(i),L(k),L(j),L(l));

* denest functions
repeat;
  id R?(?a,L(i?),?b) = R(?a,i,low,?b);
  id R?(?a,U(i?),?b) = R(?a,i,up ,?b);
endrepeat;

* apply rules
id g(i?,low,j?,up) * R?(?a,j?,low,?b) = R(?a,i,low,?b);
id g(i?, up,j?,up) * R?(?a,i?,low,?b,j?,low,?c) = R(?a,?b,?c);
id g(i?, up,j?,up) * R?(?a,j?,low,?b,i?,low,?c) = R(?a,?b,?c);

* back to original notation
repeat;
  id R?(?a,i?,low,?b) = R(?a,L(i),?b);
  id R?(?a,i?, up,?b) = R(?a,L(i),?b);
endrepeat;

* print the results;
Print;
.end
