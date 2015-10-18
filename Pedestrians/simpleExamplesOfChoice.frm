* simpleExamplesOfChoice.frm
* chapter 3.1.1 Choice
*
* True  = it has a non-zero value
* False = if it is zero

#define two "2"
#define three "3"
#define four "4"
#define quatro "4"

Off statistics;

Symbols x2, ..., x5;
Local F'two' =
* x%y is the remainder when x is divided by y.
#if {'two'%2} == 0
  1
#else
  -1
#endif
;

Local F'three' =
#if {'three'%2} == 0
  1
#else
  -1
#endif
;

Local F'four' =
#switch {'four'/2}
#case {'quatro'/2}
  + x2
* #break

#case 'three'
  + x3
#break

#case 2
  + x4

#default
  + x5
#endswitch
;

Print;
.clear
***********************************************************************
* The preprocessor does not ALWAYS interpret string value numerically
* or in the same way as we would do.
* E.g. rational numbers are rounded to integers (in the direction to zero)
* before any further processing, in case curly bracket are present.

#define minustwothird "-2/3"

Off statistics;

Local expr1a = 'minustwothird';
Local expr1b =
#if 'minustwothird' > -3/2
  1
#elseif 'minustwothird' == 0
  0
#else
  'minustwothird'
*  -1
#endif
;

Local expr1c =
#if {'minustwothird'} > -3/2
  1
#elseif {'minustwothird'} == 0
  0 
#endif
;

Local expr1d = {'minustwothird'};
Print;
.end
