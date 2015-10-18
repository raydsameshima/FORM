* substitution.frm
* section 2.1
*
* To summarize straightforward substitution:
* the lhs of the replacement rule may be a product of a few factors with exponents,
* but may not contain a numerical factor, or be a sum of terms.

Off statistics;

Symbol x;
Local expr = x + 1/x;
id x = x+1;
Print;
.sort

id x = x+1;
Print;
.sort

id 1/x = 1/(x+1);
Print;
.sort

Symbols x,y,z,k;
Local expr = sum_(k,-2,5,x^k);
Print;
.sort

id x^2 = y;
Print;
.sort

id x*y = z;
Print;
.sort

id 1/x = z^2;
Print;
*.sort
.clear

Off statistics;

Symbols x,y;
Local expr = x*y;
id x = expr;
Print;
.sort

id x = expr;
id x = expr;
Print;
.end
