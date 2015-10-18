<<<<<<< HEAD
* muon production tree level
* Ray D. Sameshima
*
*  \ e^-(p_1)      / mu^-(k_1)
*   \             /
*    \           /
*     *^^^^^^^^^*
*    / s=p_1+p2  \
*   /             \
*  / e^+(p_2)      \ mu^+(k_2)
* 
=======
* muon production tree level Ray D. Sameshima
* 
* 
*  \ e^-(p_1)      / mu^-(k_1)
*   \             /
*    \           /
*     *~~~~~~~~~*
*    / s=p_1+p2  \
*   /             \
*  / e^+(p_2)      \ mu^+(k_2)
*
>>>>>>> e5266ea272608a745b3e8eeeb767962ea856078c

Off statistics;

Vectors p1,p2,k1,k2;
Symbols s,t,u,e;
Symbols eMass,muMass;
Indices mu,nu;

Local [M^2] = 1/4 * 
* electron lines, 1 is a label for electrons
      (g_(1,p2) - eMass) * g_(1,mu) * (g_(1,p1) + eMass) * g_(1,nu)*
* photon propagator
      e^2/s * e^2/s *
* muon lines, 2 is the label for muons
      (g_(2,k2) - muMass) * g_(2,mu) * (g_(2,k1) + muMass) * g_(2,nu);

Trace4,1;
Trace4,2;
Bracket e,s;
Print +s;
* Three terms are the same as Peskin & Schroder eq.(5.10)
* and my other code.
.sort

id p1.p2 = s/2 - eMass^2;
id k1.k2 = s/2 - muMass^2;
id p1.k1 = (t - eMass^2 -muMass^2)/2;
id p2.k2 = (t - eMass^2 -muMass^2)/2;
id p1.k2 = (u - eMass^2 -muMass^2)/2;
id p2.k1 = (u - eMass^2 -muMass^2)/2;

Bracket e,s;
Print +s;
* .sort
* 
* Peskin & Schroeder eMass to zero limit
* id eMass =0; 
* Bracket e,s;
* Print +s;
* .sort
* 
* Peskin & Schroeder eq.(5.70)
* id muMass =0;
* Bracket e,s;
* Print +s;
.end
