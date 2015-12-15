* qqttZ.frm
*
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
*
*          \                    /       q(p1)\   / Z(p5)          /
*           \ q(p1)            / t(p3)        \ /          t(p3) /
*            \                /                *                /
*             \g(j1)*T(c1)   /                  \fprop(u,q3)   /
*              *^^^^^^^^^^^^*  g(j2)*T(c2)       *^^^^^^^^^^^^*
* fprop(d,q1) /   gprop(q2)  \                  / gprop(q4)    \
*            * j3             \                /                \tbar(p4)
*  qbar(p2) / \                \ tbar(p4)     /qbar(p2)          \
*          /   \ Z(p5)          \            /                    \
*
*          \              t(p3) /       q(p1)\                    /
*           \ q(p1)            *----          \            t(p3) /
*            \                / Z(p5)          \                /
*             \g(j1)*T(c1)   /                  \              /
*              *^^^^^^^^^^^^*  g(j2)*T(c2)       *^^^^^^^^^^^^*
*             /   gprop(q2)  \                  / gprop(q4)    \
*            /                \                /                *----
*  qbar(p2) /                  \ tbar(p4)     /qbar(p2)          \ Z(p5)
*          /                    \            /           tbar(p4) \
*
* t-propagators are massive
*
* From Professor Ferroglia's code:
* emission of the Z from p1 (i.e. top right diagram)
*
* -R(vb(1,p2),d97)*i_*gs/2*
* R(g_(1,mu1),d97,d94)*(-i_)*
* R(g_(1,p1)-g_(1,p5),d94,d95)*i_*ge/2/cw*
* R(g_(1,mu3)*(-2*sw^2*Qq*gi_(1) + I3q*(gi_(1)+g5_(1))),d95,d99)*
* R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p3+p4)*
* prop(p1-p5)*
* R(ub(2,p4),d98)*i_*gs/2*R(g_(2,mu2),d98,d96)*R(v(2,p3),d96)*
* C(ll(a2),i98,i96)
*
* emission of the Z from p4 (outgoing top at this stage)
*
* -R(vb(1,p2),d97)*i_*gs/2*
* R(g_(1,mu1),d97,d99)*
* R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
* propM(p4+p5)*R(ub(2,p4),d98)*
* i_*ge/2/cw*R(g_(2,mu3)*(
* -2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
* ((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*
* i_*gs/2*R(g_(2,mu2),d95,d96)*R(v(2,p3),d96)*
* C(ll(a2),i98,i96)



#include standardAmplitude.frm
* i's are spinor indices, j's are Lorentz indices
* c's are colour indices, d's are the label for su(N) generators

* Take the spinor along the fermion line, (oppositely) !!
* The index k7 of g(i2,i3,k7) is for 7th gamma matrix given by (1-g5).
Local Amp = 
            VB(i1,p2,mq,c1)*
            i_/cw *(g(i1,i2,j1) *e(j1,p5)) *
            ((I3q/2)*g(i2,i3,k7) - Qq*sw^2*d_(i2,i3) )*
            fprop(i3,i4,q1,mq)* (g(i4,i5,j2)*T(c1,c2,d1)) *U(i5,p1,mq,c2)*
            gprop(j2,j3,q2,d1,d2)*
            UB(i6,p3,mt,c3)* (g(i6,i7,j3)*T(c3,c4,d2)) *V(i7,p4,mt,c4)
            +
* This is corresponding to top right diagram:
            VB(i1,p2,mq,c1)* (g(i1,i2,j1)*T(c1,c2,d1)) *fprop(i2,i3,q3,mq)*
            i_/cw *(g(i3,i4,j2) *e(j2,p5)) *
            ((I3q/2)*g(i4,i5,k7) - Qq*sw^2*d_(i4,i5) ) *
            U(i5,p1,mq,c2)*
            gprop(j1,j3,q4,d1,d2)*
            UB(i6,p3,mt,c3)*g(i6,i7,j3)*T(c3,c4,d2)*V(i7,p4,mt,c4)
            +
            VB(i1,p2,mq,c1)* (g(i1,i2,j1)*T(c1,c2,d1)) * U(i2,p1,mq,c2)*
* This also works, using momentum conservation explicitly.
            gprop(j1,j2,p1+p2, d1,d2)*
*            gprop(j1,j2,q10, d1,d2)*
            UB(i3,p3,mt,c3)*
            i_/cw *(g(i3,i4,j3) *e(j3,p5)) *
            ((I3q/2)*g(i4,i5,k7) - Qq*sw^2*d_(i4,i5) )*
            fprop(i5,i6,q11 ,mt)*
            (g(i6,i7,j2)*T(c3,c4,d2))*
            V(i7,p4,mt,c4)
            +
            VB(i1,p2,mq,c1)* (g(i1,i2,j1)*T(c1,c2,d1)) * U(i2,p1,mq,c2)*
            gprop(j1,j2,q10, d1,d2)*
            UB(i3,p3,mt,c3)*
            (g(i3,i4,j2)*T(c3,c4,d2))*
            fprop(i4,i5,q12,mt)*
            i_/cw *(g(i5,i6,j3) *e(j3,p5)) *
            ((I3q/2)*g(i6,i7,k7) - Qq*sw^2*d_(i6,i7) )*
            V(i7,p4,mt,c4)
            ;

#call squareamplitude(Amp,M)
.sort

id 1/sqrt_(2)/sqrt_(2) = 1/2;

* to eliminate intermediate q1 and q2

id q1 = p5 - p2;
id q2 = p3 + p4;
id q3 = p1 - p5;
id q4 = p3 + p4;

id q10 = p1+p2;
id q11 = p3+p5;
id q12 = p4+p5;

argument;
  id q1 = p5 - p2;
  id q2 = p3 + p4;
  id q3 = p1 - p5;
  id q4 = p3 + p4;

  id q10 = p1+p2;
  id q11 = p3+p5;
  id q12 = p4+p5;
endargument;
.sort

id p3.p3 = mt^2;
id p4.p4 = mt^2;
argument;
  id p3.p3 = mt^2;
  id p4.p4 = mt^2;
endargument;

* Bracket [N^2-1], N,g;
* Print +s;
* .sort

id p5 = p1+p2 - p3-p4;
argument;
  id p5 = p1+p2 - p3-p4;
endargument;
.sort

id p1.p1 = mq^2;
id p2.p2 = mq^2;
id p3.p3 = mt^2;
id p4.p4 = mt^2;
argument;
  id p1.p1 = mq^2;
  id p2.p2 = mq^2;
  id p3.p3 = mt^2;
  id p4.p4 = mt^2;
endargument;

id mq = 0;
* inside propagator
argument;
  id mq = 0;
endargument;

Bracket prop;
* Bracket prop, mw, mw^(-1);
Print +s;
.end
.sort

*********************************************************************************

* Here I will implement the convertor toward Maxima readable form.

*********************************************************************************

Function eta;

id p1?.p2? = eta(p1,p2);
argument;
  id p1?.p2? = eta(p1,p2);
endargument;

Bracket prop, mw;
* Bracket prop, mw, Qq, I3q;
Print +s;

.end
