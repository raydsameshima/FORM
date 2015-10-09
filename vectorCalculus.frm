* vectorCalculus.frm

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
.end
