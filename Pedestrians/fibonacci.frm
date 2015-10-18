* fibonacci.frm
* 1 1 2 3 5 ...

* The sequence
*   1 x x^2 x^3 x^4 ...
* has the Fibonacci property, provided x^2 = x+1:

* Off statistics;

Symbol x;
Local Fib19 = x^18;

repeat;
  id x^2 = x+1;
endrepeat;

* initial condition
id x = 1;
Print;
.sort

* Off statistics;

Symbol last, secondLast, dummy;
Function F;
Local Fib19 = F(1,1) * dummy^17;

repeat;
  id F(last?, secondLast?) * dummy = F(last+secondLast, last);
endrepeat;

id F(last?, secondLast?) = last;
Print;
.sort

* A downward recursion is less efficient:
Symbol n;
Function F;
Local Fib19 = F(19);

repeat; 
  id F(1)  = 1;
  id F(2)  = 1;
  id F(n?) = F(n-1) + F(n-2);
endrepeat; 

Print;

.end
