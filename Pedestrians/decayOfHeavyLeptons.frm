* e^- e^+ -> tau^- tau^+ -> u dbar nu ubar d nubar
* 
* \                //
*  \          _   //
*   \        / \ //
*    *~~~~~~*   *
*   /        \_/ \\
*  /              \\
* /                \\
*


Vectors p1, ..., p8, Q, q1,q2;
Indices m1,m2,m3,n1,n2,n3;
Symbols eMass, tauMass, mass4,mass5,mass7,mass8;

Local F =
* The incomming electron pair, p1,p2
      (g_(1,p2) - eMass) * g_(1,m1) * (g_(1,p1) + eMass) * g_(1,n1)*
* The tau lines, q1,q2
      g_(2,p3) * g_(2,m2)*g7_(2)*
      (g_(2,q1) + tauMass) * g_(2,m1)*
      (g_(2,q2) - tauMass) * g_(2,m3) * g7_(2) * g_(2,p6)*
      g_(2,n3) * g7_(2) * (g_(2,q2) - tauMass) * g_(2,n1)*
      (g_(2,q1) + tauMass) * g_(2,n2) * g7_(2)*
* The u dbar pair, p4, p5
      (g_(3,p4) + mass4) * g_(3,m2) * g7_(3)*
      (g_(3,p5) - mass5) * g_(3,n2) * g7_(3)*
* The d ubar pair, p7, p8
      (g_(4,p7) + mass7) * g_(4,m3) * g7_(4)*
      (g_(4,p8) - mass8) * g_(4,n3) * g7_(4);

trace4,1;
trace4,2;
trace4,3;
trace4,4;
contract;
Print +s;
.end
