* if.frm
* Chapter 3.2.1 Choice

Off statistics;

Symbols a,b,c;
Local F = a*c + b*c;

* This match function selects only those terms that have an a inside.
if (match(a)); 
* if (match(a) = 1); 
  id c = a;
endif;

Print;
.clear

Off statistics;
Symbols a,b,c;
Local F = a*c + b*c;

* Now only those expressions are selected that do NOT contain an a.
if (match(a)=0) id c = a;
Print;
.clear

Off statistics;
Symbols a,b,c;
Local F = a*c + b*c;

id c = a;

Print;
.end
