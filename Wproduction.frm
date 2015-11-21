* Wproduction.frm
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
*
*          \                    /       u(p1)\   / W^+(p5)        /
*           \ u(p1)            / t(p3)        \ /          t(p3) /
*            \                /                *                /
*             \g(j1)*T(c1)   /                  \fprop(dbar,q3)/
*              *^^^^^^^^^^^^*  g(j2)*T(c2)       *^^^^^^^^^^^^*
* fprop(u,q1) /   gprop(q2)  \                  / gprop(q4)    \
*            * j3             \                /                \tbar(p4)
*  dbar(p2) / \                \ tbar(p4)     /dbar(p2)          \
*          /   \ W^+(p5)        \            /                    \
*

#include standardAmplitude.frm

* Take the spinor along the fermion line!!
* q1 is fprop(u), q2 is gprop
* The index k7 of g(i2,i3,k7) is for 7th gamma matrix given by (1-g5).
Local Amp = 
            VB(i1,p2,mq,c1)*(i_/sqrt_(2) *(g(i1,i2,j1) *e(j1,p5)) *(1/2)*g(i2,i3,k7))*
            fprop(i3,i4,q1,mq)* (g(i4,i5,j2)*T(c1,c2,d1)) *U(i5,p1,mq,c2)*
            gprop(j2,j3,q2,d1,d2)*
            UB(i6,p3,mt,c3)*g(i6,i7,j3)*T(c3,c4,d2)*V(i7,p4,mt,c4)
*            ;
            +
            VB(i1,p2,mq,c1)* (g(i1,i2,j1)*T(c1,c2,d1)) * fprop(i2,i3,q3,mq) *
            (i_/sqrt_(2) * (g(i3,i4,j2) *e(j2,p5)) * (1/2)*g(i4,i5,k7)) * U(i5, p1, mq, c2)*
            gprop(j1,j3,q4,d1,d2)*
            UB(i6,p3,mt,c3)*g(i6,i7,j3)*T(c3,c4,d2)*V(i7,p4,mt,c4);

#call squareamplitude(Amp,M)
.sort

id 1/sqrt_(2)/sqrt_(2) = 1/2;

* to eliminate intermediate q1 and q2

id q1 = p5 - p2;
id q2 = p3 + p4;
id q3 = p1 - p5;
id q4 = p3 + p4;
argument;
  id q1 = p5 - p2;
  id q2 = p3 + p4;
  id q3 = p1 - p5;
  id q4 = p3 + p4;
endargument;

* id p1.p1 = mq^2;
* id p2.p2 = mq^2;
* argument;
*   id p1.p1 = mq^2;
*   id p2.p2 = mq^2;
* endargument;

* argument;
*   argument;
*     id p1.p1 = mq^2;
*     id p2.p2 = mq^2;
*   endargument;
* endargument;

id p3.p3 = mt^2;
id p4.p4 = mt^2;
argument;
  id p3.p3 = mt^2;
  id p4.p4 = mt^2;
endargument;

Bracket [N^2-1], N,g;
Print +s;
.sort

id p5 = p1+p2 - p3-p4;
argument;
  id p5 = p1+p2 - p3-p4;
endargument;

id p1.p1 = mq^2;
id p2.p2 = mq^2;
id p3.p3 = mw^2;
argument;
  id p1.p1 = mq^2;
  id p2.p2 = mq^2;
  id p3.p3 = mw^2;
endargument;

id mq = 0;
* inside propagator
argument;
  id mq = 0;
endargument;

Bracket [N^2-1], prop, mw;
Print +s;
.end
