clear all;
disp('reshapeHo.m Start');
load Ho.mat;
load n.mat;
nx=nx/2;ny=ny/2;nz=nz/2;
nxyz=(2*nx+1)*(2*ny+1)*(2*nz+1);
H=zeros(4*nxyz,4*nxyz);


Ho11=diag(Ho11);Ho12=diag(Ho12);Ho13=diag(Ho13);Ho14=diag(Ho14);
Ho21=diag(Ho21);Ho22=diag(Ho22);Ho23=diag(Ho23);Ho24=diag(Ho24);
Ho31=diag(Ho31);Ho32=diag(Ho32);Ho33=diag(Ho33);Ho34=diag(Ho34);
Ho41=diag(Ho41);Ho42=diag(Ho42);Ho43=diag(Ho43);Ho44=diag(Ho44);

Ho11=sparse(Ho11);Ho12=sparse(Ho12);Ho13=sparse(Ho13);Ho14=sparse(Ho14);
Ho21=sparse(Ho21);Ho22=sparse(Ho22);Ho23=sparse(Ho23);Ho24=sparse(Ho24);
Ho31=sparse(Ho31);Ho32=sparse(Ho32);Ho33=sparse(Ho33);Ho34=sparse(Ho34);
Ho41=sparse(Ho41);Ho42=sparse(Ho42);Ho43=sparse(Ho43);Ho44=sparse(Ho44);

%save Ho11.mat Ho11

H=[Ho11,Ho12,Ho13,Ho14;
    Ho21,Ho22,Ho23,Ho24;
    Ho31,Ho32,Ho33,Ho34;
    Ho41,Ho42,Ho43,Ho44;];
H=sparse(H);

save H.mat H;
disp('reshapeHo.m End');