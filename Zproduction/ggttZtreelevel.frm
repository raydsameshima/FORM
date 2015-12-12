#-
off warnings; 
off statistics;
********************************************************************************
*
* New York, November 2, 2015
*  
* process gg -> ttZ at the tree level; 
*
* Try to calculate the tree level, once and for all
*
********************************************************************************
*
* DECLARATIONS
*
dimension d;
cf AuxTopo,TopoSave;
cf NoSwap,Swap;
cf pol,v3,v4,v5;
cf prop,propM;
cf Sprop(s),SpropM(s);
s CA,CF,[N^2-2];
*s 
*#do g=1,218
*d'g'
*#enddo
   ;
cf 
Quark1,gluon,ghost,Ghost,Z,vQQZ,vQQg,
vggg,vGGg,vgggg,pQuark,pQuarkM,pgluon,pghost,DE;
s j1,j2,j3,j4,j5;
s n1,n2,n3,n4,n5;
s [],[xi],t1,u1,[p1.r1],[p2.r2],[t1+u1];

v k,l,p1,p2,p3,p4,p5,m1,m2,m3,m4,m5;
v q1,q2;
v v1,v2;
v pa,pb,r1,r2;

v k1,k2,k3,k12,k13,k23,k123,k4,k5;
v mk,mk1,mk2,mk3,mk12,mk13,mk23,mk123;
v l1,l2,l3,l12,l13,l23,l123;
v ml,ml1,ml2,ml3,ml12,ml13,ml23,ml123;
v kml,kml1,kml2,kml3,kml12,kml13,kml23,kml123;
v mkml,mkml1,mkml2,mkml3,mkml12,mkml13,mkml23,mkml123;
v p12,p13,p23,p123;
v mp,mp1,mp2,mp3,mp12,mp13,mp23,mp123;

s x,n,x1,x2,x3,x4;
s aaa;
i mu99,mu98,mu97,mu96,mu95,mu93,nu1,nu2,nu3,nu4,nu11,nu12,nu13,
  mu1,mu2,mu3,mu4,mu5,mu6,mu7,mu8,mu9,mu10,mu11,mu12,mu13,mu14;
i a99,a98,a97,a96,a95,a93,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14; 
i i99,i98,i97,i96,i95,i93,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14; 
i i89,i88,i97,i86,i85,i83,i31,i32,i22;

cf Save;
******************
*
* my declarations
*
auto s h;
cf propcount,R,C,PR,PC,test,spropcount;
cf sf,dd;
cf sd(s);
f u,ub,v,vb,ll,tt;
#do l=1,99
s d'l';
s c'l';
#enddo
s di,df,dI,dF,gs,del,M,s,t,[u],a,dk,dl,dm,dn,N,Nc,[N^2-1],[Nc^2-1];
s I3t,Qt,MZ,ge,cw,sw;
i X,Y;
i aX, aY, al, be;
i a21,a22,a23,a24,a25,a26,al1,al2,al3,al4,al5,al6,al7,al8,al9;
i al1a,al2a,al3a,al4a,al5a,al6a,al7a,al8a,al9a;
i al1b,al2b,al3b,al4b,al5b,al6b,al7b,al8b,al9b;
i al1c,al2c,al3c,al4c,al5c,al6c,al7c,al8c,al9c;
i al1d,al2d,al3d,al4d,al5d,al6d,al7d,al8d,al9d;
i al1e,al2e,al3e,al4e,al5e,al6e,al7e,al8e,al9e;
i al1f,al2f,al3f,al4f,al5f,al6f,al7f,al8f,al9f;
i al1g,al2g,al3g,al4g,al5g,al6g,al7g,al8g,al9g;
i al1h,al2h,al3h,al4h,al5h,al6h,al7h,al8h,al9h;
i al1j,al2j,al3j,al4j,al5j,al6j,al7j,al8j,al9j;
i ik,il,im,in;
s [1/s],[1/t],[1/u],[d-1],[d-2],[s-4*M^2],[s-M^2],[s+M^2],[u-4*M^2],[t-M^2],
[u-M^2],[d-4],[N^2-1];
auto cf A,B,D,C2,C1,C0; 
s p1dp2,p1dp3,p1dp4,p2dp3,p2dp4,p3dp4,aem,Pi;
.global
********************************************************************************
#procedure proptosprop(dummy)
* at most four arg
id prop(k1?,k2?,q1?,q2?,p1?) =1/(1-1);
id propM(k1?,k2?,q1?,q2?,p1?) =1/(1-1);
* go to functions with symm arguments (I can't do that with prop and propM
* since I am not allowed to use id F(?a) =  if F is symmetric)
id prop(k1?,k2?,k3?,k4?) = Sprop(k1,k2,k3,k4);
id prop(k1?,k2?,k3?) = Sprop(k1,k2,k3);
id prop(k1?,k2?) = Sprop(k1,k2);
id prop(k1?) = Sprop(k1);
id propM(k1?,k2?,k3?,k4?) = SpropM(k1,k2,k3,k4);
id propM(k1?,k2?,k3?) = SpropM(k1,k2,k3);
id propM(k1?,k2?) = SpropM(k1,k2);
id propM(k1?) = SpropM(k1);

#endprocedure
********************************************************************************
#procedure kinematic(dummy)
*
* kinematics again
*
id p5 = p1+p2-p3-p4;
id p1.p1 = 0;
id p2.p2 = 0;
id p3.p3 = -M^2;
id p4.p4 = -M^2;

id p1.r1/[p1.r1] = 1;
id p2.r2/[p2.r2] = 1;


id M^2 =a;
id 1/M^2=1/a;
*
#endprocedure
********************************************************************************
#procedure toCACF(dummy)

id [N^2-2] = N^2-2;
id [N^2-1] = N^2-1;
id 1/N = N-2*CF;
id N^2 = 2*N*CF +1;
id N = CA;
.sort;
#endprocedure
********************************************************************************
#procedure service(dummy)

repeat;
*
id sd(a1?,a2?,a2?) = 0;
id sf(a1?,a2?,a2?) = 0;
*
id sf(a1?,aX?,aY?)*sd(a2?,aX?,aY?) = 0;
id sf(a1?,aY?,aX?)*sd(a2?,aX?,aY?) = 0;
id sf(aX?,a1?,aY?)*sd(a2?,aX?,aY?) = 0;
id sf(aX?,aY?,a1?)*sd(aX?,aY?,a2?) = 0;
*
*id sf(a1?,aY?,aX?)*sd(a2?,aX?,aY?) = 0;
*
id sd(a1?,aX?,aY?)*sd(a2?,aX?,aY?) = (N^2-4)/N*dd(a1,a2);
id sd(a1?,aX?,aY?)*sd(a1?,aX?,aY?) = (N^2-4)/N*(N^2-1);
*
id sf(a1?,aX?,aY?)*sf(a2?,aX?,aY?) = N*dd(a1,a2); 
id sf(aX?,a1?,aY?)*sf(aX?,a2?,aY?) = N*dd(a1,a2); 
id sf(aX?,aY?,a1?)*sf(aX?,a2?,aY?) = -N*dd(a1,a2); 
id sf(a1?,aY?,aX?)*sf(a2?,aX?,aY?) = -N*dd(a1,a2); 
*

id sd(a1?,a4?,a5?)*sd(a2?,a5?,a6?)*sd(a3?,a6?,a4?) =
(N^2-12)/2/N*sd(a1,a2,a3);

id sf(a3?,a4?,a5?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
-(N^2-4)/2/N*sf(a1,a2,a3);
id sf(a4?,a3?,a5?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
(N^2-4)/2/N*sf(a1,a2,a3);
id sf(a3?,a5?,a4?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
(N^2-4)/2/N*sf(a1,a2,a3);
id sf(a4?,a5?,a3?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
-(N^2-4)/2/N*sf(a1,a2,a3);
id sf(a5?,a3?,a4?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
-(N^2-4)/2/N*sf(a1,a2,a3);
id sf(a5?,a4?,a3?)*sd(a1?,a5?,a6?)*sd(a2?,a6?,a4?) =
(N^2-4)/2/N*sf(a1,a2,a3);
*id hF =-1;

id dd(a1?,a2?)*dd(a2?,a3?) = dd(a1,a3);
id dd(a2?,a1?)*dd(a2?,a3?) = dd(a1,a3);
id dd(a2?,a1?)*dd(a3?,a2?) = dd(a1,a3);
id dd(a1?,a2?)*sf(a2?,a3?,a4?) = sf(a1,a3,a4);
id dd(a2?,a1?)*sf(a2?,a3?,a4?) = sf(a1,a3,a4);
id dd(a1?,a2?)*sf(a3?,a2?,a4?) = sf(a3,a1,a4);
id dd(a2?,a1?)*sf(a3?,a2?,a4?) = sf(a3,a1,a4);
id dd(a1?,a2?)*sf(a3?,a4?,a2?) = sf(a3,a4,a1);
id dd(a2?,a1?)*sf(a3?,a4?,a2?) = sf(a3,a4,a1);
id dd(a1?,a2?)*sd(a2?,a3?,a4?) = sd(a1,a3,a4);
id dd(a2?,a1?)*sd(a2?,a3?,a4?) = sd(a1,a3,a4);
id dd(a1?,a1?) = N^2-1;

endrepeat;
*
#endprocedure
**********************************************************************************
#procedure coloralgebra(dummy)
*
#call service(dummy)
*
#do m=1,9
id once sf(a1?,a2?,aX?)*sf(a3?,a4?,aX?) = (2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'a)*sd(a2,a4,al'm'a) -
                         sd(a1,a4,al'm'a)*sd(a2,a3,al'm'a)));
id once sf(a1?,a2?,aX?)*sf(a3?,aX?,a4?) = -(2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'c)*sd(a2,a4,al'm'c) -
                         sd(a1,a4,al'm'c)*sd(a2,a3,al'm'c)));
id once sf(a1?,a2?,aX?)*sf(aX?,a3?,a4?) = (2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'd)*sd(a2,a4,al'm'd) -
                         sd(a1,a4,al'm'd)*sd(a2,a3,al'm'd)));
id once sf(a1?,aX?,a2?)*sf(a3?,a4?,aX?) = -(2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'b)*sd(a2,a4,al'm'b) -
                         sd(a1,a4,al'm'b)*sd(a2,a3,al'm'b)));
id once sf(a1?,aX?,a2?)*sf(a3?,aX?,a4?) = (2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'e)*sd(a2,a4,al'm'e) -
                         sd(a1,a4,al'm'e)*sd(a2,a3,al'm'e)));
id once sf(a1?,aX?,a2?)*sf(aX?,a3?,a4?) = -(2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'f)*sd(a2,a4,al'm'f) -
                         sd(a1,a4,al'm'f)*sd(a2,a3,al'm'f)));
id once sf(aX?,a1?,a2?)*sf(a3?,a4?,aX?) =  (2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'j)*sd(a2,a4,al'm'j) -
                         sd(a1,a4,al'm'j)*sd(a2,a3,al'm'j)));
id once sf(aX?,a1?,a2?)*sf(a3?,aX?,a4?) =  -(2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'g)*sd(a2,a4,al'm'g) -
                         sd(a1,a4,al'm'g)*sd(a2,a3,al'm'g)));
id once sf(aX?,a1?,a2?)*sf(aX?,a3?,a4?) =  (2/N*(dd(a1,a3)*dd(a2,a4) -
 dd(a1,a4)*dd(a2,a3)) + (sd(a1,a3,al'm'h)*sd(a2,a4,al'm'h) -
                         sd(a1,a4,al'm'h)*sd(a2,a3,al'm'h)));
#enddo
*
#call service(dummy)
*
#endprocedure
********************************************************************************
#procedure colortraces(dummy)
#call coloralgebra(dummy)



* check that there are no more than  6 Gell Mann matrices in a trace
argument;
id ll(a1?)*ll(a2?)*ll(a3?)*ll(a4?)*ll(a5?)*ll(a6?)*ll(a7?) = 1/(1-1); 
endargument;

* move to tt matrices

id C(ll(a1?)*ll(a2?)*ll(a3?)*ll(a4?)*ll(a5?)*ll(a6?),i1?,i1?) = 
2^6*C(tt(a1)*tt(a2)*tt(a3)*tt(a4)*tt(a5)*tt(a6),i1,i1);
id C(ll(a1?)*ll(a2?)*ll(a3?)*ll(a4?)*ll(a5?),i1?,i1?) = 
2^5*C(tt(a1)*tt(a2)*tt(a3)*tt(a4)*tt(a5),i1,i1);
id C(ll(a1?)*ll(a2?)*ll(a3?)*ll(a4?),i1?,i1?) = 
2^4*C(tt(a1)*tt(a2)*tt(a3)*tt(a4),i1,i1);
id C(ll(a1?)*ll(a2?)*ll(a3?),i1?,i1?) = 
2^3*C(tt(a1)*tt(a2)*tt(a3),i1,i1);
id C(ll(a1?)*ll(a2?),i1?,i1?) = 
2^2*C(tt(a1)*tt(a2),i1,i1);
id C(ll(a1?),i1?,i1?) = 
2*C(tt(a1),i1,i1);

*check that there are no ds at this stage


* get rid of the trivial traces

id C(tt(a1?)*tt(a2?)*tt(a3?),i1?,i1?) = 1/4*(sd(a1,a2,a3) +
i_*sf(a1,a2,a3));
id C(tt(a1?)*tt(a2?),i1?,i1?) = 1/2*dd(a1,a2);
id C(tt(a1?),i1?,i1?) = 0;
id C(del,i1?,i1?) = N;

* simplify strings of Gell Mann matrices in the traces

id once C(tt(a1?)*tt(a2?)*tt(a3?)*tt(a4?)*tt(a5?)*tt(a6?),i1?,i1?) = 
(1/2*(dd(a5,a6)/N*C(tt(a1)*tt(a2)*tt(a3)*tt(a4),i1,i1) 
+ (sd(a5,a6,al1) + i_*sf(a5,a6,al1))*
C(tt(a1)*tt(a2)*tt(a3)*tt(a4)*tt(al1),i1,i1)
 ));

id once C(tt(a1?)*tt(a2?)*tt(a3?)*tt(a4?)*tt(a5?),i1?,i1?) = 
(1/2*(
dd(a4,a5)/N*C(tt(a1)*tt(a2)*tt(a3),i1,i1) 
+ (sd(a4,a5,al2) + i_*sf(a4,a5,al2))*C(tt(a1)*tt(a2)*tt(a3)*tt(al2),i1,i1)
 ));
 
id once C(tt(a1?)*tt(a2?)*tt(a3?)*tt(a4?),i1?,i1?) = 
(1/2*(dd(a3,a4)/N*C(tt(a1)*tt(a2),i1,i1) 
+ (sd(a3,a4,al3) + i_*sf(a3,a4,al3))*C(tt(a1)*tt(a2)*tt(al3),i1,i1)
 ));
 
id once C(tt(a1?)*tt(a2?)*tt(a3?)*tt(a4?),i1?,i1?) = 
(1/2*(dd(a3,a4)/N*C(tt(a1)*tt(a2),i1,i1) 
+ (sd(a3,a4,al4) + i_*sf(a3,a4,al4))*C(tt(a1)*tt(a2)*tt(al4),i1,i1)
 ));

b C,sd,sf,dd,h1,h2,h3,N;
*print[];
.sort;
* get rid of the trivial traces

id C(tt(a1?)*tt(a2?)*tt(a3?),i1?,i1?) = 1/4*(sd(a1,a2,a3) +
i_*sf(a1,a2,a3));
id C(tt(a1?)*tt(a2?),i1?,i1?) = 1/2*dd(a1,a2);
id C(tt(a1?),i1?,i1?) = 0;
id C(del,i1?,i1?) = N;

*
*
* try to see what can be done with contracted fs and ds
*
*
#call coloralgebra(dummy)
.sort;

*
* check that no sf or sd are left
*
id sf(?a) = 1/(1-1);
id sd(?a) = 1/(1-1);

#endprocedure
********************************************************************************
********************************************************************************
*
* process glue glue -> top antitop Z
* 
* at this stage
*
* g(p1) + g(p2) ---> t(p4) + tbar(p3) + Z(p5)
*

g [ggQQZtreelevel] = 
* s channel diagrams, emissions from p3 and p4 leg
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p4+p5)*
i_*gs/2*R(g_(2,mu2),d95,d96)*
R(v(2,p3),d96)*
C(ll(a2),i98,i96)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
vggg(a11,a13,a1,mu11,mu13,mu1,p1,p2, - p1 - p2)*gluon(p1,mu11)*gluon(p2,mu13)
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu2),d98,d94)*
((i_)*R(g_(2,p3)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p3+p5)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d95,d96)*
R(v(2,p3),d96)*
C(ll(a2),i98,i96)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
vggg(a11,a13,a1,mu11,mu13,mu1,p1,p2, - p1 - p2)*gluon(p1,mu11)*gluon(p2,mu13)
+
*
* t-channel diagrams (3 emissions)
*
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p4+p5)*
i_*gs/2*R(g_(2,mu11),d95,d1)*C(ll(a11),i98,i1)*
((-i_)*R(g_(2,p4) + g_(2,p5) - g_(2,p1),d1,d2) + M*R(gi_(2),d1,d2))*propM(p4+p5-p1)*
i_*gs/2*R(g_(2,mu13),d2,d96)*C(ll(a13),i1,i96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu11),d98,d1)*C(ll(a11),i98,i1)*
((-i_)*R(g_(2,p4) - g_(2,p1),d1,d2) + M*R(gi_(2),d1,d2))*propM(p4-p1)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d2,d94)*
((-i_)*R(g_(2,p2) - g_(2,p3),d94,d95) + M*R(gi_(2),d94,d95))*propM(p2-p3)*
i_*gs/2*R(g_(2,mu13),d95,d96)*C(ll(a13),i1,i96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu11),d98,d94)*C(ll(a11),i98,i1)*
((-i_)*R(g_(2,p4) - g_(2,p1),d94,d95) + M*R(gi_(2),d94,d95))*propM(p4-p1)*
i_*gs/2*R(g_(2,mu13),d95,d1)*C(ll(a13),i1,i96)*
((i_)*R(g_(2,p3)+g_(2,p5),d1,d2)+M*R(gi_(2),d1,d2) )*propM(p3+p5)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d2,d96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
+
*
* u-channel diagram (3 emissions)
*
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p4+p5)*
i_*gs/2*R(g_(2,mu13),d95,d1)*C(ll(a13),i98,i1)*
((-i_)*R(g_(2,p4) + g_(2,p5) - g_(2,p2),d1,d2) + M*R(gi_(2),d1,d2))*propM(p4+p5-p2)*
i_*gs/2*R(g_(2,mu11),d2,d96)*C(ll(a11),i1,i96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu13),d98,d1)*C(ll(a13),i98,i1)*
((-i_)*R(g_(2,p4) - g_(2,p2),d1,d2) + M*R(gi_(2),d1,d2))*propM(p4-p2)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d2,d94)*
((-i_)*R(g_(2,p1) - g_(2,p3),d94,d95) + M*R(gi_(2),d94,d95))*propM(p1-p3)*
i_*gs/2*R(g_(2,mu11),d95,d96)*C(ll(a11),i1,i96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu13),d98,d94)*C(ll(a13),i98,i1)*
((-i_)*R(g_(2,p4) - g_(2,p2),d94,d95) + M*R(gi_(2),d94,d95))*propM(p4-p2)*
i_*gs/2*R(g_(2,mu11),d95,d1)*C(ll(a11),i1,i96)*
((i_)*R(g_(2,p3)+g_(2,p5),d1,d2)+M*R(gi_(2),d1,d2) )*propM(p3+p5)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d2,d96)*
R(v(2,p3),d96)*gluon(p1,mu11)*gluon(p2,mu13)
;

g [ggQQZtreelevelC] =
* s channel diagrams, emissions from p3 and p4 leg
+pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d88,d84)*
((i_)*R(g_(2,p3)+g_(2,p5),d84,d85)+ M*R(gi_(2),d84,d85))*propM(p3+p5)*
i_*gs/2*R(g_(2,nu3),d85,d86)*
R(u(2,p4),d86)*
C(ll(a23),i88,i86)*(dd(a23,a24)*d_(nu3,nu11))*prop(p1+p2)*
vggg(a24,a11,a13,nu11,nu1,nu13,p1+p2,-p1,-p2)*gluon(p1,nu1)*gluon(p2,nu13)
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*gs/2*R(g_(2,nu3),d88,d85)*
((-i_)*R(g_(2,p4)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p4+p5)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d84,d86)*
R(u(2,p4),d86)*
C(ll(a23),i88,i86)*(dd(a23,a24)*d_(nu3,nu11))*prop(p1+p2)*
vggg(a24,a11,a13,nu11,nu1,nu13,p1+p2,-p1,-p2)*gluon(p1,nu1)*gluon(p2,nu13)
+
* t-channel diagram
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*gs/2*R(g_(2,nu13),d88,d12)*C(ll(a13),i88,i22)*
C(ll(a11),i22,i86)*
((-i_)*R(g_(2,p2) - g_(2,p3),d12,d14) + M*R(gi_(2),d12,d14))*propM(p2-p3)*
i_*gs/2*R(g_(2,nu1),d14,d85)*
((-i_)*R(g_(2,p4)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p4+p5)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d84,d86)*
R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*gs/2*R(g_(2,nu13),d88,d12)*C(ll(a13),i88,i22)*
((-i_)*R(g_(2,p2) - g_(2,p3),d12,d14) + M*R(gi_(2),d12,d14))*propM(p2-p3)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d14,d15)*
((-i_)*R(g_(2,p4) - g_(2,p1),d15,d16) + M*R(gi_(2),d15,d16))*propM(p4-p1)*
C(ll(a11),i22,i86)*
i_*gs/2*R(g_(2,nu1),d16,d86)*R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d88,d85)*
((i_)*R(g_(2,p3)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p3+p5)*
i_*gs/2*R(g_(2,nu13),d84,d12)*
C(ll(a13),i88,i22)*C(ll(a11),i22,i86)*
((-i_)*R(g_(2,p4) - g_(2,p1),d12,d14) +M*R(gi_(2),d12,d14))*propM(p4-p1)*
i_*gs/2*R(g_(2,nu1),d14,d86)*R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
+
** u-channel diagram
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*gs/2*R(g_(2,nu1),d88,d12)*C(ll(a11),i88,i22)*
C(ll(a13),i22,i86)*
((-i_)*R(g_(2,p1) - g_(2,p3),d12,d14) + M*R(gi_(2),d12,d14))*propM(p1-p3)*
i_*gs/2*R(g_(2,nu13),d14,d85)*
((-i_)*R(g_(2,p4)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p4+p5)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d84,d86)*
R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*gs/2*R(g_(2,nu1),d88,d12)*C(ll(a11),i88,i22)*
((-i_)*R(g_(2,p1) - g_(2,p3),d12,d14) + M*R(gi_(2),d12,d14))*propM(p1-p3)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d14,d15)*
((-i_)*R(g_(2,p4) - g_(2,p2),d15,d16) + M*R(gi_(2),d15,d16))*propM(p4-p2)*
C(ll(a13),i22,i86)*
i_*gs/2*R(g_(2,nu13),d16,d86)*R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d88,d85)*
((i_)*R(g_(2,p3)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p3+p5)*
i_*gs/2*R(g_(2,nu1),d84,d12)*
C(ll(a11),i88,i22)*C(ll(a13),i22,i86)*
((-i_)*R(g_(2,p4) - g_(2,p2),d12,d14) +M*R(gi_(2),d12,d14))*propM(p4-p2)*
i_*gs/2*R(g_(2,nu13),d14,d86)*R(u(2,p4),d86)*gluon(p1,nu1)*gluon(p2,nu13)
;


* Q graph  + rewrite2lA output for the tree level amplitude of the partonic
* process ghost ghost -> top antitop
* (this is needed if I want to keep on using d_(mu,nu) as the sum of the 
* gluon polarization vectors)
*
g [ghostghostQQZ] = 
pol(Z(p5,mu3))*R(ub(2,p4),d98)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p4+p5)*
i_*gs/2*R(g_(2,mu2),d95,d96)*R(v(2,p3),d96)*
C(ll(a2),i98,i96)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
vGGg(a11,a1,a13,mu1,p2)*
pol(ghost(-1,p1))*pol(Ghost(-3,p2))
+
pol(Z(p5,mu3))*R(ub(2,p4),d98)*i_*gs/2*R(g_(2,mu2),d98,d94)*
((i_)*R(g_(2,p3)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*propM(p3+p5)*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d95,d96)*
R(v(2,p3),d96)*
C(ll(a2),i98,i96)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
vGGg(a11,a1,a13,mu1,p2)*
pol(ghost(-1,p1))*pol(Ghost(-3,p2));


g [ghostghostQQZC] = pol(Z(-p5,mu4))*R(vb(2,p3),d88)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d88,d84)*
((i_)*R(g_(2,p3)+g_(2,p5),d84,d85)+M*R(gi_(2),d84,d85))*propM(p3+p5)*
i_*gs/2*R(g_(2,nu3),d85,d86)*R(u(2,p4),d86)*
C(ll(a23),i88,i86)*(dd(a23,a24)*d_(nu3,nu4))*prop(p1+p2)*
vGGg(a11,a24,a13,nu4,p1)*
pol(Ghost(-1,p1))*pol(ghost(-3,p2))
+
pol(Z(-p5,mu4))*R(vb(2,p3),d88)*i_*gs/2*R(g_(2,nu3),d88,d85)*
((-i_)*R(g_(2,p4)+g_(2,p5),d85,d84)+M*R(gi_(2),d85,d84) )*propM(p4+p5)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d84,d86)*
R(u(2,p4),d86)*
C(ll(a23),i88,i86)*(dd(a23,a24)*d_(nu3,nu4))*prop(p1+p2)*
vGGg(a11,a24,a13,nu4,p1)*
pol(Ghost(-1,p1))*pol(ghost(-3,p2));
*
*  insert values of I3t and Qt right away
*
.sort;

argument;
id I3t= 1/2;
id Qt= 2/3;
endargument;
.sort;

*three gluon vertices 


id vggg(a2?,a8?,a6?,mu2?,mu4?,mu6?,k1?,k2?,k3?) = i_*gs*sf(a2,a8,a6)*(
d_(mu2,mu4)*(k1(mu6)-k2(mu6)) + d_(mu4,mu6)*(k2(mu2)-k3(mu2)) + 
d_(mu2,mu6)*(k3(mu4)-k1(mu4))
);


* vGGg(outgoing  arrow G color,gluon color,incoming arrow G,lorents gluon,mom 
* out arrow)
id vGGg(a1?,a2?,a3?,mu2?,k1?) = -i_*gs*sf(a1,a2,a3)*k1(mu2); 

*id I3t = 1/(1-1);
*id Qt = 1/(1-1);
*.sort;

***********************
*
* check that all the graphs are at of the same order in gs
*
***********************


#message tree level
id gs^2 =1;
id gs =1/(1-1);
multiply gs^2;

.sort;
*
* here I generate the squared matrix element
*

g [TL] =  [ggQQZtreelevel]*[ggQQZtreelevelC];
g [ghostTL] =  [ghostghostQQZ]*[ghostghostQQZC]; 
.store
g [totTLgg] =  [TL]*hTAG+(-2)*hGHOST*[ghostTL] ;
g [totTLggnoghost] =  [TL] ;

id hGHOST =1;





* 2loop
*#message two-loop
*id gs^8 =1;
#message tree level
id gs^4 =1;
id ge^2 =1;
.sort;
id gs=1/(1-1);
id ge=1/(1-1);
.sort;

argument;
id I3t = 1/(1-1);
id Qt = 1/(1-1);
endargument;
.sort;
*
********************
*
* start building up the trace
*
********************
*
*sum over the qqQQ spins 

id R(u(al?,p4),dk?)*R(ub(al?,p4),dl?) = 1/2*(-i_*R(g_(2,p4),dk,dl)+
M*R(gi_(2),dk,dl))*C(del,i98,i86); 
id R(v(al?,p3),dk?)*R(vb(al?,p3),dl?) = 1/2*(-i_*R(g_(2,p3),dk,dl)-
M*R(gi_(2),dk,dl))*C(del,i96,i88);
.sort;
*
* sum over the gluon polarizations
*
* 2) sum over the spins
id gluon(p1,mu1?)*gluon(p1,mu2?) = d_(mu1,mu2) + 
[xi]*(-(r1(mu1)*p1(mu2) + p1(mu1)*r1(mu2))/[p1.r1] + 
(r1.r1*p1(mu1)*p1(mu2))/[p1.r1]^2 );
id gluon(p2,mu1?)*gluon(p2,mu2?) = d_(mu1,mu2) + 
[xi]*(-(r2(mu1)*p2(mu2) + p2(mu1)*r2(mu2))/[p2.r2] - 
(r2.r2*p2(mu1)*p2(mu2))/[p2.r2]^2 );
* 

id pol(Z(p5,mu3?))*pol(Z(-p5,mu4?)) = (d_(mu3,mu4) + p5(mu3)*p5(mu4)/MZ^2);
*
* sum over the ghost polarization
*
id pol(ghost(ha?,p1?))*pol(Ghost(hb?,p1?)) = 1;

id hTAG*[xi] = 0;
id hTAG =1;

id r1 = p2;
id r2 = p1;
* is the sign here correct!
id 1/[p1.r1] = 2*prop(p1+p2);
id 1/[p2.r2] = 2*prop(p1+p2);


b C;
*print[];
*print +s;
.sort;
**********************
*
*  take care of the color structure 
*
**********************
#message COLOR STRUCTURE - BEGIN

*
* kill the color structure
*
*id C(ll(a1?),?b) = 1;
*id sf(?a) = 1;
*id C(del,i7?,i8?)= 1;
*

repeat;
id C(del,i7?,i8?)*C(ll(a1?),i8?,i9?) =  C(ll(a1),i7,i9);
id C(del,i7?,i8?)*C(ll(a1?),i9?,i8?) =  C(ll(a1),i9,i7);
id C(del,i8?,i7?)*C(ll(a1?),i8?,i9?) =  C(ll(a1),i7,i9);
id C(del,i8?,i7?)*C(ll(a1?),i9?,i8?) =  C(ll(a1),i9,i7);
endrepeat;

repeat;
id C(ha?,i1?,i2?)*C(hb?,i2?,i3?) = C(ha*hb,i1,i3) ;
endrepeat;


* check that everything is ina a trace
repeat;
id C(ha?,i1?,i1?) = PC(ha,i1,i1);
endrepeat;
id C(ha?,i1?,i2?) = 1/(1-1);
id PC(ha?,i1?,i1?) = C(ha,i1,i1);


#call colortraces(dummy)

#message COLOR STRUCTURE - END
b C,N,sf,sd,[N^2-1],k2,k1;
*ab N,sf,sd,dd,hK;
*print[];
*print +s;
.sort;
*********************
*
* put the traces together
*
#message DIRAC TRACE -  BEGIN
*
repeat;
id R(ha?,dk?,dl?)*R(hb?,dl?,dm?) = R(ha*hb,dk,dm); 
endrepeat;

argument;
id g_(1,al?) =h1*g_(1,al);
id g_(2,al?) =h2*g_(2,al);
repeat;
id h1*h1 = h1;
id h2*h2 = h2;
endrepeat;
#message CHECKING TRACE ORDERING
id h1*h2=1/(1-1);
repeat;
id g_(X,al?)*h1 = g_(1,al)*h1;
id g_(X,al?)*h2 = g_(2,al)*h2;
endrepeat;
id h1=1;
id h2=1;
endargument;
.sort;
*******************
*
* check that at this stage all the gamma matrices are included into traces
*
*******************

id R(h1?,d1?,d1?) = PR(h1,d1,d1);
id R(h2?,d2?,d3?) = 1/(1-1) ;
id PR(h1?,d1?,d1?) = R(h1,d1,d1);

b prop,propM,propcount,R;
*print[];
*print+s;
.sort;

********************
*
* separate the sum of traces that appear in the same R function
*
********************
splitarg R;

repeat;
id R(ha?,?a,d1?,d1?) = PR(ha,d1,d1) + R(?a,d1,d1);
id R(d1?,d1?) = 0;
endrepeat;
id R(?a) = 1/(1-1);
id PR(h1?,d1?,d1?) = R(h1,d1,d1);
*
b R,PR;
*print[];
.sort;
***********************
* are there diagrams with two separate fermion traces?
* (that is, aside for the ones on the external qqQQ)
* YES: 53, 54, 57, 58,
*argument;
*id g_(X,al?) = hX*g_(X,al);
*repeat;
*id hX*hX = hX;
*endrepeat;
*endargument;


id R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?,mu3?,mu9?),d7?,d7?)=
   1/(1-1);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?,mu3?,mu9?),d7?,d7?) = 
   1/(1-1);

id R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?,mu3?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4,mu6,mu3),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?,mu3?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4,mu6,mu3),d7,d7);

id R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4,mu6),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?,mu6?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4,mu6),d7,d7);

id R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?,mu8?,mu4?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2,mu12,mu8,mu4),d7,d7);

id R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2,mu12,mu8),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?,mu8?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2,mu12,mu8),d7,d7);

id R(g_(X,mu1?,mu10?,mu2?,mu12?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2,mu12),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?,mu12?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2,mu12),d7,d7);

id R(g_(X,mu1?,mu10?,mu2?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10,mu2),d7,d7);
id R(-g_(X,mu1?,mu10?,mu2?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10,mu2),d7,d7);
   
id R(g_(X,mu1?,mu10?),d7?,d7?)=
   hX*R(g_(X,mu1,mu10),d7,d7);
id R(-g_(X,mu1?,mu10?),d7?,d7?) = 
   -hX*R(g_(X,mu1,mu10),d7,d7);
   
id R(g_(X,mu1?),d7?,d7?)=
   hX*R(g_(X,mu1),d7,d7);
id R(-g_(X,mu1?),d7?,d7?) = 
   -hX*R(g_(X,mu1),d7,d7);

id hX^2 = hX*hY;
*
* now i have to insert hY in one of the two traces with index X;
*

id hY*R(g_(X,mu1?,mu10?,mu2?,mu12?,mu8?),d7?,d7?)=
   1/(1-1);
id hY*R(g_(X,mu1?,mu10?,mu2?,mu12?),d7?,d7?)=
   R(g_(Y,mu1,mu10,mu2,mu12),d7,d7);
id hY*R(g_(X,mu1?,mu10?,mu2?),d7?,d7?)=
   R(g_(Y,mu1,mu10,mu2),d7,d7);
id hY*R(g_(X,mu1?,mu10?),d7?,d7?)=
   R(g_(Y,mu1,mu10),d7,d7);
id hY*R(g_(X,mu1?),d7?,d7?)=
   R(g_(Y,mu1),d7,d7);

*endargument;
id hX =1;

*b AuxTopo,propcount,R,gs,sf,hX,hY,hHELP;
*print[];
.sort;

*******************
*
* TRACE in d dimensions
*
*******************

id R(h1?,d1?,d1?) = h1;
id R(?a) = 1/(1-1);

*trace4 1;
trace4 2;
*tracen X;
*tracen Y;

#message DIRAC TRACE - END

b AuxTopo,propcount,R,gs,sf,hX,C,dd,sd;
* print[];
*print +s;
.sort
*********************
*
* remap the momenta according to the "official" rooting
*
*********************

id p3 = q1;
id p4 = p3;
id q1 = p4;
argument;
id p3 = q1;
id p4 = p3;
id q1 = p4;
id p5 = p1+p2-p3-p4;
endargument;
.sort;

b AuxTopo,propcount,prop,propM,N,[1/s],C,dd,sd,sf;
*ab hM1,hM2,hM3;
* print[];
*print +s;
.sort;

*
* this is the tree level squared matrix element
*
#call kinematic(dummy)
id d = [d-4] + 4;
id N^2 = [N^2 -1] +1;
id  1/N = -[N^2 -1]/N +N;

id [d-4] = 0;
id [xi] =1;

*#call toCACF(dummy)
.sort;
*prepare for the mathametica output
id N^h? = Nc^h;
id [N^2-1] = [Nc^2-1];

id propM(-p1+p3) = propM(p1-p3);
id propM(-p1+p4) = propM(p1-p4);
id propM(-p2+p3) = propM(p2-p3);
id propM(-p2+p4) = propM(p2-p4);
* prepare the output for mathematica
id p1.p2 = 1/2*(2*a-MZ^2-2*p3.p4+2*p1.p3+2*p2.p3+2*p1.p4+2*p2.p4);

.sort;
*repeat;
*id p1.p2*prop(p1+p2) = 1/2;
id p1.p3*propM(p1+p2-p3) = -p2.p3*propM(p1+p2-p3) +1/2*(-1+2*p1.p2*propM(p1+p2-p3));
id p1.p4*propM(p1+p2-p4) = -p2.p4*propM(p1+p2-p4) +1/2*(-1+2*p1.p2*propM(p1+p2-p4));
.sort;
id p3.p4 = 1/2*(-hD3 + a - hD4 + a - MZ^2 + 
   2*p1.p2);
*endrepeat;
id propM(p1 + p2 - p3)*hD3 =1;
id propM(p1 + p2 - p4)*hD4 =1;
.sort;
id hD3 = 2*p1.p2 - 2*p1.p3 -2*p2.p3;
id hD4 = 2*p1.p2 - 2*p1.p4 -2*p2.p4;
.sort;
id p1.p2*prop(p1+p2) = 1/2;
.sort


multiply aem/[Nc^2-1]^2*4*Pi/sw^2;
id p1.p2 = p1dp2;
id p1.p3 = p1dp3;
id p1.p4 = p1dp4;
id p2.p3 = p2dp3;
id p2.p4 = p2dp4;
id p3.p4 = p3dp4;

#message ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#message this is the tree level matrix element squared for qq->ttZ
#message ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*b prop,propM;
b aem,Pi,prop,propM,Nc,[d-4],[Nc^2-1],CA,CF,cw,sw,MZ,Qt,I3t,e_;
*b e_,Pi,prop,cw,sw,aem,Nc,[Nc^2-1],Pi;
*print[];
print +s;
.store
.end

