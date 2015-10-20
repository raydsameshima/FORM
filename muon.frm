* muon.frm
* http://www.nikhef.nl/~t68/course/short.pdf
*
*	Program for working out the matrix element squared for the
*	reaction e-e+ -> mu-mu+ in QED.
* 
*  \ e^-(p1)       / mu^-(k1)
*   \             /
*    \j1         /
*     *~~~~~~~~~*
*    /         j2\
*   /             \
*  / e^+(p2)       \ mu^+(k2)
*
*
#include amplitude.h
* #include amplitude.frm

Local	Amp = VB(i1,p2,me)*g(i1,i2,j1)*U(i2,p1,me)*
		        phprop(j1,j2,q)*
		        UB(i3,k1,mmu)*g(i3,i4,j2)*V(i4,k2,mmu);

#call squareamplitude(Amp,M)
.sort

Symbols	s,t,u;

id	prop(q.q) = 1/s;
id	p1.p2 = s/2-me^2;
id	k1.k2 = s/2-mmu^2;
id	p1.k1 = me^2/2+mmu^2/2-t/2;
id	p2.k2 = me^2/2+mmu^2/2-t/2;
id	p1.k2 = me^2/2+mmu^2/2-u/2;
id	p2.k1 = me^2/2+mmu^2/2-u/2;
id	u = 2*me^2+2*mmu^2-s-t;

Print +s;
.end
