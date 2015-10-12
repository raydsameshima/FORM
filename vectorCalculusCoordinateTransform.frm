* vectorCalculusCoordinateTransform.frm
* section 2.3.4 Vector Calculus: Coordinate Tranformations

Vectors x,y;
Tensors g,a,b;
Indices i,j,k;

Local [y(k)] = b(k,x);
Local [T(i)] = g(i,j) * a(j,k) * [y(k)];

id a(i?, k?) * b(k?,j?) = d_(i,j);

Print;
.end
