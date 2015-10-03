* symmetric.frm

Symbols x1,x2,x3,x4,x5;
* S(symmetric) measn that we declare a function S with symmetric in its arguments.
Functions S(symmetric), A(antisymmetric), C(cyclic), R(rcyclic);
* The name of the local function is
*   [S(x2,x3,x4,x1,x5)]
* and the expression is the right hand side.
Local [S(x2,x3,x4,x1,x5)] = S(x2,x3,x4,x1,x5);
Local [A(x2,x3,x4,x1,x5)] = A(x2,x3,x4,x1,x5);
Local [(x2,x3,x4,x1,x5)] = C(x2,x3,x4,x1,x5);
Local [C(x2,x3,x4,x1,x5)] = C(x2,x3,x4,x1,x5);
Local [R(x2,x3,x4,x1,x5)] = R(x2,x3,x4,x1,x5);
Print;
.end
