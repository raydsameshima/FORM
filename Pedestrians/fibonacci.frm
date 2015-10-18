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
.clear

************************************************************
* When the Drop statement is used, the expression can be used in the current module, 
* but after the next .sort or .store instruction the expression does NOT exist anymore.
* The Skip instruction inactivate the expression only for the range of the current module.

#define MAX "7"
Local F1 = 1;
Local F2 = 1;

#do n = 3, 'MAX'
  .sort
  Drop F{'n'-2};
  Skip F{'n'-1};
  Local F'n' = F{'n'-2} + F{'n'-1};
  Print;
#enddo
.clear

********************************************

Symbol x;
Local F19 = x^18;

#do i = 1,1
  id x^2 = x+1;
* the count function is for power counting
  if (count(x,1)>1) redefine i "0";
  .sort
#enddo

id x = 1;
Print;
.clear

************************************************************

#procedure fibonacci(F,n)
* Procedure to compute Fibonacci numbers
* Input: F: the function that represents the number
* It should have one argument, viz. n, which is
* for internal use and must be declared as a symbol
* before the procedure call.

repeat;
  id 'F'(1) = 1;
  id 'F'(2) = 1;
  id 'F'('n'?) = 'F'('n'-1) + 'F'('n'-2);
endrepeat;
#endprocedure

Symbol n;
CFunction F;
On statistics;
Local F19 = F(19);
#call fibonacci(F,n);
Print;
.end
