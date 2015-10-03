*                                                                        *
* MOLLER SCATTERING DIFFERENTIAL CROSS SECTION AT THE TREE LEVEL
*
nwrite statistics;
*
*dimension n;
autodeclare v q,p,k;
v Q, P, V;
autodeclare s i,j,l,m,r,sr; 
s m,M,n;
*kinem invariants
s s,t,uu,[s - 2*m^2],[t - 2*m^2],[s+t],[1/t],[1/s],[1/Sqrt(s^2 -4*s*m^2)];
s [1/s/t],[1/s+1/t],[t/s],[s/t],[1/v],[1/m],[1/u],[u+t],[u - 2*m^2];
*energies and momenta;
s [1/Ee*Eep*Ea*Eap],[1/Eep*Eap],[Sqrt(s - 4*m^2)],[1/Sqrt(s)],[1/Eap];
s [1/E],th,[1/(E^2 - 4*m^2)],[1/(1- cos_(th))],[alph^2/2/E^2];
s [1/(E^2-m^2)],[1/(E^2 - m^2)/(1- cos_(th))],[1/sin_(th/2)],[alph^2/s];
s [1/(1+ cos_(th))],[1/cos_(th/2)];
autodeclare i du,t;
i mu,nu,ro,de,al,be,ga,si,la;
autodeclare s a,b,c,e,hp,tr,T,[2*pi],[1/(2*pi)],Vl,E;
cf R,ub,vb,u,v,gd,pw,del,cos;
f int;
*
.global
*
**************************************************************************
*
**************************************************************************
*
#procedure s1(dummy)
*
* INTERFERENCE OF THE THREE LEVEL WITH ITSELF 
*
* write a procedure that takes care to calculate the
* sum over the spins. 
*
* careful the two contributing diagrams can be obtained from one another
* by exchanging two external legs; therefore there must be a minus sign in
* between the two amplitudes
*                         
*                             
*
g amp = 1/4*(srtc - srsc)*(srt - srs);
*
* this is the string corresponding to the  (complex conjugate)
* tree level bhabha in the  t-channel
*
* qe  is  the momentum of the 1st incoming  e^- (p1) 
* qep is  the momentum of the 1st outgoing  e^- (p3)
* qa  is  the momentum of the 2nd incoming  e^- (p2)
* qap is  the momentum of the 2nd outgoing  e^- (p4)
*
*WARNING: vertex connecting qe and qep -> fermionic line label 1
*         vertex connecting qa and qap -> fermionic line label 2 
*         vertex connecting qe and qap -> fermionic line label 3
*         vertex connecting qa and qep -> fermionic line label 4 
*
* srt and src are the complex conjugate of the tree level strings
* of gamma matrices srt and srs
*
*
id srtc =  R(ub(1,qe),i1)*R(g_(1,mu),i1,i2)*R(u(1,qep),i2)*
R(ub(2,qa),i3)*R(g_(2,mu),i3,i4)*R(u(2,qap),i4)*hpt2;
*
id srsc =  R(ub(3,qe),l1)*R(g_(3,nu),l1,l2)*R(u(3,qap),l2)*
R(ub(4,qa),l3)*R(g_(4,nu),l3,l4)*R(u(4,qep),l4)*hps2;
*
id srt =  R(ub(1,qep),j1)*R(g_(1,al),j1,j2)*R(u(1,qe),j2)*
R(ub(2,qap),j3)*R(g_(2,al),j3,j4)*R(u(2,qa),j4)*hpt2;
*
id srs =  R(ub(3,qap),r1)*R(g_(3,be),r1,r2)*R(u(3,qe),r2)*
R(ub(4,qep),r3)*R(g_(4,be),r3,r4)*R(u(4,qa),r4)*hps2;
*
*print;
.sort;
*
* sum over the spins
*
if ((match(hps2*hps2)==1) || (match(hpt2*hpt2)==1));
*
#do hp =1,4
id R(u(`hp',q?),i1?)*R(ub(`hp',q?),i2?) = R(-i_*g_(`hp',q)+m,i1,i2);
id R(v(`hp',q?),i1?)*R(vb(`hp',q?),i2?) = R(-i_*g_(`hp',q)-m,i1,i2);
#enddo
*
elseif (match(hpt2*hps2)==1);
*
argument;
#do hp =1,4
id g_(`hp',mu?) = g_(tu,mu);
id u(`hp',q?) = u(tu,q);
id ub(`hp',q?) = ub(tu,q);
id v(`hp',q?) = v(tu,q);
id vb(`hp',q?) = vb(tu,q);
#enddo
endargument;
*
repeat;
id R(u(tu,q?),i1?)*R(ub(tu,q?),i2?) = R(-i_*g_(tu,q)+m,i1,i2);
id R(v(tu,q?),i1?)*R(vb(tu,q?),i2?) = R(-i_*g_(tu,q)-m,i1,i2);
endrepeat;
*	
else;
multiply 1/(1-1);
endif;

* tu is the index of the unique trace that one gets when interfering
* a s-channel diagram with a t-channel diagram
* 
* check that all the spinor components are gone
*
*
b hpt2, hps2,hps4;
*print;
.sort;
*
* put the terms belonging to the same trace together
*
*
repeat;
id R(a?,i1?,i2?)*R(b?,i2?,i3?) = R(a*b,i1,i3);
endrepeat;
*
b hpt2, hps2,hpt2;
*print;
.sort;
*
* now we are ready to take the traces
*
id R(a?,i1?,i1?) = a;
*
id R(a?,b?,c?) = 1/(1-1);
.sort;
*
#do hp =1,4
trace4 `hp';
#enddo
*
* trace the s-t interference
*
trace4 tu;
*
b hpt2, hps2;
*print;
.sort;
*
* simplify the expression
*
*id qa = qap + qep -qe;
id qap = qe + qa - qep;  
id qe.qe = -m^2;
id qep.qep =-m^2;
id qa.qa = -m^2;
*id qap.qap = -m^2;
*
b hps2,hpt2;
*print;
.sort;
*
* go to the P Q V basis P = qa +qe; Q =qe -qep; V =qe +qep;
*
id qe = 1/2*V+1/2*Q;
id qa = P - (1/2*V+1/2*Q);
id qep = 1/2*V-1/2*Q;
*
id qe = 1/(1-1);
id qa = 1/(1-1);
id qep = 1/(1-1);
*
* impose the simplifying relations of after formula 3.3
*
id P.Q =0;
id V.Q = 0;
id P.V = P.P;
id V.V = -Q.Q - 4*m^2;
*
b hpt2 ,hps2;
*print;
.sort;
*
id P.P = -s;
id Q.Q = -t;
id s = 4*m^2 -t -uu;
*
if (match( hpt2^2)==1);
id uu^2 = [u - 2*m^2]^2 - 4*m^4 + 4*uu*m^2;
elseif (match( hps2^2)==1);
id t^2 = [t - 2*m^2]^2 - 4*m^4 + 4*t*m^2;
else;
id uu^2 = [u+t]^2 - t^2 -2*uu*t;
endif;
*
id hpt2 = -[1/t];
id hps2 = -[1/u];
*
b [1/t],[1/s],[1/u];
*print;
.store;

*
#endprocedure;
*
*************************************************************************
*
* calculation of the differential cross section
*
#procedure s2(dummy)
*
g sig = hpINT*hpFLUX*hpDELT*hpMs;
*
id hpINT = Vl^2*[1/(2*pi)]^6*int(3,qep)*int(3,qap);
id hpMs  = 1/16*1/Vl^4*[1/Ee*Eep*Ea*Eap]*amp*[2*pi]^8*e^4;
*
id hpDELT = Vl*T*[1/(2*pi)]^4*del(4,qe+qa-qep-qap);
*
id [1/(2*pi)]*[2*pi] =1;
*
b [1/t],[1/s],[1/Ee*Eep*Ea*Eap],hpINT,hpFLUX,hpDELT,[1/(2*pi)],int,Vl,e,
del;
*print;
.sort;
*
* kill  int(3,qap) with the delta function;
*
id int(3,qap)*del(4,qe+qa-qep-qap) = del(1,qe+qa-qep-qap);
*
* introduce the flux factor: crucial!!
*
*  Ee*Ea/Sqrt[(qe.qa)^2-m^4] = Ee*Ea/Sqrt[1/4(-s+2*m^2)^2-m^4] =
*  2*Ee*Ea/Sqrt[s^2 -4*s*m^2] 
*
id hpFLUX = Vl/T*2*Ee*Ea*[1/Sqrt(s^2 -4*s*m^2)];
id Ee*Ea*[1/Ee*Eep*Ea*Eap] = [1/Eep*Eap];
*
b [1/t],[1/s],[1/Eep*Eap],hpINT,hpFLUX,hpDELT,[1/(2*pi)],int,Vl,T,e,
del,[1/Sqrt(s^2 -4*s*m^2)];
*print;
.sort;
*
*integration over  int(3,qep)
*
* use the fact that |qep|^2*d|qep| = Eep*|qep|*d Eep = 
* Eep*d Eep*Sqrt(Eep^2 - m^2) = Eep*d Eep*Sqrt(s/4 - m^2) = 
* 1/2*Eep*d Eep*Sqrt(s - 4*m^2)
*
id int(3,qep) = 1/2*Eep*int(1,Eep)*int(1,hpANGLE)*[Sqrt(s - 4*m^2)];
*
id [Sqrt(s - 4*m^2)]*[1/Sqrt(s^2 -4*s*m^2)] = [1/Sqrt(s)];
id Eep*[1/Eep*Eap] = [1/Eap];
*
* kill int(1,Eep) with the delta function
*
* but careful: we already know from kinematics that qe + qa = Sqrt[s]
* and also, from the conservation of three momentum (enforced by the 
* integration over del(3,...)) that it must be qep=qap.
* So to integrate over del(1,...) enforcing the conservation of energy, 
* one has to consider that the delta on which one is integrating is
*
* del(1,-2*Eep+Sqrt[s]) = 1/2*del(1,Eep - Sqrt[s]/2)
*
* THI GIVES A CRUCIAL FACTOR 1/2
*
id int(1,Eep)*del(1, - qep - qap + qe + qa) =1/2;
*
b [1/t],[1/s],[1/Eap],hpINT,hpFLUX,hpDELT,[1/(2*pi)],Vl,T,e,int,[1/Sqrt(s)];
*print;
.sort;
*
* finally Eap = Sqrt(s)/2
*
id [1/Eap] = 2*[1/Sqrt(s)]; 
id [1/Sqrt(s)]^2 = [1/s];
*
* since we are interested in the differential cross section, set int =1
*
id int(1,hpANGLE) =1;
*
b [1/u],[1/t],[1/s],[1/Eap],hpINT,hpFLUX,hpDELT,[1/(2*pi)],Vl,T,e,int,
[1/Sqrt(s)];
#message MOLLER DIFFERENTIAL CROSS SECTION: complete result
#message in terms of the mandelstam invariants s,t, and uu 
#message (= u = -s -t +4*m^2) 
*
print;
.store;
*
#endprocedure;
*
*************************************************************************
*
* the UR limit
*
#procedure s3(dummy) 
*
g dsig = hpdum;
*
id hpdum = sig;
*
id e^2*[1/(2*pi)] =  2*alph;
*
b [1/t],[1/s],hpINT,hpFLUX,hpDELT,Vl,T,alph,int,
[1/Sqrt(s)];
*print;
.sort;
*
id [u-2*m^2] =uu-2*m^2; 
id [u+t] = uu+t;
id uu =4*m^2 -s -t;
id [s+t] = s+t;
id [s -2*m^2] = s -2*m^2;
id s = 4*E^2;
id [1/s] = 1/4*[1/E]^2;
*
id [t-2*m^2] =t-2*m^2; 
id t = -2*(E^2 - m^2)*(1- cos_(th));
id [1/t] = -1/2*[1/(E^2 - m^2)]*[1/(1- cos_(th))];
id [1/u] = -1/2*[1/(E^2 - m^2)]*[1/(1+ cos_(th))];
*
id [1/E]*E =1;
*
b [1/(E^2 - m^2)],[1/(1- cos_(th))],[1/(1+ cos_(th))],alph,[1/E];
*print;
.sort;
*
* massless limit
*
id m = 0;
id [1/(E^2 - m^2)] = [1/E]^2;
id [1/E]*E =1;
*
b [1/(E^2 - m^2)],[1/(1- cos_(th))],[1/(1+ cos_(th))],alph,[1/E];
*print;
.sort;
*
* bring all in 1/(1- cos_(th))
*
repeat;
id [1/(1- cos_(th))]*cos_(th) = -(1-[1/(1- cos_(th))]);
id [1/(1+ cos_(th))]*cos_(th) = (1-[1/(1+ cos_(th))]);
endrepeat;
*
id [1/(1- cos_(th))] = 1/2*[1/sin_(th/2)]^2;
id [1/(1+ cos_(th))] = 1/2*[1/cos_(th/2)]^2;
*
multiply hpt;
*
id hpt*[1/sin_(th/2)]^4 = [1/sin_(th/2)]^4;
id hpt*[1/cos_(th/2)]^4 = [1/cos_(th/2)]^4;
id hpt*[1/sin_(th/2)]^2*[1/cos_(th/2)]^2 =
[1/sin_(th/2)]^2*[1/cos_(th/2)]^2;
id hpt*[1/sin_(th/2)]^2 = [1/sin_(th/2)]^2*[1/cos_(th/2)]^2*cos_(th/2)^2;
id hpt*[1/cos_(th/2)]^2 = [1/sin_(th/2)]^2*[1/cos_(th/2)]^2*sin_(th/2)^2;
id hpt =1;
id sin_(th/2)^2 = 1-cos_(th/2)^2;
*
b [1/(E^2 - m^2)],[1/(1- cos_(th))],[1/(1+ cos_(th))],Vl,T,alph,[1/E],
[1/u],[1/sin_(th/2)],[1/cos_(th/2)];
#message MOLLER DIFFERENTIAL CROSS SECTION: UR limit
#message expressed in terms of E (energy of the incoming particles)
#message and theta, the scattering angle. It matches with the 
#message result reported in Itzykson Zuber, formula (6.43)
print;
.sort;
#endprocedure
*************************************************************************
*
* the UR limit in terms of the Mandelstam invariants
*
#procedure s4(dummy) 
*
g dsig = hpdum;
*
id hpdum = sig;
*
id e^2*[1/(2*pi)] =  2*alph;
*
b [1/t],[1/s],hpINT,hpFLUX,hpDELT,Vl,T,alph,int;
*print;
.sort;
*
id [s-2*m^2] = s;
id [t-2*m^2] = t;
id [u-2*m^2] = uu;
id m = 0;
id [s+t] =s+t;
*
b [1/u],[1/t],[1/s],hpINT,hpFLUX,hpDELT,Vl,T,alph,int,
[alph^2/s];
#message MOLLER DIFFERENTIAL CROSS SECTION: UR limit
#message expressed in terms of the Mandelstam invariants
print;
.sort;
*
#endprocedure
*
*************************************************************************
*
* the non relativistic limit
*
#procedure s5(dummy) 
*
g dsig = hpdum;
*
id hpdum = sig;
*
id e^2*[1/(2*pi)] =  2*alph;
*
b [1/t],[1/s],hpINT,hpFLUX,hpDELT,Vl,T,alph,int,
[1/Sqrt(s)];
*print;
.sort;
*
id [u-2*m^2] =uu-2*m^2; 
id [u+t] = uu+t;
id uu =4*m^2 -s -t;
id [s+t] = s+t;
id [s -2*m^2] = s -2*m^2;
id s = 4*E^2;
id [1/s] = 1/4*[1/E]^2;
*
id [t-2*m^2] =t-2*m^2; 
id t = -2*(E^2 - m^2)*(1- cos_(th));
id [1/t] = -1/2*[1/(E^2 - m^2)]*[1/(1- cos_(th))];
id [1/u] = -1/2*[1/(E^2 - m^2)]*[1/(1+ cos_(th))];
*
id [1/E]*E =1;
*
b [1/(E^2 - m^2)],[1/(1- cos_(th))],[1/(1+ cos_(th))],alph,[1/E];
*print;
.sort;
*
* non rel limit
*
id [1/(E^2-m^2)] = [1/m]^2*([1/v]^2-1);
*id [1/(E^2-m^2)] =[1/E]^2*[1/v]^2;
id E = m+1/2*m*v^2 + 3/8*m*v^4 +  5/16*m*v^6+ 35/128*m*v^8+ hp10*v^10;
id [1/E] = [1/m]*(1 -1/2*v^2-1/8*v^4 -1/16*v^6 -5/128*v^8+ hp10*v^10);
id v*[1/v] =1;
id m*[1/m] =1;
id v = 0;
*
repeat;
id cos_(th)*[1/(1-cos_(th))] = -(1 - [1/(1-cos_(th))]); 
id cos_(th)*[1/(1+cos_(th))] = (1 - [1/(1+cos_(th))]); 
endrepeat;
id [1/(1- cos_(th))] = 1/2*[1/sin_(th/2)]^2;
id [1/(1+ cos_(th))] = 1/2*[1/cos_(th/2)]^2;
*
b [1/(E^2 - m^2)],[1/(1- cos_(th))],[1/sin_(th/2)],[1/cos_(th/2)],
alph,[1/m],[1/v];
*print;
.sort;
*
* we now isolate the leading term in powers of 1/v
* 
multiply pw(0);
*
id pw(0)*[1/v]^n? = pw(-n)*[1/v]^n;
*
b pw,[1/(E^2 - m^2)],[1/(1- cos_(th))],[1/sin_(th/2)],[1/cos_(th/2)],
alph,[1/m],[1/v];
#message MOLLER DIFFERENTIAL CROSS SECTION: low energy limit
#message expressed in terms of the velocity of the incoming 
#message particle and of the scattering angle.
#message the leading terms coincide with what is written in 
#message Itzykson Zuber (6-44)
print;
.sort;
#endprocedure
*
*************************************************************************
*
#call s1(dummy)
#call s2(dummy)
#call s3(dummy)
#call s4(dummy)
#call s5(dummy)
.end









