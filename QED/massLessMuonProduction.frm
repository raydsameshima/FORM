* muon production in mass less limit
* e^- e^+ -> mu^- mu^+
*
* \ e^-(p_1)      / mu^-(k_1)
*  \             /
*   \           /
*    *^^^^^^^^^*
*   / s=p_1+p2  \
*  /             \
* / e^+(p_2)      \ mu^+(k_2)
*

Off statistics;

Vectors p1,p2,k1,k2;
Symbols s,t,u,e;
Indices mu,nu,rho,sigma;

Local M2 = 
* electron lines, 1 is a label for electrons
      g_(1,p1,rho,p2,sigma) *
* photon propagator
      e^2*d_(rho,mu) * e^2*d_(sigma,nu) / s^2 *
* muon lines, 2 is the label for muons
      g_(2,k1,mu,k2,nu);

* Local [M^2] = 
* electron lines, 1 is a label for electrons
*      g_(1,p1,mu) * g_(1,p2,nu) *
* photon propagator
*      e^2/s * e^2/s *
* muon lines, 2 is the label for muons
*      g_(2,k1,mu) * g_(2,k2,nu);



Trace4,1;
Trace4,2;
Bracket e,s;
Print;
.sort

id p1.p2 = s/2;
id k1.k2 = s/2;
id p1.k1 = -t/2;
id p2.k2 = -t/2;
id p1.k2 = -u/2;
id p2.k1 = -u/2;

Bracket e,s;
* Peskin & Schroeder eq.(5.70)
Print;
.end
