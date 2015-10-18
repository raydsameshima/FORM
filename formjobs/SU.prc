#procedure SU(N)
*
*   Routine evaluates SU(N) color traces.
*   We assume the existence of the function fff
*   The lambda's are represented by T
*   The fff(i,j,k) are defined by [T(i),T(j)] = i_*fff(i,j,k)/2*T(k)
*   The T(i) are related to the lambda's of QCD by
*   TT(a,b,i) = lambda(a,b,i)/2
*   In the input we assume that the T are traces and the
*   contracted index is omitted
*   Hence the T are strings T(i,j,k,....);
*   We convert to individual T's with properly summed indices.
*   For this we need the auxiliary function TT and the
*   indices i1,i2,i3,i4.
*   These indices must be in N dimensions (N of SU(N)), and at the
*   moment that this routine is called the default dimension must
*   be N. This is because we use the Cvitanovic algorithm for
*   contracted indices, and all our indices are converted to
*   dummy indices which have the default dimension. Hence the
*   d_'s must go into N. (P.Cvitanovi\'c, Phys. Rev. D14 (1976) 1536.)
*   Finally we convert back to the trace notation.
*   We also need the indices i,j,k to have been declared.
*
repeat;
    id,once,T(?a) = TT(i1,i1,?a)*nf;
    sum i1;
endrepeat;
repeat;
    id,once,TT(i1?,i2?,i?,j?,?a) = TT(i1,i3,i)*TT(i3,i2,j,?a);
    sum i3;
endrepeat;
repeat;
    repeat;
        id,once,fff(i?,j?,k?)*TT(i1?,i2?,i?) = TT(i1,i3,j)*TT(i3,i2,k)/i_
                                              -TT(i1,i3,k)*TT(i3,i2,j)/i_;
        sum i3;
        id,once,fff(k?,i?,j?)*TT(i1?,i2?,i?) = TT(i1,i3,j)*TT(i3,i2,k)/i_
                                              -TT(i1,i3,k)*TT(i3,i2,j)/i_;
        sum i3;
        id,once,fff(j?,k?,i?)*TT(i1?,i2?,i?) = TT(i1,i3,j)*TT(i3,i2,k)/i_
                                              -TT(i1,i3,k)*TT(i3,i2,j)/i_;
        sum i3;
    endrepeat;
    id,once,fff(i?,j?,k?) = TT(i1,i2,i)*TT(i2,i3,j)*TT(i3,i1,k)*2/i_
                           -TT(i1,i2,k)*TT(i2,i3,j)*TT(i3,i1,i)*2/i_;
    sum i1,i2,i3;
endrepeat;
repeat;
    id,once,TT(i1?,i2?,i?)*TT(i3?,i4?,i?) = 
                 (d_(i1,i4)*d_(i2,i3)-d_(i1,i2)*d_(i3,i4)/'N')/2;
endrepeat;
id TT(i1?,i1?,i?) = 0;
id TT(i1?,i2?,i?)*TT(i2?,i1?,j?) = d_(i,j)/2;

repeat;
    id TT(i1?,i2?,?a)*TT(i2?,i3?,?b) = TT(i1,i3,?a,?b);
endrepeat;
id TT(i1?,i1?,?a) = T(?a)/nf;
#endprocedure

