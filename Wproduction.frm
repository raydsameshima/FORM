* Wproduction.frm
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
*
*          \                    /       u(p1)\   / W^+(p5)        /
*           \ u(p1)            / t(p3)        \ /          t(p3) /
*            \                /                *                /
*             \g(j1)*T(c1)   /                  \fprop(dbar)   /
*              *^^^^^^^^^^^^*                    *^^^^^^^^^^^^*
*    fprop(u) /     gprop    \ g(j2)*T(c2)      /              \
*            *                \                /       tbar(p4) \
*  dbar(p2) / \                \ tbar(p4)     /dbar(p2)          \
*          /   \ W^+(p5)        \            /                    \
*

#include standardAmplitude.frm

* Take the spinor along the fermion line!!
* q1 is fprop(u), q2 is gprop
Local Amp = 
            VB(i1,p2,mq,c1)*(i_/sqrt_(2) *(g(i1,i2,j1) *e(j1,p5)) *(1/2)*g(i2,i3,k7))*
            fprop(i3,i4,q1,mq)* (g(i4,i5,j2)*T(c1,c2,d1)) *U(i5,p2,mq,c2)*
            gprop(j2,j3,q2,d1,d2)*
            UB(i6,p3,mt,c3)*g(i6,i7,j3)*T(c3,c4,d2)*V(i7,p4,mt,c4)
            ;
*            +
*            VB(i1,p2,mq,c1)* (g(i1,i2,j1)*T(c1,c2,d1)) * fprop(i2,i3,q3,mq) *
*            (i_/sqrt_(2) * (g(i3,i4,j2) *e(j2,p5)) * (1/2)*g(i4,i5,k7)) * U(i5, p1, mq, c2)*
*            gprop(j1,j3,q4,d1,d2)*
*            UB(i6,p3,mt,c3)*g(i6,i7,j3)*T(c3,c4,d2)*V(i7,p4,mt,c4);

#call squareamplitude(Amp,M)
.sort

id 1/sqrt_(2)/sqrt_(2) = 1/2;

id mq = 0;
* inside propagator
argument;
  id mq = 0;
endargument;

* id q1 = p5 - p2;
*argument;
*  id q1 = p5 - p2;
*endargument;

* Symbols	s,t,u;
* 
* id	prop(q.q) = 1/s;
* id	p1.p2 = s/2-mq^2;
* id	k1.k2 = s/2-mt^2;
* id	p1.k1 = mq^2/2+mt^2/2-t/2;
* id	p2.k2 = mq^2/2+mt^2/2-t/2;
* id	p1.k2 = mq^2/2+mt^2/2-u/2;
* id	p2.k1 = mq^2/2+mt^2/2-u/2;
* id	u = 2*mq^2+2*mt^2-s-t;
*
* id mq = 0;
* id mt = 0;

Bracket [N^2-1];
* Bracket [N^2-1],prop(q1.q1) prop(q2.q2);
Print +s;
.end
