* vectorAndIndices.frm
* 1.2.2 Vector and Indices

* If you want to use v(i) of i-th vector v, 
* the indeces i must be declared.

* The default dimension of the underlying v.s. is 4, 
* but it can be changed by the Dimension Statement.

Vectors u,v,w;
Indices i,j;
Function f;
Local w1 = u(1) + v(i);
Local w2 = u(i) * v(j);

* FORM uses the Einstein summation convention.
Local w3 = u(i) * u(i);
Local w4 = v(i) * u(i);

* So called SCHOONSCHIP notation:
Local w5 = f(i,j) * u(i) * v(j);

* This is a bad example that FORM fails to evaluate:
Local w6 = u(i)*v(i)*w(i);
Print;
.end
