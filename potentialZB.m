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
epi14QD =0.5;
epi14M = 0.59;

epir = 9.6;

PspontQD = 0;
PspontM = 0;

depi14 = (epi14QD-epi14M);
%**************************************************************************


psi_spont    = (1000/8.85)*((-sqrt(-1)*etaz)./((epir)*eta.^2)).*((PspontQD-PspontM)*Xtotal);

psi_strain   = (1000/8.85)*((-sqrt(-1))./((epir)*eta.^2)).*(2*epi14M*(etax.*e23+etay.*e13+etaz.*e12));


%*************************** 計算量最大的地方*******************************
%這邊還要再檢查
exi12 =convn(e12,Xtotal,'same');
exi13 =convn(e13,Xtotal,'same');
exi23 =convn(e23,Xtotal,'same');

%psi_deipslon =(1000/8.85)*((-sqrt(-1))./(epir*eta.^2)).*(2*depi14*(etax.*e23+etay.*e31+etaz.*e12));
psi_deipslon =(1000/8.85)*((-sqrt(-1))./(epir*eta.^2)).*(2*depi14*(etax.*e23+etay.*e13+etaz.*e12));
%**************************************************************************
psi_strain=psi_strain+psi_deipslon;

psi = psi_spont+psi_strain;
psi(nx+1,ny+1,nz+1)=0;
save potential.mat psi psi_spont psi_strain;

disp('potential.m End');

toc;