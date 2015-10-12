* wildcardForFunctions.frm
* section 2.4.2 Wildcard for Functions

Symbols x,y,z;
CFunctions f,g,h;
Local expr1 = f(x) + g(x);

* all function of x is replaced by h(x)
id f?(x) = h(x);
Print;
.sort

Local expr2 = f(x) + g(y);

* all function of arbitrary argument is replaced by z
id f?(x?) = z;
Print expr2;
.sort

Local expr3 = f(x+y) + f(x,y);
id f?(x?) = z;
Print expr3;
.end
