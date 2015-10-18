* polynomialSubstitutions.frm

Off statistics;

Symbols x,y,z,n;
Local F = x^2 + y^3 + 1;

* every symbol is replaced by z
id x? = z;
Print;

* every power of z is replaced by x, including 1 = z^0
id z^n? = x;
.sort

Off statistics;
Local G = F + y^2 + 1;

* any symbol to any power goes into z
id x?^n? = z;
Print G;
.end
