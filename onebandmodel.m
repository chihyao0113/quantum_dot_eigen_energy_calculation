clear all;

load Ho11.mat;
load delEc.mat;
load n.mat;

D=Ho11+delEC;
clear H11 delEC;

%D=sparse(D);


[Cmn,E]=eigs(D,5,2.8);
%save EigenVector.mat Cmn;
%save EigenEnergy.mat E;

E=real(diag(E));

 [E,index]=sort(E);
 E
 index

save index.mat index;
