* pauliMatrices.frm

Off statistics;

Dimension 3;
Function s;
Index k;

Local [s(1)*s(2)] = i_*e_(1,2,3)*e_(1,2,k)*s(k);
Local [s(2)*s(3)] = i_*e_(1,2,3)*e_(2,3,k)*s(k);
Local [s(3)*s(1)] = i_*e_(1,2,3)*e_(3,1,k)*s(k);

contract;
Print;
.sort

Local F = ( s(1)*s(2) + s(1) + s(2) + s(3))^4;
repeat;
  id s(2)*s(1) = -s(1)*s(2);
  id s(3)*s(2) = -s(2)*s(3);
  id s(1)*s(3) = -s(3)*s(1);
  id s(1)*s(2) = [s(1)*s(2)];
  id s(2)*s(3) = [s(2)*s(3)];
  id s(3)*s(1) = [s(3)*s(1)];
  id s(1)^2 = 1;
  id s(2)^2 = 1;
  id s(3)^2 = 1;
endrepeat;

Print F;
.end
