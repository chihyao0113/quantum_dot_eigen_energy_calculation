clear all;
disp('Vmatrix.m Start');

load n.mat;
load CubicSize.mat;
load XQD.mat;
load es.mat;
load potential.mat;

%XQDm=1-Xtotal;

XQDm=-Xtotal;
XQDm(nx+1,ny+1,nz+1)=1;

EgQD = 3.5; EgM = 6.28;
U = EgM-EgQD;
Qc = 0.75;
Uc = U*Qc;
Uv = U*(1-Qc);


Delta1QD = 0.022; Delta1M = -0.104;
Delta2QD = 0.005; Delta2M = 0.004;
Delta3QD = 0.005; Delta3M = 0.004;

delDelta1=Delta1M-Delta1QD;
delDelta2=Delta2M-Delta2QD;
delDelta3=Delta3M-Delta3QD;


A1QD = -7.24; A1M = -4.17;
A2QD = -0.51; A2M = -0.58;
A3QD =  6.73; A3M =  3.68;
A4QD = -3.36; A4M = -2.17;
A5QD = -3.35; A5M = -2.27;
A6QD = -4.72; A6M = -2.21;

D1QD =  0.7 ; D1M =  0.7;
D2QD =  2.1 ; D2M =  2.1;
D3QD =  1.4 ; D3M =  1.4;
D4QD = -0.7 ; D4M = -0.7;
D5QD = -0.7 ; D5M = -0.7;
D6QD =  1.4 ; D6M =  1.4;
% m0 = 9.1095e-31;
% hbar=6.5822e-16;
% %hbar=1.055e-34;
% mep =0.2*m0;
% mev =0.18*m0;
acQD= -4.08; acM= -4.08;
delac=acM-acQD;
%**************************************************************************
delA1 =A1M-A1QD;
delA2 =A2M-A2QD;
delA3 =A3M-A3QD;
delA4 =A4M-A4QD;
delA5 =A5M-A5QD;
delA6 =A6M-A6QD;
%**************************************************************************
delD1 =D1M-D1QD;
delD2 =D2M-D2QD;
delD3 =D3M-D3QD;
delD4 =D4M-D4QD;
delD5 =D5M-D5QD;
delD6 =D6M-D6QD;


%**************************************************************************
exim11 =convn(XQDm,e11,'same');
exim22 =convn(XQDm,e22,'same');
exim33 =convn(XQDm,e33,'same');
exim12 =convn(XQDm,e12,'same');
exim13 =convn(XQDm,e13,'same');
exim23 =convn(XQDm,e23,'same');

save BandParameter.mat XQDm Uc Uv;
save delDeltax.mat delDelta1 delDelta2 delDelta3; 
save acx.mat acQD acM delac;
save DxQD.mat  D1QD  D2QD  D3QD  D4QD  D5QD  D6QD;
save delAx.mat delA1 delA2 delA3 delA4 delA5 delA6;
save delDx.mat delD1 delD2 delD3 delD4 delD5 delD6;
save eximxx.mat exim11 exim22 exim33 exim12 exim13 exim23;

disp('Vmatrix.m End');
