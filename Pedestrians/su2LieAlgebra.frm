* su2LieAlgebra.frm
* The generators are h,e,f, satisfying
*  [h,e] = 2*e,
*  [h,f] = -2*f,
*  [e,f] = h.
*
* The enveloping algebra has Poincaré-Birkhoff-Witt basis
*   h^i * e^j * f^k.

Off statistics;
Functions h,e,f;
FunPowers allfunpowers;

Local [f^3*e^2*h] = f^3 * e^2 * h;
Local [h, f*e^2*f^3] = h * f*e^2*f^3 - f*e^2*f^3 * h;

repeat;
  id e*h = h*e - 2*e;
  id f*h = h*f + 2*f;
  id f*e = e*f - h;
endrepeat;

Print +s;
.end
