clear all;
tic;
disp('potential.m Start');

load XQD.mat;
load es.mat;
load eta.mat;
load n.mat;
load QDSize.mat;
load CubicSize.mat;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));

%**************************************************************************
%這邊整個程式寫完後要改寫
epi15QD =-0.49;
epi15M = -0.6;

epi31QD =-0.49;
epi31M = -0.6;

epi33QD =0.73;
epi33M = 1.46;

epir = 9.6;

PspontQD = -0.029;
PspontM = -0.081;

depi15 = (epi15QD-epi15M);
depi31 = (epi31QD-epi31M);
depi33 = (epi33QD-epi31M);
%**************************************************************************


psi_spont    = (1000/8.85)*((-sqrt(-1)*etaz)./((epir)*eta.^2)).*((PspontQD-PspontM)*Xtotal);

psi_strain   = (1000/8.85)*((-sqrt(-1))./((epir)*eta.^2)).*(2*epi15M*(etax.*e13+etay.*e23)+epi31M*(etaz.*(e11+e22))+epi33M*(etaz.*e33));


%*************************** 計算量最大的地方*******************************
%這邊還要再檢查

exi13 =convn(e13,Xtotal,'same');

exi23 =convn(e23,Xtotal,'same');

exi11 =convn(e11,Xtotal,'same');

exi22 =convn(e22,Xtotal,'same');

exi33 =convn(e33,Xtotal,'same');

% exi13=exi13/(dx*dy*dz);
% exi23=exi23/(dx*dy*dz);
% exi11=exi11/(dx*dy*dz);
% exi22=exi22/(dx*dy*dz);
% exi33=exi33/(dx*dy*dz);
psi_deipslon =(1000/8.85)*((-sqrt(-1))./(epir*eta.^2)).*(2*depi15*(etax.*exi13+etay.*exi23)+depi31*(etaz.*(exi11+exi22))+depi33*(etaz.*exi33));

%**************************************************************************
psi_strain=psi_strain+psi_deipslon;
psi = psi_spont+psi_strain;
%psi(nx+1,ny+1,nz+1)=0;
save potential.mat psi psi_spont psi_strain;

disp('potential.m End');

toc;