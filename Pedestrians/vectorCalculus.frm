* vectorCalculus.frm

**********************************************
* coordinate free calculations
**********************************************

* in 3-dim space (R^3)
Dimension 3;

Vectors u,v,w; 
Indices i,j,k,l,m,n; 
Off statistics; 

* the k-th component of vector product of u and v 
Local [uxv]     = e_(i,j,k) * u(i) * v(j);

* triple scalar product of u,v and w
Local [uxv.w]   = e_(i,j,k) * u(i) * v(j) * w(k);

* triple vector product of u,v and w
Local [ux(vxw)] = e_(i,j,k) * u(i) * (e_(m,n,j) * v(m) * w(n));

contract;
Print;
.sort

**********************************************
* more explicit expressions
**********************************************

Dimension 3;
Vectors u,v,w;
Indices i,j,k,l,m,n;
Off statistics;

Local [uxv](k)      = e_(1,2,3) * e_(i,j,k) * u(i) * v(j);
Local [uxv.w]       = e_(1,2,3) * e_(i,j,k) * u(i) * v(j) * w(k);
* The expression below is made global so that it survive the .store command at the end of the second module and can be used in the last part of this program.
Global [ux(vxw)](k) = e_(i,j,k) * u(i) * (e_(m,n,j) * v(m) * w(n));
contract;
* The Bracket w instruction forces the expression [uxv.w] to be printed as a polynomial in the components of the vector w.
Bracket w;
Print [uxv.w];
Print [uxv];
.sort

Bracket v;
Print [uxv.w];
.sort

AntiBracket u,v;
Print [uxv];
.store

Off statistics;
Local [(ux(vxw)(1)] = [ux(vxw)](1);
Local [(ux(vxw)(2)] = [ux(vxw)](2);
Local [(ux(vxw)(3)] = [ux(vxw)](3);
Print;
.end
