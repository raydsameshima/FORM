* graph.frm

AutoDeclare Vector v;
On Statistics;
Local F = dd_(v1,v1,v1,v2,v2,v2,v3,v3,v3,v4);
Print +s F;
.sort

* only loop-free graph
Off Statistics;
id v1.v1 = 0;
id v2.v2 = 0;
id v3.v3 = 0;
Print +s F;
.sort

* no multiple edge
id v1.v2^2 = 0;
id v1.v3^2 = 0;
id v2.v3^2 = 0;
Print +s F;
.clear

****************************************************
* 3.2.1
*

AutoDeclare Vector v;
AutoDeclare Index i;
CTensor f(symmetric);

Local G = dd_(v1,v2,v3,v3,v4,v4,v5,v5,v5,v6,v6,v6);

id v?.v?     = 0; * loop free
id v1?.v2?^2 = 0; * no multiple edged
id v1.v2     = 0; * connected

Format 65;
Print;
.sort

repeat;
  #do l=1, 6
    #do k=1, 'l'
      id v'k'.v'l' = f(i'k', i'l');
    #enddo
  #enddo
endrepeat;

if (findLoop(f, arguments=2, loopsize=3)) discard;

repeat;
   #do l=1, 6
    #do k=1, 'l'
      id f(i'k', i'l') = v'k'.v'l';;
    #enddo
  #enddo
endrepeat;

Print; 
.end
