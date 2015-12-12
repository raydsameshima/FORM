* MyBhabhaScattering.frm

* amplitudes
* This declaration allow me to use Ms,Mt,Msc,and Mtc.
AutoDeclare Symbols M;
* pe is the momentum of initial electron
* pp is the momentum of initial positron
AutoDeclare Vectors pe,pp,ke,kp;
* spins
Symbols se,sp,re,rp;
* spin indices
AutoDeclare Indices i,j;
* Lorentz indices
Indices mu, nu;
CFunctions u,v,ubar,vbar;
CFunctions gamma;

Symbols [e^2], [1/q^2];
Symbol [SumOverSpins];

CFunctions pbar, mass;

Global [M^2] = 1/4 * [SumOverSpins] * (Msc - Mtc) * (Ms - Mt);

id Ms = [e^2] * [1/q^2] * 
        vbar(pp,sp,i1) * gamma(mu,i1,i2) * u(pe,se,i2) * 
        ubar(ke,re,i3) * gamma(mu,i3,i4) * v(kp,rp,i4);

id Mt = [e^2] * [1/q^2] *
        ubar(ke,re,i1) * gamma(nu,i1,i2) * u(pe,se,i2) * 
        vbar(pp,sp,i3) * gamma(nu,i3,i4) * v(kp,rp,i4);

id Msc= [e^2] * [1/q^2] * 
        vbar(kp,rp,j1) * gamma(mu,j1,j2) * u(ke,re,j2) * 
        ubar(pe,se,j3) * gamma(mu,j3,j4) * v(pp,sp,j4);

id Mtc = [e^2] * [1/q^2] *
        vbar(kp,rp,j1) * gamma(nu,j1,j2) * v(pp,sp,j2) * 
        ubar(pe,se,j3) * gamma(nu,j3,j4) * u(ke,re,j4);

Print [M^2] +s;
.sort;

Print +s;
.end
