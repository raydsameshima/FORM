* standardAmplitude.frm
* Ray D. Sameshima
* rewrite amplitude.frm and qcdAmplitude.frm 
*
* Peskin & Schroeder notation, see Appendix A.
* http://www.nikhef.nl/~t68/course/short.pdf

Symbol N, [N^2-1];

* i's are spinor indices, j's are Lorentz indices
* c's are colour indices, d's are the label for su(N) generators
* So, the generator for su(N) has indices like T(c1,c2,d1).
AutoDeclare Indices i,j,c,d;
*for gamma matrices
AutoDeclare Index k;
* masses
AutoDeclare Symbols m;
* momemtums
AutoDeclare Vectors p;
* momentum transfer (dummy)
AutoDeclare Vectors q;
* spinors, gamma matrices(g), 
* and Gell-Mann matrices(T), polarization for photon
CFunctions  UB,U,VB,V, g,T,e;
* U(i2,p1,m,c) =  U(spinorindex, momentum, mass, colourindex) 
* gprop(j1?,j2?,q?,d1?,d2?) = -d_(j1,j2)*prop(q.q) * ddelta(d1,d2);
CFunctions gprop,fprop,phprop,prop;
* for contractions of indices c's and d's
CFunction cdelta, ddelta;

#procedure squareamplitude(Amp,Mat)
.sort

* Off statistics;

* We skip everything but Amp, i.e. only operate on Amp.
* In Amp we look for the highest i(spinor) and j(Lorentz) indices
Skip; NSkip 'Amp';

#$imax = 0;
#do i = 1,40
* naively assume 40 or less spinor indices
  if (  match(VB(i'i',?a)) || match(V(i'i',?a))
     || match(UB(i'i',?a)) || match(U(i'i',?a))
     || match(g(i'i',?a)) || match(g(i?,i'i',?a))
     || match(fprop(i'i',?a)) || match(fprop(i?,i'i',?a)) 
     );
     $imax = 'i';
  endif;
#enddo
#$jmax = 0;
#do j = 1,20
* naively assume 20 or less Lorentz indices
  if (  match(g(?a,j'j')) || match(phprop(j'j',?a)) 
     || match(phprop(j?,j'j',?a)) 
     || match(gprop(j'j',?a))
     || match(gprop(j?,j'j',?a))
     || match(e(j'j',?a))
     );
     $jmax = 'j';
  endif;
#enddo
#$cmax = 0;
#do c = 1,40
* naively assume 40 or less colour indices
  if (  match(VB(?a,c'c')) || match(V(?a,c'c'))
     || match(UB(?a,c'c')) || match(U(?a,c'c'))
     || match(T(c'c',?a))  || match(T(c?,c'c',?a))
     );
     $cmax = 'c';
  endif;
#enddo
#$dmax = 0;
#do d = 1,20;
* naively assume 20 or less generators(for su(3), N = 8)
  if( match(T(?a,d'd'))
    || match(gprop(?a,d'd',d?))
    || match(gprop(?a,d'd'))
    );
    $dmax = 'd';
  endif;
#enddo

.sort

* Just for a check we print the highest i and j indices
#message highest i is i'$imax', highest j is j'$jmax';
#message highest c is c'$cmax', highest d is d'$dmax';

* for debugging
* Print +s;
* .end

* Now construct the conjugate
Skip;
Local 'Amp'C = 'Amp';
id  i_ = -i_;

* for debugging
* Print +s;
* .end

* Make a new set of dummy indices above $imax and $jmax.
* I haven't seen <> notation, but this should clarify the pair of replacement.
Multiply replace_(<i1,i{'$imax'+1}>,...,<i'$imax',i{2*'$imax'}>);
Multiply replace_(<j1,j{'$jmax'+1}>,...,<j'$jmax',j{2*'$jmax'}>);
Multiply replace_(<c1,c{'$cmax'+1}>,...,<c'$cmax',c{2*'$cmax'}>);
Multiply replace_(<d1,d{'$dmax'+1}>,...,<d'$dmax',d{2*'$dmax'}>);

* for debugging
* Print +s;
* .end

* Exchange rows and columns, i.e. takeing the transposes.
id g(i1?,i2?,j?)      = g(i2,i1,j);
id T(c1?,c2?,d?)      = T(c2,c1,d);
id fprop(i1?,i2?,?a)  = fprop(i2,i1,?a);
id phprop(j1?,j2?,q?) = phprop(j2,j1,q);
id gprop(j1?,j2?,q?,d1?,d2?) = gprop(j2,j1,q,d2,d1);

* for debugging
Print +s;
.end

* and exchange U and UB, V and VBAR
Multiply replace_(UB,U,U,UB,VB,V,V,VB);

* gamma5 gets a minus sign. Hence k6 <--> k7
Multiply replace_(k6,k7,k7,k6);
id g(?a,k5) = -g(?a,k5);
.sort
* The end of the conjugations.

* for debugging
* Print +s;
* .end
* .sort

* Now multiply Amp and AmpC to get the matrix element squared.
Skip;
* Drop(for efficiency): ... eliminates all expressions from the system
* we won't use (manipulate) Amp,AmpC anymore.
Drop,'Amp','Amp'C;

Local 'Mat' = 'Amp'*'Amp'C;

* for debugging
* Print +s;
* .sort
* .end

* Spin sums, 1st terms are slashed p and 2nd terms are delta?
* (A.22) of Peskin & Schroeder
id U(i1?,p?,m?,c1?)*UB(i2?,p?,m?,c2?) = (g(i1,i2,p) + g(i1,i2)*m) * cdelta(c1,c2);
id V(i1?,p?,m?,c1?)*VB(i2?,p?,m?,c2?) = (g(i1,i2,p) - g(i1,i2)*m) * cdelta(c1,c2);
* for external photons (A.26)
* need to replace massive W boson, check the sign
* see http://www.hep.lu.se/atlas/thesis/egede/thesis-node15.html
id e(j1?,p?)*e(j2?,p?) = -d_(j1,j2) - p(j1)* p(j2)/(mw^2);
* id e(j1?,p?)*e(j2?,p?) =  p(j1)* p(j2)/(mw^2);
* id e(j1?,p?)*e(j2?,p?) = -d_(j1,j2) + p(j1)* p(j2)/(mw^2);

* for debugging
* Print +s;
* .end
.sort

* Propagators
id fprop(i1?,i2?,p?,m?) = i_*(g(i1,i2,p)+g(i1,i2)*m)*prop(p.p-m^2);
id phprop(j1?,j2?,q?) = -d_(j1,j2)*prop(q.q);
id gprop(j1?,j2?,q?,d1?,d2?) = -d_(j1,j2)*prop(q.q) * ddelta(d1,d2);

*   String the gamma matrices together in traces.
repeat id g(i1?,i2?,?a)*g(i2?,i3?,?b) = g(i1,i3,?a,?b);
.sort

* for debugging
* Print +s;
.sort

Skip; NSkip 'Mat';

* How can I treat "non-diagonal" g's?

*   Now put the traces one by one in terms of the built in gammas
#do i = 1,10
  id, once, g(i1?,i1?,?a) = g_('i',?a);
* g7_ = 1-g5_, g6_ = 1+g5_
  id  g_('i',k7) = g7_('i');
  id  g_('i',k6) = g6_('i');
  id  g_('i',k5) = g5_('i');
#enddo
.sort

* for debugging
* Print +s;
* .sort
* .end

* Finally take the traces, naively assuming less than 10 fermions.
#do i = 1,10
  Trace4,'i';
#enddo

* Bracket T;
* Print +s;
* Print[];
.sort
* .end

* qcd trace by hand
* eq.(3.25) of QCD practice
* We didn't assume the symmetric property on ddelta.
id T(c1?, c2?, d1?)* ddelta(d1?,d2?) = T(c1,c2,d2);
id T(c1?, c2?, d1?)* ddelta(d2?,d1?) = T(c1,c2,d2);
repeat id T(c1?,c2?,d1?)*T(c3?,c4?,d1?) = 1/2 * (cdelta(c1,c4)*cdelta(c2,c3) - 1/N * cdelta(c1,c2)*cdelta(c3,c4));
repeat id cdelta(c1?,c2?)*cdelta(c2?,c3?) = cdelta(c1,c3);
repeat id cdelta(c1?,c2?)*cdelta(c3?,c2?) = cdelta(c1,c3);
repeat id ddelta(d1?,d2?)*ddelta(d2?,d3?) = ddelta(d1,d3);
repeat id ddelta(d1?,d2?)*ddelta(d3?,d2?) = ddelta(d1,d3);

id cdelta(c1?,c1?) = N; 

* Bracket T,N, ddelta,cdelta;
*Print;
*.sort
* .end
id ddelta(d1?,d1?) = N^2-1;

id N^2 = [N^2-1] + 1;

Bracket [N^2-1];
* Print +s;
* Print[];
.sort
* .end

* id ddelta(d1?,d2?) = 0;
* id cdelta(c1?,c2?) = 0;
* .sort

* Bracket N;
* Print[];
* .sort
* .end

#endprocedure
