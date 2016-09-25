* oneLoop.frm
* one loop qed examples, 2*n photon
*
AutoDeclare Vectors k,q,e;
AutoDeclare Indices m;
*
Local twoP 
        = (-1) * g_(1,q) * g_(1,e2) * g_(1,q2) * g_(1,e1);

Trace4, 1;
Print;
.sort
*
id q2 = q + k2;
* momentum conservation
id k2 = -k1;
* transverse
id e1.k1 = 0;
*
Print twoP;
.sort
*
Local fourP 
        = (-1) * g_(2,q)  * g_(2,e4) * g_(2,q4) * g_(2,e3)*
                 g_(2,q12)* g_(2,e2) * g_(2,q1) * g_(2,e1);
*
id q4 = q + k4;
id q12= q - k1 - k2;
id q1 = q - k1;
*
id k4 = -k1-k2-k3;
*
id e1.k1 = 0;
id e2.k2 = 0;
id e3.k3 = 0;
*
Trace4, 2;
Print fourP;
.sort
*
Local sixP 
        = (-1) * g_(1,q)  * g_(1,e6) * g_(1,q6) * g_(1,e5)*
                 g_(1,q56)* g_(1,e4) * g_(1,q123)*g_(1,e3)*
                 g_(1,q12) * g_(1,e2) * g_(1,q1) * g_(1,e1);
*
id q6 = q + k6;
id q56= q + k5 + k6;
id q123 = q - k1 - k2 - k3;
id q12 = q - k1 - k2;
id q1 = q -k1;
id k6 = -k1-k2-k3-k4-k5;
id e1.k1=0;
id e2.k2=0;
id e3.k3=0;
id e4.k4=0;
id e5.k5=0;
*
Print;
.end
