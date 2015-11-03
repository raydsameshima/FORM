#-
#:ContinuationLines 100
*
*	The matrix element for the reaction
*	e-e+ -> tau-tau+ -> nu-tau e- nubar-e nu-mu mu+ nubar-tau
*	At low energies there is only one diagram!
*
#include amplitude.h
*
Local	Amp = VB(i1,pb,me)*g(i1,i2,j1)*U(i2,pa,me)
            *phprop(j1,j2,q)
            *UB(i3,p1,mnt)*g(i3,i4,j3)*g(i4,i5,k7)
            *fprop(i5,i6,q1,mt)*g(i6,i7,j2)*fprop(i7,i8,-q2,mt)
            *g(i8,i9,j4)*g(i9,i10,k7)*V(i10,p6,mnt)
            *UB(i11,p2,me)*g(i11,i12,j3)*g(i12,i13,k7)*V(i13,p3,mne)
            *UB(i14,p4,mnm)*g(i14,i15,j4)*g(i15,i16,k7)*V(i16,p5,mm)
            ;

#call squareamplitude(Amp,value)
.sort
Symbols	widthtau,s,factor;
Format C;
*
*	In the narrow width expansion we can replace the tau propagators:
*	
id	prop(q1.q1-mt^2)^2 = 1/2/mt/widthtau;
id	prop(q2.q2-mt^2)^2 = 1/2/mt/widthtau;
id	prop(q.q) = 1/s;
id	1/s^2/widthtau^2 = 4*factor*mt^2;
id	mt^2 = mt2;
id	me^2 = me2;
id	mt2^2 = mt4;
Bracket	factor;
Print +f;
.sort
#$fac = factorin_(value);
Multiply 1/(`$fac');
Print +f;
.sort
Skip;
#write <> "   value = value * (%$);",$fac
.end
