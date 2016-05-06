* qqttZp1.frm
* p1-emmision part only, for debugging
*
* Ray D. Sameshima
*
*    q(p1)\   / Z(p5)          /
*          \ /          t(p3) /
*           *                /
* fprop(u,q3)\              /
*             *^^^^^^^^^^^^*
*            / gprop(q4)    \
*           /                \tbar(p4)
*          /qbar(p2)          \
*         /                    \
*
* t-propagators are massive
*
#include standardAmplitude.frm
* i's are spinor indices, j's are Lorentz indices
* c's are colour indices, d's are the label for su(N) generators
*
* Take the spinor along the fermion line, (oppositely) !!
* The index k7 of g(i2,i3,k7) is for 7th gamma matrix given by (1-g5).
Local Amp = 

* p1-emission
  VB(i1,p2,mq,c1) * 
  (i_ * g(i1,i2,j1) * T(c1,c2,d1)) * 
  fprop(i2,i3,q3,mq) *
  i_/cw *(g(i3,i4,j2) * e(j2,p5,mz)) * 
    ((I3q/2) * g(i4,i5,k7) - Qq * sw^2 * d_(i4,i5) ) * 
  U(i5,p1,mq,c2) *
  gprop(j1,j3,q4,d1,d2) *
  UB(i6,p4,mt,c3) * 
  (i_ * g(i6,i7,j3) * T(c3,c4,d2)) * 
  V(i7,p3,mt,c4)
  ;

#call squareamplitude(Amp,M)
.sort

id 1/sqrt_(2)/sqrt_(2) = 1/2;

id q3 = p1 - p5;
id q4 = p3 + p4;

argument;
  id q3 = p1 - p5;
  id q4 = p3 + p4;
endargument;

.sort
 
* Bracket [N^2-1], N,g;
* Print +s;
* .sort

id p5 = p1+p2 -p3-p4;
argument;
  id p5 = p1+p2 -p3-p4;
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
argument;
  id mq = 0;
endargument;

Bracket prop;
* Bracket prop, mw, mw^(-1);
* Print +s;
* .end
.sort

*********************************************************************************

* Here I will implement the convertor toward Maxima readable form.

*********************************************************************************

Function eta;

id p1?.p2? = eta(p1,p2);
argument;
  id p1?.p2? = eta(p1,p2);
endargument;

.sort

* Bracket prop,mz;
* Bracket prop, mw, [N^2-1],Qq, I3q, Qt,I3t,cw,sw,mt,mz;
Bracket prop, [N^2-1], Qq,I3q, Qt,I3t,cw,cw,mz,mw;
Print +s;
.end
