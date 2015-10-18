* contractionOfIndices.frm
* 1.2.2 Vectors and Indices

* The automatic sum of indices is called contraction.
* We can overrule the contraction in FORM by specifying a zeroth dimension 
* for the index in the declaration.
* In this case, explicit sum is still possible by the sum statement.
* FORM does NOT distinguish between upper and lower indices.
* Using tensor calculus, we will implement this concept.

Vector u;
Index i=0;

Off statistics;

* no contraction over index i
Local P = u(i) * u(i);

Print;
.sort
* The .sort statement is a directive to FORM to execute a program block,
* sort the result, and prepare for the further processing.

sum i;
Print;
.sort

* After the .sort, we can declare any objects.
Function f,g;
Local F = f(i);
Local [f(i)*g(i)] = f(i) * g(i);
sum i, 1, 3, 5;
Print F;
Print [f(i)*g(i)];
.end
