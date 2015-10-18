* differentiation.frm
* section 2.3.3 Differentiation of Polynomials

Symbols x,y,m,n;
Local P = x^2*y^3 + x^3 + x^4*y^4;
Print;
.sort
* differentiation as a rewriting rule
id x^m?*y^n? = m*x^(m-1) * n*y^(n-1);
Print;
.end
