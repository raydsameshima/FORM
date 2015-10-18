* exercises1_4_7_5.frm

Off statistics;

Dimension 3;
Vectors A,B,C,D;
Indices i,j,k,l,m,n,o,p;

* Local [AxB.AxB(i)] = e_(i,j,k)*A(j)*B(k) * e_(i,m,n)*A(m)*B(n);
Local [AxB.AxB] = e_(i,A,B)*e_(i,A,B);
Local [(AxB)xC -Ax(BxC)] = e_(i,j,k)*(e_(j,m,n)*A(m)*B(n)) * C(k)
                         - e_(i,j,k)*A(j) * (e_(k,m,n)*B(m)*C(n));
Local [i-th Jacobi] = e_(i,j,k)*A(j) * (e_(k,m,n)*B(m)*C(n))
                    + e_(i,j,k)*B(j) * (e_(k,m,n)*C(m)*A(n))
                    + e_(i,j,k)*C(j) * (e_(k,m,n)*A(m)*B(n));
Local [(AxB)x(CxD)] = e_(i,j,k) * (e_(j,l,m)*A(l)*B(m))*
                                  (e_(k,n,o)*C(n)*D(o));
Local F = e_(i,A,B)*e_(i,C,D) + e_(i,B,C)*e_(i,A,D) + e_(i,C,A)*e_(i,B,D);

contract;
Print;
.end
