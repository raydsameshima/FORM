* contractionOfIndices.frm

* The automatic sum of indices is called contraction.
* We can overrule the contraction in FORM by specifying a zeroth dimension for the index in the declaration.
* In this case, explicit sum is still possible by the sum statement.
* FORM does NOT distinguish between upper and lower indices.
* Using tensor calculas, we will implement this concept.

Vector u;
Index i=0;

Off statistics;

* no contraction over index i
Local P = u(i) * u(i);

Print;
.sort

sum i;
Print;
.sort

Function f;
Local F = f(i);
sum i, 1, 3, 5;
Print F;
.end
