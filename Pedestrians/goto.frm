* goto.frm
* 3.2.3

Off statistics;

Symbol x;
Local F = 1;
Label 1;
Multiply x;

if (count(x,1) < 10);
  goto 1;
endif;

Print;
.end
