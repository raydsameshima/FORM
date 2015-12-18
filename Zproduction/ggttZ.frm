* ggttZ.frm
*
* Ray D. Sameshima
* 
*
*          \              t(p3) /       g(p1)\                    /
*           \ g(p1)            *----          \            t(p3) /
*            \                / Z(p5)          \                /
*             \g(j1)*T(c1)   /                  \fprop(dbar,q3)/
*              *^^^^^^^^^^^^*  g(j2)*T(c2)       *^^^^^^^^^^^^*
*             /   gprop(q2)  \                  / gprop(q4)    \
*            /                \                /                *----
*     g(p2) /                  \ tbar(p4)     / g(p2)            \ Z(p5)
*          /                    \            /           tbar(p4) \
*
* gluon vertices has structure constants f^{a,b,c}
* 

* structure constants of qcd (SU(3)) colour algebra:
CFunction structure;

#include standardAmplitude.frm
* i's are spinor indices, j's are Lorentz indices
* c's are colour indices, d's are the label for su(N) generators

* Take the spinor along the fermion line, (oppositely) !!
* q1(downward) is fprop(u), q2(right) is gprop
* q3(downward) is fprop(dbar), q4(right) is gprop 
* The index k7 of g(i2,i3,k7) is for 7th gamma matrix given by (1-g5).
Local Amp = 
* I have to replace this line to tripel-gluon line.
            e(j1,p1,mg,c1)*e(j2,p2,mg,c2)* 
* This is the structure constant.
            structure(d1,d2,d3)*
* This is for test. ********************
            e(j3,p1+p2,mg,c3)
****************************************
*
*            gprop(j1,j2,p1+p2, d3,d4)*
*            UB(i3,p3,mt,c3)*
*            i_/cw *(g(i3,i4,j3) *e(j3,p5,mz)) *
*            ((I3q/2)*g(i4,i5,k7) - Qq*sw^2*d_(i4,i5) )*
*            fprop(i5,i6,q11 ,mt)*
*            (g(i6,i7,j2)*T(c3,c4,d4))*
*            V(i7,p4,mt,c4)
*            +
*            e(j1,p1,mg,c1)*e(j2,p2,mg,c2)* 
*            structure(d1,d2,d3)*
*            gprop(j1,j2,p1+p2, d3,d4)*
*            UB(i3,p3,mt,c3)*
*            (g(i3,i4,j2)*T(c3,c4,d4))*
*            fprop(i4,i5,q12,mt)*
*            i_/cw *(g(i5,i6,j3) *e(j3,p5,mz)) *
*            ((I3q/2)*g(i6,i7,k7) - Qq*sw^2*d_(i6,i7) )*
*            V(i7,p4,mt,c4)
            ;

* for structure constants
* This is special for above terms, since I have assumed c5,c6,c7 are not used.
id structure(d1?,d2?,d3?) = -2*i_* (T(c5,c6,d1)*T(c6,c7,d2)*T(c7,c5,d3) - T(c5,c6,d2)*T(c6,c7,d1)*T(c7,c5,d3));

print +s;
.sort

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
Print +s;

.end
