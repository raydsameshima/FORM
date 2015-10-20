#-
*
*	Program for working out the matrix element squared for the
*	reaction e-e+ -> mu-mu+ in QED.
*
#include amplitude.h
*
L	Amp = VB(i1,pp,me)*g(i1,i2,j1)*U(i2,pe,me)
		 *phprop(j1,j2,q)
		 *UB(i3,pmm,mm)*g(i3,i4,j2)*V(i4,pmp,mm)
		;
#call squareamplitude(Amp,M)
.sort
S	s,t,u;
id	prop(q.q) = 1/s;
id	pe.pp = s/2-me^2;
id	pmm.pmp = s/2-mm^2;
id	pe.pmm = me^2/2+mm^2/2-t/2;
id	pp.pmp = me^2/2+mm^2/2-t/2;
id	pe.pmp = me^2/2+mm^2/2-u/2;
id	pp.pmm = me^2/2+mm^2/2-u/2;
id	u = 2*me^2+2*mm^2-s-t;
Print +f;
.sort
Format C;
Print +f;
.sort
S	s2,t2,si,si2,me2,mm2,me4,mm4;
Format C;
id	s^2 = s2;
id	1/s^2 = si2;
id	1/s = si;
id	t^2 = t2;
id	me^2 = me2;
id	mm^2 = mm2;
id	me2^2 = me4;
id	mm2^2 = mm4;
Print +f;
.end

