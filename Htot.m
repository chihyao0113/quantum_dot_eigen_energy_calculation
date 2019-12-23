clear all;

load H.mat;
load V.mat;
load n.mat;

D=H+V;
clear H V;

%D=sparse(D);
%D = blkdiag(D(1:size(D,1),1:size(D,2)));

[Cmn,E]=eigs(D,5,0.5);
save EigenVector.mat Cmn;
save EigenEnergy.mat E;

E=real(diag(E));

 [E,index]=sort(E);
 E
 index

save index.mat index;



