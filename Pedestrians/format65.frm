* format65.frm

AutoDeclare Vector v;
Local F = dd_(v1,v1,v1,v1,v1,
              v2,v2,v2,v2,v2,
              v3,v3,v3,v3,
              v4,v4,v4,
              v5,v5,v5,
              v6,v6);
id v?.v? = 0; * loop-free
id v1?.v2?^2 = 0; * no multiple edges
Format 65;
Print F;
.end
