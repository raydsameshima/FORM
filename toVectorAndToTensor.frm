* toVectorAndToTensor.frm

* FORM has convenience methods to replace tensors by a product of 
* vector components and vice versa.

* ... but for me, these experessions are unclear.
* It seems no definition of t, but FORM implicitly assume the forms of each t.
*
* Inplicitly, t is defined as v^4 as a tensor product, and therefore
* [(u.v)^2*v.v] = t(u,u,N1_?,N1_?)

Tensor t;
Vectors u,v;
Indices i,j,k,l;
Functions f;

Off statistics;

Local [v(i)*v(j)*v(k)*v(1)] = v(i)*v(j)*v(k)*v(1);
Local [v] = v;
Local [(u.v)^2 * v.v] = (u.v)^2 * v.v;
ToTensor v,t;
Print;
.sort

Local [t] = t;
ToVector t,v;
Print;
.end
