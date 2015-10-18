* powersOfFunctions.frm

Function f;
Commuting g;
Tensor t;

Local expr = f*f*g*g*t*t;
Print;
.sort

FunPowers nofunpowers;
Print;
.sort

FunPowers commutingonly;
Print;
.sort

FunPowers allfunpowers;
Print;
.end
