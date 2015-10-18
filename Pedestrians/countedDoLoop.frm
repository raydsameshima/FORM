* countedDoLoop.frm

#define MAX "10"

Off statistics;

Local S1 =
#do i = 1, 'MAX'
  + 'i'
#enddo
;

Print;
.sort

Local S2 = 1 + ... + 'MAX';
Print;
.sort

Local S3 =
#do i = 1,5
  #do j = 0,1
    + 2*'i' - 'j'
  #enddo
#enddo 
;
Print;
.clear

Off Statistics;
Local S0 = 0;
#do i = 1,10
  Local S'i' = S{'i' -1} + 'i';
#enddo
Print S10;
.end
