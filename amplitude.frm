* amplitude.frm
* Peskin & Schroeder notation, see Appendix A.
* http://www.nikhef.nl/~t68/course/short.pdf

* i's are spinor indices
* j's are Lorentz indices
AutoDeclare Indices i,j;
* masses, e.g. me(mass of electrons),mmu(mass of muons) 
AutoDeclare Symbols m;
AutoDeclare Vectors p,k;
Vectors q;
* Vectors q,pe,pp,pa,pb,p1,...,p10;
* spinors, gamma matrices, and polarization
CFunctions  UB,U,VB,V,g,e;
CFunctions  fprop,phprop,prop;

#procedure squareamplitude(Amp,Mat)
.sort

* We skip everything but Amp, i.e. only operate on Amp.
* In Amp we look for the highest i(spinor) and j(Lorentz) indices
Skip; NSkip `Amp';

#$imax = 0;
#do i = 1,40
* naively assume 40 or less spinor indices
  if ( match(VB(i`i',?a)) || match(V(i`i',?a))
     || match(UB(i`i',?a)) || match(U(i`i',?a))
     || match(g(i`i',?a)) || match(g(i?,i`i',?a))
     || match(fprop(i`i',?a)) || match(fprop(i?,i`i',?a)) );
     $imax = `i';
  endif;
#enddo
#$jmax = 0;
#do j = 1,20
* naively assume 20 or less Lorentz indices
  if ( match(g(?a,j`j')) || match(phprop(j`j',?a)) 
     || match(phprop(j?,j`j',?a)) );
      $jmax = `j';
  endif;
#enddo
.sort

* Just for a check we print the highest i and j indices
#message highest i is i`$imax', highest j is j`$jmax';

* Now construct the conjugate
Skip;
Local `Amp'C = `Amp';
id  i_ = -i_;

* Make a new set of dummy indices above $imax and $jmax.
* I haven't seen <> notation, but this should clarify the pair of replacement.
Multiply replace_(<i1,i{`$imax'+1}>,...,<i`$imax',i{2*`$imax'}>);
Multiply replace_(<j1,j{`$jmax'+1}>,...,<j`$jmax',j{2*`$jmax'}>);

* Exchange rows and columns, i.e. transpose
id g(i1?,i2?,j?)      = g(i2,i1,j);
id fprop(i1?,i2?,?a)  = fprop(i2,i1,?a);
id phprop(j1?,j2?,p?) = phprop(j2,j1,p);

* and exchange U and UB, V and VBAR
Multiply replace_(UB,U,U,UB,VB,V,V,VB);

* gamma5 gets a minus sign. Hence k6 <--> k7
Multiply replace_(k6,k7,k7,k6);
id g(?a,k5) = -g(?a,k5);
.sort
* the end of the conjugation

* Now multiply Amp and AmpC to get the matrix element squared.
Skip;
* Drop(for efficiency): ... eliminates all expressions from the system
* We won't use (manipulate) Amp,AmpC anymore.
Drop,`Amp',`Amp'C;

Local `Mat' = `Amp'*`Amp'C;

* Spin sums, 1st terms are slashed p and 2nd terms are delta?
* (A.22)
id U(i1?,p?,m?)*UB(i2?,p?,m?) = g(i1,i2,p) + g(i1,i2)*m;
id V(i1?,p?,m?)*VB(i2?,p?,m?) = g(i1,i2,p) - g(i1,i2)*m;
* for external photons (A.26)
id e(j1?,p?)*e(j2?,p?) = -d_(j1,j2);

*   Propagators
id  fprop(i1?,i2?,p?,m?) = i_*(g(i1,i2,p)+g(i1,i2)*m)*prop(p.p-m^2);
* This should be eta(j1,j2) but the lorentz indices are only used for contraction of gamma matrices, and that's ok. 
id  phprop(j1?,j2?,q?) = d_(j1,j2)*prop(q.q);

*   String the gamma matrices together in traces.
repeat id g(i1?,i2?,?a)*g(i2?,i3?,?b) = g(i1,i3,?a,?b);
.sort

Skip; NSkip `Mat';

*   Now put the traces one by one in terms of the built in gammas
#do i = 1,10
  id,once,g(i1?,i1?,?a) = g_(`i',?a);
* g7_ = 1-g5_, g6_ = 1+g5_
  id  g_(`i',k7) = g7_(`i');
  id  g_(`i',k6) = g6_(`i');
  id  g_(`i',k5) = g5_(`i');
#enddo
.sort

*   Finally take the traces
#do i = 1,10
  Trace4,`i';
#enddo
#endprocedure
