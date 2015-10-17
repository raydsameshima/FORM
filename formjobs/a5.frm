Symbols a,b,c,d,e,f,g;
Local F = (a+b+c+d+e+f+g)^20;
.sort
#do i = 20,1,-1
id g^`i' = (-b-c-d-e-f)*g^{`i'-1};
.sort: i = `i';
#enddo
Print;
.end
