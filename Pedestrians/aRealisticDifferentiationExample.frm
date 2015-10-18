* section 2.5.3

* Use Maxima, anyway.

Symbols x,y,n;
CFunctions sin,cos,tan,g;
Functions [sin], [cos], [tan], [-sin], [1/cos^2], f, dx;
Set commuting: sin, cos, tan;
Set noncommuting: [sin], [cos], [tan];
Set derivative: [cos], [-sin], [1/cos^2];

Local expr = sin(x)*tan(x) + cos(x);

id g?commuting?noncommuting(x) = g(x);
Multiply left dx;

repeat;
  id dx*g?noncommuting[n](x) = derivative[n](x) + g(x)*dx;
  id [-sin](x) = - [sin](x);
  id [1/cos^2](x) = 1/[cos](x) * 1/[cos](x);
endrepeat;

id dx = 0;
id f?noncommuting?commuting(x) = f(x);
id 1/f?noncommuting?commuting(x) = 1/f(x); *
Print;
.end

