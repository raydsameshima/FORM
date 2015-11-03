#-
#include amplitude.h
*
Local	Amp = VB(i1,pp,me)*g(i1,i2,j1)*fprop(i2,i3,q2,me)*g(i3,i4,j2)*U(i4,pe,me)
			    	*e(j1,p1)*e(j2,p2)
		        + VB(i1,pp,me)*g(i1,i2,j2)*fprop(i2,i3,q1,me)*g(i3,i4,j1)*U(i4,pe,me)
				    *e(j1,p1)*e(j2,p2)
		        ;

#call squareamplitude(Amp,M)
.sort
Symbols	s,t,u;
id	prop(q1.q1-me^2) = -1/2/p1.pe;
id	prop(q2.q2-me^2) = -1/2/p1.pp;
id	q1 = pe-p1;
id	q2 = p1-pp;
id	p1.p1 = 0;
id	pp.pp = me^2;
id	pe.pe = me^2;
id	pe.pp = me^2+p1.pe+p1.pp;
Print +f;
.end

