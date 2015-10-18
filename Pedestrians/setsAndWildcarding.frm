* setsAndWildcarding.frm

Symbols a1, a2;
* FORM has sets or arrays, as homogeneous objects:
Set a : a1,a2;
Local F = a[1] + a[2];
Print F;
*.sort
.clear

Symbols a,b,c,x;
Local F = a+b+c;

* x? means any symbol, whereas we restrict the symbol to the set {b,c}.
id x?{b,c} = 3;
Print F;
.sort

Symbols a,b,c,x;
Local F = a+b+c;

* ?! is exclude symbol
id x?!{b,c} = 3;
Print F;
.clear

Symbols a1,a2,b1,b2,x,n;
Function f;
Set a : a1,a2;
Set b : b1,b2;
Local F = a[1] + a[2];

* x must belong to the set a, and n becomes the number of the element in the set to which x matchs.
* id x?a[n] = b[n];
id x?a[n] = b[n] + f(n);
Print;
.clear

Symbols a1,a2,b1,b2,x,n;
Function f;
Set a : a1,a2;
Set b : b1,b2;
Local F = a[1] + a[2];

* There is a shortcut for changing names of set elements.
* id x?a[n] = b[n];
id x?a?b = x;
* Here, the identity statement reads as follows:
* x must belong to the set a, and in the right hand side each occurrence of x will be replaced by the corresponding element of the set of b.

Print;


.end
