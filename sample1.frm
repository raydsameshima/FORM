* sample1.frm
* 1.1.2 Our First Example

* The first line informs the system that a and b are 
* algebraic symbols.
Symbols a,b;
* The second line defines [(a+b)^2] as a local expression.
* If you want to use special characters, 
* then you must surround the name with square bracket[].
Local [(a+b)^2] = (a+b)^2;
Print;
.end
