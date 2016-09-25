* oneLoop.frm
* one loop qed examples, 2*n photon
*
AutoDeclare Vectors k,q,e;
AutoDeclare Indices m;
*
Local twoP 
        = (-1) * g_(1,q) * g_(1,e2) * g_(1,(q2)) * g_(1,e1);
Local fourP 
        = (-1) * g_(1,q)  * g_(1,e4) * g_(1,q4) * g_(1,e3)*
                 g_(1,q12)* g_(1,e2) * g_(1,q1) * g_(1,e1);
Local sixP 
        = (-1) * g_(1,q)  * g_(1,e6) * g_(1,q6) * g_(1,e5)*
                 g_(1,q56)* g_(1,e4) * g_(1,q123)*g_(1,e3)*
                 g_(1,q12) * g_(1,e2) * g_(1,q1) * g_(1,e1);
*
Trace4, 1;
Print;
.sort
.end
