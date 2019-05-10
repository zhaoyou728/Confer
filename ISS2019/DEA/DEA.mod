set I;
set J;
set K;
set K_;

param IND{K,I};
param OUTD{K,J};

var INW{I}>=0;
var OUTW{J}>=0;
#var a;

maximize objective:sum{k_ in K_,j in J}OUTD[k_,j]*OUTW[j];

subject to C1{k_ in K_}:

sum{i in I}IND[k_,i]*INW[i]==1;


subject to C2{k in K}:

sum{j in J}OUTD[k,j]*OUTW[j]<=sum{i in I}IND[k,i]*INW[i];
