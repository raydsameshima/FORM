* symmetric.frm
* 1.2.1 Functions

Symbols x1,x2,x3,x4,x5;

* S(symmetric) measn that we declare a function S 
* with symmetric in its arguments.

Functions S(symmetric), A(antisymmetric), C(cyclic), R(rcyclic);
* The name of the local function is
*   [S(x2,x3,x4,x1,x5)]
* and the expression is the right hand side.
*
* You'll see that FORM automatically uses the symmetric properties of the functions
* to bring the arguments into standard order (determined by the order in which 
* objects have been declared).

Local [S(x2,x3,x4,x1,x5)] = S(x2,x3,x4,x1,x5);
Local [A(x2,x3,x4,x1,x5)] = A(x2,x3,x4,x1,x5);
Local [(x2,x3,x4,x1,x5)] = C(x2,x3,x4,x1,x5);
Local [C(x2,x3,x4,x1,x5)] = C(x2,x3,x4,x1,x5);
Local [R(x2,x3,x4,x1,x5)] = R(x2,x3,x4,x1,x5);
Print;
.end
