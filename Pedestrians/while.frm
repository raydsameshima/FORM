* while.frm
* 3.2.2

Off statistics;

Symbols x,y,z;
Local F = x^3 * y^5;

while (match(x*y^2));
  id x*y^2 = z;
endwhile;

Print;
.end
