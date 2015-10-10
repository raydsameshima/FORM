* fibonacci.frm
* 1 1 2 3 5 ...

* The sequence
*   1 x x^2 x^3 x^4 ...
* has the Fibonacci property, provided x^2 = x+1:

Symbol x;
Local Fib19 = x^18;

repeat;
  id x^2 = x+1;
endrepeat;

* initial condition
id x = 1;
Print;
.end
