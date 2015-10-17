Symbols N,nf,[N^2-1],x;
CFunctions T,TT,fff;
Dimension [N^2-1];
Indices i,j,k;
I a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a,b;
Dimension N;
Indices i1,i2,i3,i4;

L	[dF4^2] = (T(a1,a2,a3,a4)+T(a1,a2,a4,a3)+T(a1,a3,a2,a4)
			+T(a1,a3,a4,a2)+T(a1,a4,a2,a3)+T(a1,a4,a3,a2))/6
			*(T(a1,a2,a3,a4)+T(a1,a2,a4,a3)+T(a1,a3,a2,a4)
			+T(a1,a3,a4,a2)+T(a1,a4,a2,a3)+T(a1,a4,a3,a2))/6;

L	d10915 = -fff(a1,a2,a5)*fff(a2,a3,a6)*fff(a3,a4,a7)*fff(a4,a1,a8)
		*T(a5,a6,a9)*T(a7,a8,a9)
		;

#call SU(N)
Print;
.end
