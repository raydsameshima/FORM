* wildcardParameters.frm
* section 2.4.1 Wildcard Parameters

Off statistics;
Symbols a,b,x,y;
CFunction sqrt;
Local F1 = a*sqrt(b);
Local F2 = sqrt(2)*sqrt(b);
Local F3 = sqrt(sqrt(a)+1) * sqrt(sqrt(a)-1);

id x? * sqrt(y?) = sqrt(x^2*y);
Print;
.sort

repeat;
  id sqrt(x?) * sqrt(y?) = sqrt(x*y);
endrepeat;
id sqrt(4) = 2;
Print F2, F3;
.sort

argument;
  id sqrt(x?) * sqrt(x?) = x;
endargument;
Print F3;
.sort

* For efficiency reason, the rule in FORM is that substitutions are NOT
* executed inside the arguments of functions.
* Therefore FORM has a special environment that allows manipulation of 
* function arguments.
CFunction f;
Symbols x,y;
Local expr = f(x,f(x));

id x = y;
Print expr;
.sort

argument;
  id x = y;
endargument;
Print expr;
.sort

argument;
  argument;
    id x? = y^2;
  endargument;
endargument;

Print expr;
.end
