* restrictionsOnReplacements.frm

Off statistics;

Symbols a,b,c,d;
Functions f,g;
Index i;

Set bcSet : b,c;
Local F1 = a*b*c;

* Using select option, the replacement rule will only be applied 
* if after the matching of the left hand side,
* no elements of the mentioned sets are left anywhere in the term.

* The first replacement rule is not applied,
* because after matching ab in the product abc, 
* the element c of the set {b,c} is left behind.
id select bcSet a*b   = b^2;
id select bcSet a*b*c = b^2*c^2;

Print;
.sort

Local F2 = f(i,a)*b + f(i,b)*c;

* Thia third replacement rule is applied to first term of F2 only.
* After matching, a symbol in the second term of F2
* there is still an element of the set {b,c} left, but why?

* id select bcSet a? = g(d);
id select bcSet c? = g(d);

Print;
.clear

***************************************************************

Off statistics;

Symbols a,b,x,y,z;
Local F0 = (x+y)^4;
Print F0;
.sort

Local F1 = (x+y)^4;
* default is many
id many x = z;
* id x = z;
Print F1;
.sort

Local F1 = (x+y)^4;
* no second attempt of pattern matching
id once x = z;
Print F1;
.sort

Local F2 = (x+y)^4;
id x*y = z;
Print F2;
.sort

Local F3 = (x+y)^4;
* only option implies that the match must be exact.
id only x*y = z;
Print F3;
.sort

Local F4 = (a+b)^2 * (x+y)^2;
Print F4;
.sort

* multi option means a single matching with multiplicity.
* e.g. when it applies a*b*x*y, only a*b is taken out with multiplicity one.
* The other product, viz.(namely), x*y is left untouched.
id multi x?*y? = z;
Print F4;
.sort

Local F5 = a*b*x*y;
Print F5;
.sort

id multi x?*y? = z;
Print F5;
.clear

**********************************************************

Off statistics;

Symbols x,y,z;
Local F = x^2*y + y + 1;

* The below statement will lead to a jump to (label 1;) line
* if there is a match and after the substitution has been made.
id ifmatch->1 x=z;
  id y=0;
label 1;
Print;
.clear

* Logically the above code is equivalent to

Off statistics;

Symbol x,y,z;
Local F = x^2*y + y + 1;

if ( match(x) );
  id x = z;
else;
  id y = 0;
endif;

Print;
.end
