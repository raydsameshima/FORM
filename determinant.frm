* determinant.frm

Symbols a,b,c,d;
CFunction M,N;
Indices i,j,k;
Local det = e_(i,j) * e_(1,2) * M(1,i) * M(2,j);
Local detOfN = e_(i,j,k) * e_(1,2,3) * N(1,i) * N(2,j) * N(3,k);
contract;
id M(1,1) = a;
id M(1,2) = b;
id M(2,1) = c;
id M(2,2) = d;
Print +s;
.end

* In the above example we use the most important command in FORM, id.
* An identification is a substitution or replacement.
* Here we do a straightforward replacement of matrix elements by their symbolic values.
* As we shall see in the next chapter, more general patterns are possible in FORM.

