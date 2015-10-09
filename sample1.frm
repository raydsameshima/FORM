* sample1.frm

* The first line informs the system that a and b are algebraic symbols.
Symbols a,b;
* The second line defines [(a+b)^2] as a local expression.
* If you want to use special characters, then you must surround the name with square bracket[].
Local [(a+b)^2] = (a+b)^2;
Local [(a+b)^3] = (a+b)^3;
Local [(a+2*b)^4] = (a+2*b)^4;
Print;
.end
