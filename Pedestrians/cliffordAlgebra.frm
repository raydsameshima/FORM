* cliffordAlgebra.frm
*
* 6-dimensional Clifford algebra
* e(i)^2 = 1, e(i)*e(j) = -e(j)*e(i)

#define DIM "6";

Symbol i;
Function e;

Local expr = (sum_(i, 1, 'DIM', e(i)))^3;

repeat;
  #do i = 1,'DIM'
    #do j = 'i'+1, 'DIM'
      id e('j') * e('i') = -e('i') * e('j');  
    #enddo
    id e('i') * e('i') = 1;
  #enddo
endrepeat;

Print;
.end
