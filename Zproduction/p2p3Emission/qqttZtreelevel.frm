#-
off warnings; 
off statistics;
********************************************************************************
*
* New York, October 21, 2015
*
* Adapt this old code to the calculation of  t tbar Z at tree level
*
********************************************************************************
*
* Zuerich, May 25, 2007
*  
* process qq -> QQ at the tree level; squared matric element.
* qs are massless, Qs are massive
*
* Introduce the Feynman rules in the output of rewrite2lA.frm
* Introduce the Feynman rules in the output of rewrite1lA.frm
* Try to calculate the three level, once and for all
*
********************************************************************************
*
* DECLARATIONS
*
dimension 4;
cf AuxTopo,TopoSave;
cf NoSwap,Swap;
cf pol,v3,v4,v5;
cf prop,propM;
cf Sprop(s),SpropM(s);

*s 
*#do g=1,218
*d'g'
*#enddo
   ;
cf 
Quark1,Qbar1,Quark2,Qbar2,Quark,Qbar,QuarkM,QbarM,gluon,ghost,Ghost,Z,vQQZ,vQQg,
vggg,vGGg,vgggg,pQuark,pQuarkM,pgluon,pghost,vQQW,Wboson;
s j1,j2,j3,j4,j5;
s n1,n2,n3,n4,n5;
s [];

v k,l,p1,p2,p3,p4,p5,m1,m2,m3,m4,m5;
v q1,q2;
v v1,v2;
v pa,pb;

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
i mu99,mu98,mu97,mu96,mu95,mu93,
  mu1,mu2,mu3,mu4,mu5,mu6,mu7,mu8,mu9,mu10,mu11,mu12,mu13,mu14;
i a99,a98,a97,a96,a95,a93,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14; 
i i99,i98,i97,i96,i95,i94,i93,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14; 

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
s di,df,dI,dF,gs,ge,del,M,MW,MZ,s,t,[u],a,dk,dk1,dk2,dl,dl1,dl2,dm,dn,N,[N^2-1];
s Nc,[Nc^2-1],sqrt2;
i X,Y;
i aX, aY, al, be,ro;
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
s p1dp2,p1dp3,p1dp4,p2dp3,p2dp4,p3dp4,Qq,I3q,Qt,I3t,cw,sw,aem,Pi;
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
* 
g [qqttZtreelevel] = hCOMPLEXCONJ*hTREE*(d_(mu3,mu4) + p5(mu3)*p5(mu4)/MZ^2);
* Global [qqttZtreelevel] = hCOMPLEXCONJ*hTREE*(d_(mu3,mu4) + p5(mu3)*p5(mu4)/MZ^2);

id hTREE = 
* emission of the Z from p1
* -R(vb(1,p2),d97)*i_*gs/2*R(g_(1,mu1),d97,d94)*(-i_)*
* R(g_(1,p1)-g_(1,p5),d94,d95)*i_*ge/2/cw*
* R(g_(1,mu3)*(-2*sw^2*Qq*gi_(1) + I3q*(gi_(1)+g5_(1))),d95,d99)*
* R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p3+p4)*
* prop(p1-p5)*R(ub(2,p4),d98)*i_*gs/2*R(g_(2,mu2),d98,d96)*R(v(2,p3),d96)*
* C(ll(a2),i98,i96)
* emission of the Z from p2
-R(vb(1,p2),d97)*i_*ge/2/cw*R(g_(1,mu3)*(
-2*sw^2*Qq*gi_(1) + I3q*(gi_(1)+g5_(1))),d97,d94)*(i_)*
R(g_(1,p2)-g_(1,p5),d94,d95)*i_*gs/2*R(g_(1,mu1),d95,d99)*
R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p3+p4)*
prop(p2-p5)*R(ub(2,p4),d98)*i_*gs/2*R(g_(2,mu2),d98,d96)*R(v(2,p3),d96)*
C(ll(a2),i98,i96)
* emission of the Z from p4 (outgoing top at this stage)
* -R(vb(1,p2),d97)*i_*gs/2*R(g_(1,mu1),d97,d99)*
* R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
* propM(p4+p5)*R(ub(2,p4),d98)*
* i_*ge/2/cw*R(g_(2,mu3)*(
* -2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d98,d94)*
* ((-i_)*R(g_(2,p4)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*
* i_*gs/2*R(g_(2,mu2),d95,d96)*R(v(2,p3),d96)*
* C(ll(a2),i98,i96)
* emission of the Z from p3 (outgoing antitop at this stage)
-R(vb(1,p2),d97)*i_*gs/2*R(g_(1,mu1),d97,d99)*
R(u(1,p1),d99)*C(ll(a1),i97,i99)*(dd(a1,a2)*d_(mu1,mu2))*prop(p1+p2)*
propM(p3+p5)*R(ub(2,p4),d98)*
i_*gs/2*R(g_(2,mu2),d98,d94)*
((i_)*R(g_(2,p3)+g_(2,p5),d94,d95)+M*R(gi_(2),d94,d95) )*
i_*ge/2/cw*R(g_(2,mu3)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),d95,d96)*R(v(2,p3),d96)*
C(ll(a2),i98,i96);

id hCOMPLEXCONJ =
* emission of the Z from p1
* -R(ub(1,p1),dk)*i_*ge/2/cw*
* R(g_(1,mu4)*(-2*sw^2*Qq*gi_(1) + I3q*(gi_(1)+g5_(1))),dk,dk1)*
* (-i_)*R(g_(1,p1)-g_(1,p5),dk1,dk2)*
* prop(p1-p5)*i_*gs/2*R(g_(1,al),dk2,dl)*C(ll(a21),ik,il)*
* R(v(1,p2),dl)*(dd(a21,a22)*d_(al,be)*prop(p1+p2-p5))*
* R(vb(2,p3),dm)*i_*gs/2*
* R(g_(2,be),dm,dn)*C(ll(a22),im,in)*R(u(2,p4),dn)
*
-R(ub(1,p1),dk)*i_*gs/2*R(g_(1,al),dk,dl1)*C(ll(a21),ik,il)*
(i_)*R(g_(1,p2)-g_(1,p5),dl1,dl2)*prop(p2-p5)*i_*ge/2/cw*R(g_(1,mu4)*(
-2*sw^2*Qq*gi_(1) + I3q*(gi_(1)+g5_(1))),dl2,dl) *R(v(1,p2),dl)*
(dd(a21,a22)*d_(al,be)*prop(p1+p2-p5))*R(vb(2,p3),dm)*i_*gs/2*R(g_(2,be),dm,dn)*
C(ll(a22),im,in)*R(u(2,p4),dn)
* emission from top (p4)
* -R(ub(1,p1),dk)*i_*gs/2*R(g_(1,al),dk,dl)*C(ll(a21),ik,il)*
* R(v(1,p2),dl)*(dd(a21,a22)*d_(al,be)*prop(p1+p2))*R(vb(2,p3),dm)*i_*gs/2*
* R(g_(2,be),dm,dk1)*C(ll(a22),im,in)*
* ((-i_)*R(g_(2,p4)+g_(2,p5),dk1,dk2)+M*R(gi_(2),dk1,dk2) )*
* i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),dk2,dn)*
* R(u(2,p4),dn)*propM(p4+p5)
* emission from antitop (p3)
-R(ub(1,p1),dk)*i_*gs/2*R(g_(1,al),dk,dl)*C(ll(a21),ik,il)*
R(v(1,p2),dl)*(dd(a21,a22)*d_(al,be)*prop(p1+p2))*R(vb(2,p3),dm)*
i_*ge/2/cw*R(g_(2,mu4)*(-2*sw^2*Qt*gi_(2) + I3t*(gi_(2)+g5_(2))),dm,dk1)*
((i_)*R(g_(2,p3)+g_(2,p5),dk1,dk2)+ M*R(gi_(2),dk1,dk2))*
i_*gs/2*R(g_(2,be),dk2,dn)*C(ll(a22),im,in)*R(u(2,p4),dn)*propM(p3+p5)
;

* 2loop
*#message two-loop
*id gs^8 =1;
#message tree level
id once gs^4 =1;
id once ge^2 =1;
.sort;
id gs=1/(1-1);
id ge=1/(1-1);
.sort;
*
********************
*
* start building up the trace
*
********************
*
*sum over the qqQQ spins 

id R(u(al?,p1),dk?)*R(ub(al?,p1),dl?) = 1/2*(-i_*R(g_(1,p1),dk,dl))*C(del,i99,ik);
id R(v(al?,p2),dk?)*R(vb(al?,p2),dl?) = 1/2*(-i_*R(g_(1,p2),dk,dl))*C(del,i97,il);
id R(u(al?,p4),dk?)*R(ub(al?,p4),dl?) = 1/2*(-i_*R(g_(2,p4),dk,dl)+
M*R(gi_(2),dk,dl))*C(del,i98,in); 
id R(v(al?,p3),dk?)*R(vb(al?,p3),dl?) = 1/2*(-i_*R(g_(2,p3),dk,dl)-
M*R(gi_(2),dk,dl))*C(del,i96,im);
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
*id C(ha?,i1?,i2?) = 1/(1-1);
id PC(ha?,i1?,i1?) = C(ha,i1,i1);


#call colortraces(dummy)

#message COLOR STRUCTURE - END
*b C,N,sf,sd,[N^2-1],k2,k1;
*ab N,sf,sd,dd,hK;
b R;
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
*id g_(X,5_)*h1 = g_(1,5_)*h1;
*id g_(X,5_)*h2 = g_(2,5_)*h2;
endrepeat;
id h1=1;
id h2=1;
endargument;

b R;
*print[];
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

* OLD COMMAND - not needed any more
*argument;
*id hY*g_(X,al?) = g_(Y,al);
*endargument;
id hX =1;

*b AuxTopo,propcount,R,gs,sf,hX,hY,hHELP;
*print[];
.sort;


*******************
*
* TRACE in 4 dimensions
*
*******************

id R(h1?,d1?,d1?) = h1;

id R(?a) = 1/(1-1);

trace4 1;
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
* exchange p3 and p4 so that p3 is the momentum of the top
* and p4 is the momentum of the antitop
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
id p5 = p1+p2-p3-p4;
id p1.p1 = 0;
id p2.p2 = 0;
id p3.p3 = -M^2;
id p4.p4 = -M^2;

id M^2 =a;
id 1/M^2 = 1/a;

id 1/sqrt2^2 =1/2;
id prop(-p3-p4) = prop(p3+p4);
id prop(p1-p3-p4) = prop(-p1+p3+p4);
id N^2 = [N^2-1]+1;

* prepare the output for mathematica
*id p3.p4 = 1/2*(2*a-MW^2-2*p1.p2+2*p1.p3+2*p2.p3+2*p1.p4+2*p2.p4);

id p1.p2 = p1dp2;
id p1.p3 = p1dp3;
id p1.p4 = p1dp4;
id p2.p3 = p2dp3;
id p2.p4 = p2dp4;
id p3.p4 = p3dp4;

* if I set hA = -1 I get simply zero
id hA = 1;

* there is a factor of 4 which I do not understand. I need this factor in order
* to match GoSam and openloops
multiply aem/Nc^2*4*Pi/sw^2*4;
id I3t = 1/2;
id Qt = 2/3;

id N = Nc;
id [N^2-1] = [Nc^2-1];
* 
b MZ,prop,propM,[Nc^2-1],C,dd,sd,sf,Qq,Qt,I3q,I3t,sw,cw,aem,Pi,Nc;
*ab hM1,hM2,hM3;
* print[];
#message~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#message tree level matrix element squared for q qbar -> t tbar Z 
#message in agreement with openloops and GoSam
#message~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
print +s;
*print[];
*.store;
.sort

*******************************************************
* To rewrite Maxima-readable form
*******************************************************

#message~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#message The following is Maxima-readable form
#message eta(p,q) = +p1*p1 - p2*q2 - ...
#message~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Function eta;
Symbols mt, mw, mz, [N^2-1], [N^(-1)];

* Maxima uses 
*   eta(p,q):= p[1]*q[1] - sum(p[i]*q[i], i, 2, length(p));
* and this metric is (+---).
id p1dp4 = -eta(p1,p4);
id p2dp3 = -eta(p2,p3); 
id p3dp4 = -eta(p3,p4); 
id p1dp3 = -eta(p1,p3); 
id p2dp4 = -eta(p2,p4);
id p1dp2 = -eta(p1,p2);

* Bracket prop, [N^2-1];
* print +s;
* .end

id a = mt^2;
id MW = mw;
id MW^-1 = mw^-1;
id MZ = mz;
id MZ^-1 = mz^-1;

id [Nc^2-1] = [N^2-1];
id Nc^-1 = [N^(-1)];

.sort

Vector q;
id prop(q?) = prop(q.q);
* We treat top as a massive quark.
id propM(q?) = prop(q.q - mt^2);

argument;
  id p1?.p2? = eta(p1,p2);
endargument;

.sort

*b MZ,prop,propM,[Nc^2-1],C,dd,sd,sf,Qq,Qt,I3q,I3t,sw,cw,aem,Pi,Nc;
Bracket prop, [N^(-1)], [N^2-1], Pi, Qq,I3q,sw,cw,aem,mz,mw;
print +s;
.sort

* For debugging, there is no such terms.
id dd = 1/(1-1);
id sd = 1/(1-1);
id sf = 1/(1-1);

.end
