* functionCalls.frm
* 1.2.1 Functions
*
* there is no check on the type of a function and on the number of arguments
* in a function call untill something has to be done with the function.
* The empty argument in the third call of f replaced by zero.

Symbols x,y;
Commuting f;
Local F = f(x) + f(x,y) + f(x,,y);
Local G = f(x,,,y) + f(x) + f(x,y);
Print;
.end
