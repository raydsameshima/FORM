* diracAlgebra.frm

Off statistics;

Functions g3,...,g0,g,h;
Local [g5] = i_ * g0*g1*g2*g3;
Local [g5^2] = [g5]^2;
Local [g0g5+g5g0] = g0*[g5] + [g5]*g0;
Local [g1g5+g5g1] = g1*[g5] + [g5]*g1;
Local [g2g5+g5g2] = g2*[g5] + [g5]*g2;
Local [g3g5+g5g3] = g3*[g5] + [g5]*g3;

Local [g2*g1] = g2*g1;

repeat;
  id g0*g0 = 1;
  id g?*g? = -1;
  id disorder h? * g? = -g*h;
*   id disorder g? * h? = -h*g;
endrepeat;
* Above implementation is the same as
*   id g2*g1 = -g1*g2;
*   ...
*   id g4*g3 = -g3*g4;
* but this is rather cumbersome.
* It is much easier to rely on the internal ordering of the functions and to have just one identification like
*   id g? * h? = -h*g;
* But when we repeat such a replacement rule, we would get into an infinite loop.
* Here is the error message:

* === Workspace overflow. 40000000 bytes is not enough.
* === Change parameter WorkSpace in form.set
* Program terminating at diracAlgebra.frm Line 29 --> 
*   0.01 sec out of 0.00 sec

* With disorder option, the identification is applied when the "normal ordering" of terms in the pattern would change the order of the functions, if they were commuting.

Print;
.end
