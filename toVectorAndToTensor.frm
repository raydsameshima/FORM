* toVectorAndToTensor.frm

* FORM has convenience methods to replace tensors by a product of vector components and vice versa.
* ... but for me, these experessions are unclear.
* It seems no definition of t, but FORM implicitly assume the forms of each t.

Tensor t;
Vectors u,v;
Indices i,j,k;
Local F1 = v(i)*v(j)*v(k)*v(1);
Local F2 = v;
Local F3 = (u.v)^2 * v.v;
ToTensor v,t;
Print;
.sort

Local F4 = t;
ToVector t,v;
Print;
.end
