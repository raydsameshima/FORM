#-
*
*	The matrix element for the reaction e-e+ -> e-e+ in QED
*	Note the - sign between the diagrams.
*
#include amplitude.h
*
L	Amp = VB(i1,pp,me)*g(i1,i2,j1)*U(i2,pe,me)
		 *phprop(j1,j2,q)
		 *UB(i3,pmm,me)*g(i3,i4,j2)*V(i4,pmp,me)
		- UB(i1,pmm,me)*g(i1,i2,j1)*U(i2,pe,me)
		 *phprop(j1,j2,qq)
		 *VB(i3,pp,me)*g(i3,i4,j2)*V(i4,pmp,me)
		;
#call squareamplitude(Amp,M)
.sort
S	s,t,u;
id	prop(q.q) = 1/s;
id	prop(qq.qq) = 1/t;
id	pe.pp = s/2-me^2;
id	pmm.pmp = s/2-me^2;
id	pe.pmm = me^2-t/2;
id	pp.pmp = me^2-t/2;
id	pe.pmp = me^2-u/2;
id	pp.pmm = me^2-u/2;
id	u = 4*me^2-s-t;
Print +f;
.end

