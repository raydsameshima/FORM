* vectorAndIndices.frm
* 1.2.2 Vector and Indices

* If you want to use v(i) of i-th vector v, 
* the indeces i must be declared.

* The default dimension of the underlying v.s. is 4, 
* but it can be changed by the Dimension Statement.

Vectors u,v,w;
Indices i,j;
Function f;

Local [u(1)+v(i)] = u(1) + v(i);
Local [u(i)*v(j)] = u(i) * v(j);

* FORM uses the Einstein summation convention.
Local [u(i)*u(i)] = u(i) * u(i);
Local [v(i)*u(i)] = v(i) * u(i);

* So called SCHOONSCHIP notation:
Local [f(i,j)*u(i)*v(j)] = f(i,j) * u(i) * v(j);

* This is a bad example that FORM fails to evaluate:
Local [u(i)*v(i)*w(i)] = u(i)*v(i)*w(i);
Print;
.end
