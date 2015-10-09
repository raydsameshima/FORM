* tensor.frm

* The components of CTensor are commuting.
* To declare a non commuting tensor, use NTernsor.
* In this example, we consider a sum of two products of tensors and explcitly tell FORM that common indices are summed over.
* In this way, the system will recognize the equall terms in the expression.

Tensors S,T;
Indices i,j,k,l;

Off statistics;

Local F = S(i,k)*T(k,j) + S(i,l)*T(l,j);
Print;
.sort

sum k,l;
Print;
.end
