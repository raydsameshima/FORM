* buildInSets.frm

Off statistics;

Symbols x,n;
Local F = sum_(n,-3,3,x^n);
Print;
.sort

id x^n?pos_ = 0;
Print;
.sort

id x^n?!even_ = 0;
Print;
.end
