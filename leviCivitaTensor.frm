* leviCivitaTensor.frm
* section 2.3.5 Levi-Civita Tensor

Dimension 3;
Tensors eps(AntiSymmetric), delta(Symmetric);
Indices i,j,k,l,m,n;

* three repeated indices
Local F1= eps(i,j,k) * eps(i,j,k);

id eps(i?,j?,k?) * eps(i?,j?,k?) = 6;
Print F1;
.sort

* two repeated indices
Local F2 = eps(i,j,k) * eps(i,j,l);

id eps(i?,j?,k?) * eps(i?,j?,l?) = delta(k,l);
Print F2;
.sort

* one repeated index
Local F3 = eps(i,j,k) * eps(i,l,m);

id eps(i?,j?,k?) * eps(i?,l?,m?) = delta(j,l)*delta(k,m) - delta(j,m)*delta(k,l);
Print F3;
.sort

* no repeated index
Local F4 = eps(i,j,k) * eps(n,m,l); * instead of eps(l,m,n);

id eps(i?,j?,k?) * eps(l?,m?,n?) = eps(i,j,k)*eps(l,m,n);
Print F4;
.end
