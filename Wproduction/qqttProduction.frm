* qqttProduction.frm
* Ray D. Sameshima
*
* This is for debugging
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
*
*          \                    /       
*           \ u(p1)            / t(p3) 
*            \                /       
*             \g(j1)*T(c1)   /       
*              *^^^^^^^^^^^^*  g(j2)*T(c2) 
*             /   gprop(q2)  \              
*            /                \             
*  dbar(p2) /                  \ tbar(p4)  
*          /                    \            

#include standardAmplitude.frm
* i's are spinor indices, j's are Lorentz indices
* c's are colour indices, d's are the label for su(N) generators

* Take the spinor along the fermion line, (oppositely) !!
* q1(downward) is fprop(u), q2(right) is gprop
* q3(downward) is fprop(dbar), q4(right) is gprop 
* The index k7 of g(i2,i3,k7) is for 7th gamma matrix given by (1-g5).
Local Amp = 
            VB(i1,p2,mq,c1)* (g(i1,i2,j2)*T(c1,c2,d1)) *U(i2,p1,mq,c2)*
            gprop(j2,j3,q2,d1,d2)*
            UB(i6,p3,mt,c3)* (g(i6,i7,j3)*T(c3,c4,d2)) *V(i7,p4,mt,c4)
            ;
            
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

Bracket prop, mw, mw^(-1);
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
