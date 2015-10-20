* oddAndEven.frm
* 2.3 Patterns in Replacement Rules

Symbols x,y;
Functions odd, even;

Local ODD = odd(-x);
Local EVEN = even(-x);
Local F = odd(-x-y) + even(-x-y) + odd(x-y) + odd(-x+y);

id odd(-x?) = -odd(x);
id even(-x?) = even(x);

Print;
.end
