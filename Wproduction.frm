* Wproduction.frm
* Ray D. Sameshima
* 
*	Program for working out the matrix element squared for the
*	reaction q,qbar -> t,tbar in QCD.
*
*          \                    /       u(p1)\   / W^+(p5)        /
*           \ u(p1)            / t(p3)        \ /          t(p3) /
*            \                /                *                /
*             \g(j1)*T(c1)   /                  \fprop(dbar)   /
*              *^^^^^^^^^^^^*  g(j2)*T(c2)       *^^^^^^^^^^^^*
*    fprop(u) /     gprop    \                  /              \
*            * j3             \                /       tbar(p4) \
*  dbar(p2) / \                \ tbar(p4)     /dbar(p2)          \
*          /   \ W^+(p5)        \            /                    \
*

#include standardAmplitude.frm

Local Amp = VB(i1,p2,mq,c1)*(1/(2*sqrt_(2)))*g_(j3, 7)*eW(j3,p5)* fprop(i2,i3,p2+p5,mq)*
            g(i1,i2,j1)*T(c1,c2,d1)*
            U(i2,p1,mq,c2)*
            gprop(j1,j2,q,d1,d2)*
            UB(i3,k1,mt,c3)*g(i3,i4,j2)*T(c3,c4,d2)*V(i4,k2,mt,c4)
            +
            VB(i1,p2,mq,c1)*
            g(i1,i2,j1)*T(c1,c2,d1)*
            U(i2,p1,mq,c2)*(1/(2*sqrt_(2)))*g_(j3, 7)*eW(j3,p5)* fprop(i2,i3,p1+p5,mq)*
            gprop(j1,j2,q,d1,d2)*
            UB(i3,k1,mt,c3)*g(i3,i4,j2)*T(c3,c4,d2)*V(i4,k2,mt,c4)
            ;

#call squareamplitude(Amp,M)
.sort

Symbols	s,t,u;

* id	prop(q.q) = 1/s;
id	p1.p2 = s/2-mq^2;
id	k1.k2 = s/2-mt^2;
id	p1.k1 = mq^2/2+mt^2/2-t/2;
id	p2.k2 = mq^2/2+mt^2/2-t/2;
id	p1.k2 = mq^2/2+mt^2/2-u/2;
id	p2.k1 = mq^2/2+mt^2/2-u/2;
id	u = 2*mq^2+2*mt^2-s-t;

* id mq = 0;
* id mt = 0;

Bracket [N^2-1];
Print +s;
.end
