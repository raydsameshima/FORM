* declarations.frm
* 1.2.1 Functions
*
* Declarations
Functions f,g;
CFunctions F,G;
Symbol x;
*
* Specifications, e.g. no runtime statistics
Off statistics;
*
* Definitions
* local expression with only non commuting functions
Local F1 = f(x)*g(x) + g(x)*f(x);
*
* Output
Print;
*
* end of module
* The .sort statement is a directive to FORM to execute a program block,
* sort the result in standard ordering, and prepare for further processing.
.sort
*
* local expression with only commuting functions
Local F2 = F(x)*G(x) + G(x)*F(x);
Print F2;
*
* terminate the program
.end
