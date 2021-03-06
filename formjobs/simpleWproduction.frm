* test.frm
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction u dbar -> W^+.
* 
* \ u(p1)
*  \
*   \j1      W(p5)
*    *-------
*   /
*  /
* /dbar(p2)
*


#include standardAmplitude.frm

* Take the spinor along the fermion line!!
* q1 is fprop(u), q2 is gprop
Local Amp = 
            VB(i1,p2,mq,c1)*
            (i_/sqrt_(2) *(g(i1,i2,j1) *e(j1,p5)) *(1/2)*g(i2,i3,k7))*
            U(i3,p1,mq,c1)
            ;

#call squareamplitude(Amp,M)
.sort

id 1/sqrt_(2)/sqrt_(2) = 1/2;

id mq = 0;
* inside propagator
argument;
  id mq = 0;
endargument;

id p5 = p1 + p2;

* massless quarks
id p1.p1 = 0;
id p2.p2 = 0;

Bracket [N^2-1];
* Bracket [N^2-1],prop(q1.q1) prop(q2.q2);
Print +s;
print "This is essentially Mandelstam s, and in cm system,"
print "p1=(k,0,0,k), p2=(k,0,0,-k) and p1.p2 = 2*k^2 >= 0."
.end
