* pairAnnihilation.frm
* Pair annihilation into Photons
* e^- e^+ -> 2 photons
* (page 168 of Peskin and Schroeder)
*
*   ~e(j2,p2)                ~ e(j1,p1)
*    ~                      ~
*     ~                    ~
*      ~                  ~
*       ~ g(i3,i4,j2)    ~
*        *--------------* g(i1,i2,j1)
*       / fprop          \
*      /   (i2,i3,q2,me)  \
*     /                    \
*    /                      \
*   /U(i4,pe,me)             \VB(i1,pp,me)
*
*
*     e(j2,p2)~~_             _~~ e(j1,p1)
*                ~~_       _~~         
*                   ~~  _~~            
*                    _~~   ~_        
*                 _~~        ~~_ 
* +  g(i3,i4,j1) *--------------* g(i1,i2,j2)
*               / fprop          \
*              /   (i2,i3,q1,me)  \
*             /                    \
*            /                      \
*           /U(i4,pe,me)             \VB(i1,pp,me)
*
Off statistics;

* #include amplitude.h
#include amplitude.frm

Local	Amp = e(j1,p1)*g(i1,i2,j1)*VB(i1,pp,me)*
            fprop(i2,i3,q2,me)*
            e(j2,p2)*g(i3,i4,j2)*U(i4,pe,me)
		        + 
            VB(i1,pp,me)*g(i1,i2,j2)*fprop(i2,i3,q1,me)*g(i3,i4,j1)*U(i4,pe,me)
				    *e(j1,p1)*e(j2,p2)
		        ;

#call squareamplitude(Amp,M)
.sort

* for debugging
Print +s;
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

Print +s;
* Print +f;
.sort

Symbol [1/pe.p1], [1/pp.p1];
id pe.p1^-1 = [1/pe.p1];
id pp.p1^-1 = [1/pp.p1];

Bracket me;

Print +s;
* Print +f;
.end

.sort

* compare with the known result, eq.(5.105)
Local solution = -8*((pe.p1/pe.p2) + (pe.p2/p2.p1) + 2*me^2 * (1/pe.p1 + 1/pe.p2) - me^4*(1/pe.p1 + 1/pe.p2)^2);

Print +s;
.sort

Local difference = M - solution;
Print difference +s;

.end
