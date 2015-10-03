* sChannel.frm
* by Professor Ferroglia (rewritten by Ray D. Sameshima)

Off statistics;

* q's are momentum of in/out electrons
AutoDeclare Vectors q;
* never use p and k
* AutoDeclare Vectors q,p,k;
Vectors Q,P,V;
AutoDeclare Symbols i,j,l,r,sr; 
* AutoDeclare Symbols i,j,l,m,r,sr; 
Symbols m,M,n;

* kinem invariants
Symbols s,t,[s - 2*m^2],[t - 2*m^2],[s+t],
        [1/t],[1/s],[1/Sqrt(s^2 -4*s*m^2)],
        [1/s/t],[1/s+1/t],[t/s],[s/t],[1/v],[1/m];

* energies and momenta;
Symbols [1/Ee*Eep*Ea*Eap],[1/Eep*Eap],
        [Sqrt(s - 4*m^2)],[1/Sqrt(s)],[1/Eap],
        [1/E],th,[1/(E^2 - 4*m^2)],[1/(1- cos_(th))],
        [alph^2/2/E^2],
        [1/(E^2-m^2)],[1/(E^2 - m^2)/(1- cos_(th))],
        [1/sin_(th/2)],[alph^2/s];

AutoDeclare Indices du,t;
Indices mu,nu,ro,de,al,be,ga,si,la;
AutoDeclare Symbols a,b,c,e,hp,tr,T,[2*pi],[1/(2*pi)],Vl,E;
CFunctions R,ub,vb,u,v,gd,pw,del,cos;
Function int;

.global

#procedure s1(dummy)
* write a procedure that takes care to calculate the
* sum over the spins. 
   
*     pa                   pep  
*        \              /        
*         \            /        
*          \__________/        
*          /          \       
*         /            \     
*        /              \   
*     pe                 pap  
*                    
*           s-channel       
*

* Global amp = 1/4*srsc * srs;
Global amp = 1/4*(srtc - srsc)*(srt - srs);

* this is the string corresponding to the (complex conjugate)
* tree level bhabha in the  t-channel
*
* qe  is  the momentum of the incoming  e^- (p1) 
* qep is  the momentum of the outgoing  e^- (p3)
* qa  is  the momentum of the incoming  e^+ (p2)
* qap is  the momentum of the outgoing  e^+ (p4)
*
* WARNING: t-channel diagrams: the fermion line involving the
* incoming particle and the outgoing particle should be labelled 1
* the antiparticle line should be labelled 2
*
* s-channel diagrams: the fermion line including the incominpartiche and
* antiparticle should be labelled 3. the feriom line including the
* outgoing particle and antiparticle should be labelled 4
*
* srt and src are the complex conjugate of the tree level strings
* of gamma matrices srt and srs
*

id srtc = R(ub(1,qe),i1)*R(g_(1,mu),i1,i2)*R(u(1,qep),i2)*
          R(vb(2,qap),i3)*R(g_(2,mu),i3,i4)*R(v(2,qa),i4)*hpt2;

id srsc = R(ub(3,qe),l1)*R(g_(3,nu),l1,l2)*R(v(3,qa),l2)*
          R(vb(4,qap),l3)*R(g_(4,nu),l3,l4)*R(u(4,qep),l4)*hps2;

id srt = R(ub(1,qep),j1)*R(g_(1,al),j1,j2)*R(u(1,qe),j2)*
         R(vb(2,qa),j3)*R(g_(2,al),j3,j4)*R(v(2,qap),j4)*hpt2;

id srs = R(vb(3,qa),r1)*R(g_(3,be),r1,r2)*R(u(3,qe),r2)*
         R(ub(4,qep),r3)*R(g_(4,be),r3,r4)*R(v(4,qap),r4)*hps2;

* print;
.sort;

* sum over the spins
if ((match(hps2*hps2)==1) || (match(hpt2*hpt2)==1));
* hp is now from 1 to 4
  #do hp =1,4
    id R(u(`hp',q?),i1?)*R(ub(`hp',q?),i2?) = R(-i_*g_(`hp',q)+m,i1,i2);
    id R(v(`hp',q?),i1?)*R(vb(`hp',q?),i2?) = R(-i_*g_(`hp',q)-m,i1,i2);
  #enddo

elseif (match(hpt2*hps2)==1);
* In argument environmen with no further information, 
* the statement are applied to all arguments of all functions.
  argument;
  #do hp =1,4
    id g_(`hp',mu?) = g_(tu,mu);
    id u(`hp',q?)   = u(tu,q);
    id ub(`hp',q?)  = ub(tu,q);
    id v(`hp',q?)   = v(tu,q);
    id vb(`hp',q?)  = vb(tu,q);
  #enddo
  endargument;

  repeat;
    id R(u(tu,q?),i1?)*R(ub(tu,q?),i2?) = R(-i_*g_(tu,q)+m,i1,i2);
    id R(v(tu,q?),i1?)*R(vb(tu,q?),i2?) = R(-i_*g_(tu,q)-m,i1,i2);
  endrepeat;

else;
  multiply 1/(1-1);
endif;

* tu is the index of the unique trace that one gets when interfering
* a s-channel diagram with a t-channel diagram
* 
* check that all the spinor components are gone

* bracket
Bracket hpt2,hps2,hps4;
*print;
.sort;
*
* put the terms belonging to the same trace together
*

repeat;
  id R(a?,i1?,i2?)*R(b?,i2?,i3?) = R(a*b,i1,i3);
endrepeat;

Bracket hpt2,hps2,hpt2;
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

* trace the s-t interference
* trace4 is the statement for 4*4 gamma matrices
trace4 tu;
*
Bracket hpt2,hps2;
*print;
.sort;
*
* simplify the expression
*
*id qa = qap + qep -qe;
id qap     = qe + qa - qep;  
id qe.qe   = -m^2;
id qep.qep = -m^2;
id qa.qa   = -m^2;
*id qap.qap = -m^2;
*
Bracket hps2,hpt2;
*print;
.sort;
*
* go to the P Q V basis P = qa +qe; Q =qe -qep; V =qe +qep;
*
id qe  = 1/2*V+1/2*Q;
id qa  = P - (1/2*V+1/2*Q);
id qep = 1/2*V-1/2*Q;
*
id qe  = 1/(1-1);
id qa  = 1/(1-1);
id qep = 1/(1-1);
*
* impose the simplifying relations of after formula 3.3
*
id P.Q = 0;
id V.Q = 0;
id P.V = P.P;
id V.V = -Q.Q - 4*m^2;
*
b hpt2 ,hps2;
*print;
.sort;

id P.P = -s;
id Q.Q = -t;

if (match(hpt2^2)==1);
  id s^2 = [s - 2*m^2]^2 - 4*m^4 + 4*s*m^2;

elseif (match( hps2^2)==1);
  id t^2 = [t - 2*m^2]^2 - 4*m^4 + 4*t*m^2;

else;
  id s^2 = [s+t]^2 - t^2 -2*s*t;

endif;

id hpt2 = -[1/t];
id hps2 = -[1/s];

Bracket [1/t],[1/s];
print;
* .store;

#endprocedure;

*************************************************************************

#call s1(dummy)
.end
