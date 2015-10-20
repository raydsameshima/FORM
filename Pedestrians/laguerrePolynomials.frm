* laguerrePolynomials.frm

* easy, but inefficient implementation
Symbols a,x,n;
CFunction L;

Local L8 = L(8,a,x);

repeat;
  id L(1,a,x) = 1;
  id L(2,a,x) = 1+a-x;
  id L(n?,a,x) = (2*n+a-1-x)/n * L(n-1,a,x) - (n+a-1)/n * L(n-2,a,x);
endrepeat;
Print;
.sort

* less obvious, but efficient program
Symbols a,x,n, last, secondLast, dummy;
CFunction LL;

Local LL8 = LL(2,1+a-x,1) * dummy^6;

repeat;
  id LL(n?, last?, secondLast?) * dummy =
     LL(n+1, (2*n+a+1-x)/(n+1) * last - (n+a)/(n+1) * secondLast, last);
endrepeat;

id LL(n?, last?, secondLast?) = last;
Print;
.sort

Local [0] = L8 - LL8;
Print;
.end
