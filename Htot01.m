clear all;

load H.mat;
load V.mat;
load n.mat;

D=H+V;
clear H V;

%D=sparse(D);
%D = blkdiag(D(1:size(D,1),1:size(D,2)));

[Ve,Ee]=eigs(D,8,2.7);
[Vh,Eh]=eigs(D,8,0.5);




Ee=diag(Ee);
Eh=diag(Eh);

Ee=real(Ee);
Eh=real(Eh);


[Ee,Eidx]=sort(Ee);
[Eh,Hidx]=sort(Eh,'descend');
save EigenVector.mat Ve Vh;
save index.mat Eidx Hidx;
save EigenEnergy.mat Ee Eh;


