* count.frm
* chapter 3.2.1

Symbols x,i;
Local F = sum_(i,0,6,x^i);

* The count function is for power counting.
* count(obj, weight, ...)
* counts the number of times the obj occurs wiwth given weight in the current term.
if (count(x,1) > 3) discard;

Print;
.clear

Off statistics;
Symbols x,i;
Local F = sum_(i,0,6,x^i);

* when x has weight 2, the term x^2 has a power counted as 4:
if (count(x,2) > 3) discard;

Print;
.clear

Off statistics;
Symbols x,i;
Local F = sum_(i,0,6,x^i);

if (count(x,1) = multipleof(3)) discard;
Print;
.clear

Off statistics;
Symbols a,b,i,j;
Local F = sum_(i,0,4, a^i/fac_(i)) * sum_(j,0,4, b^j/fac_(j));
Bracket b;
Print;
.sort

if (coefficient < 1/10) discard;

Bracket b;
Print;
.clear

Symbols x,y;
Local F = 1 + y^2 * x^4 + y^3 * x^5 + y^4 * x^6 + y^5 * x^7;

if (count(y,-1,x,2) > 7) discard;

Print;
.end
