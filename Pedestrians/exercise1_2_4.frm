* exercise1_2_4.frm

Tensors a,b, A(antisymmetric);
Vectors x,y;
Indices i,j,k;

Local F1 = a(i,j) * x(j);
Local F2 = a(i,i) * x(j);
Local F3 = a(i,j) * x(i) * y(j);
* d_(i,j) is Kronecker delta.
Local F4 = d_(i,j) * x(i) * y(j);
* Print;
* .end

Local F5 = a(i,j)*x(i)*y(j) - a(j,i)*x(j)*y(i);
Local F6 = (a(i,j)+a(j,i))*x(i)*x(j) - 2*a(i,j)*x(i)*x(j);

Local F7 = A(i,j)*x(i)*x(j); 
Local [A(i,k)*A(k,j) - A(j,k)*A(k,i)] = A(i,k)*A(k,j) - A(j,k)*A(k,i);

Print;
.end
