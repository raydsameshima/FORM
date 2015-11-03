* ttbarproduction.frm
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
* 
*  \ q(p1)            / t(k1)
*   \                /
*    \g(j1)*T(c1)   /
*     *^^^^^^^^^^^^*
*    /  gprop       \ g(j2)*T(c2)
*   /                \
*  / qbar(p2)         \ tbar(k2)
*
* The input is the amplitude or i_*M
*   Amp = VB(i1,p2,mq = 0,c1)*g(i1,i2,j1)*T(c1,c2,d1)*U(i2,p1,0,c2)*
*         gprop(j1,j2,q,d1,d2)*
*	        UB(i3,k1,mt=0,c3)*g(i3,i4,j2)*T(c3,c4,d2)*V(i4,k2,0,c4);
* where c's are the colour indices, 
* and d's are the label of generators(orientations in the group space) 
* from 1 to N^2-1.

#include qcdAmplitude.frm

Local Amp = VB(i1,p2,mq,c1)*g(i1,i2,j1)*T(c1,c2,d1)*U(i2,p1,mq,c2)*
            gprop(j1,j2,q,d1,d2)*
*            phprop(j1,j2,q)*d_(d1,d2)*
            UB(i3,k1,mt,c3)*g(i3,i4,j2)*T(c3,c4,d2)*V(i4,k2,mt,c4);

#call squareamplitude(Amp,M)
.sort

Symbols	s,t,u;

id	prop(q.q) = 1/s;
id	p1.p2 = s/2-mq^2;
id	k1.k2 = s/2-mt^2;
id	p1.k1 = mq^2/2+mt^2/2-t/2;
id	p2.k2 = mq^2/2+mt^2/2-t/2;
id	p1.k2 = mq^2/2+mt^2/2-u/2;
id	p2.k1 = mq^2/2+mt^2/2-u/2;
id	u = 2*mq^2+2*mt^2-s-t;

id mq = 0;
* id mt = 0;

Bracket [N^2-1];
Print +s;
.sort
#message Need to compare with the known result, see the following link:
#message http://arxiv.org/pdf/0806.2301.pdf

Local solution = 2*[N^2-1]*((t-mt^2)^2 + (u-mt^2)^2 + 2*mt^2*s)/s^2;
id u = 2*mt^2 -s-t;
.sort

#message My solution is consistent with the known result. 
Local difference = M - solution;
Print;
.end
