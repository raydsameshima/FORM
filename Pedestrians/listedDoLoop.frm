* listedDoLoop.frm
*
* We "escape" a comma in 2\, so that it is read as one parameter 
* with string value "2,i".
* The 1st term is a bit strange:
* FORM indeed picks the terms between the round bracket in one step
* and processes them recursively, one by one, from left to right.

Off statistics;

Indices i,j,k;
Function T;
Local expr =
#do p = {1,i|2\,i|j,(k,k)}
* #do p = {1, i, 2\,i, j, (k,k)}
  + T('p')
#enddo
;
Print;
.clear

************************************************************
* check that 
*   exp(1+x) - 1 = x
* up to order 50 in series expansions 

#define N "50"
On statistics;

Symbols i, x(:'N'), y(:'N');

* define ln(1+x)
Local X = -sum_(i,1,'N',(sign_(i)/i) * x^i);

* tag x by y
id x = x*y;

* so that we can use the telescope formula of exp(x)-1.
* in this example, the expansion will be slow.

#do i=2, 'N'+1
  id y = 1 + x*y/'i';
* This program becomes about 125 times faster 
* by sorting the terms after each substitution.
* We have added a commentary to the .sort instruction
* so that the statistics shows which step of the do-loop is involved.
  .sort: step 'i';
#enddo

Print;
.end
