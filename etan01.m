clc;
clear all;
disp('etan01.m Start');
tic;

%**************************************************************************

d=[25.0 25.000000000010 12];
dx=d(1);
dy=d(2);
dz=d(3);
Volume=(dx*dy*dz);

n=[4,4,4];
nx=n(1);     ny=n(2);    nz=n(3);
% err=0.000001;
err=0.000001;
nx=2*nx;ny=2*ny;nz=2*nz;
save CubicSize.mat dx dy dz Volume;
save n.mat nx ny nz;
%**************************************************************************

Rt=4;
Rb=8.5;
h=4.1;
N=6;
w=1;

save  QDSize.mat Rt Rb h N w;

%**************************************************************************

[etax,etay,etaz]=meshgrid((-nx-err:nx+err)*((2*pi)/dx),(-ny-err:ny+err)*((2*pi)/dy),(-nz-err:nz+err)*((2*pi)/dz));

eta = sqrt(etax.^2+etay.^2+etaz.^2);
save eta.mat eta etax etay etaz;



xQD = XQD(etax,etay,etaz,N,Rt,Rb,h)/(Volume);

%xCylinder= exp(-j*h/2*etaz).*Xcylinder(etax,etay,etaz,Rt,h)/Volume;

%************************************************************************
%  h_cyl=3;
% D=[12 8];
% r_cyl=[D(1)/2 D(2)/2];
% xDisk1 = exp(-j*2*etaz).*Xcylinder(etax,etay,etaz,D(1),h_cyl)/Volume;
% xDisk2 = exp(-j*2*etaz).*Xcylinder(etax,etay,etaz,D(2),h_cyl)/Volume;
% xRing= xDisk1-xDisk2;
%  save Ringsize.mat r_cyl h_cyl;
%************************************************************************
%xWL = exp(j*w*etaz).*XQD(etax,etay,etaz,4,sqrt(2)*dx/2,sqrt(2)*dy/2,w)/(Volume);

xWL = exp(j*w*etaz).*Xcuboid(etax,etay,etaz,dx,dy,w)/Volume;
Xtotal=(xQD+xWL);









Xtotal(nx+1,ny+1,nz+1)=0;
save XQD.mat Xtotal;

[e11,e12,e13,e21,e22,e23,e31,e32,e33]= es(etax,etay,etaz,N,Rt,Rb,h);
%[e11,e12,e13,e21,e22,e23,e31,e32,e33]= esZB(etax,etay,etaz);
% e11(nx+1,ny+1,nz+1)=0;
% e12(nx+1,ny+1,nz+1)=0;
% e13(nx+1,ny+1,nz+1)=0;
% e21(nx+1,ny+1,nz+1)=0;
% e22(nx+1,ny+1,nz+1)=0;
% e31(nx+1,ny+1,nz+1)=0;
% e32(nx+1,ny+1,nz+1)=0;
% e33(nx+1,ny+1,nz+1)=0;

%**************************************************************************

save  es.mat e11 e12 e13 e21 e22 e23 e31 e32 e33;
disp('etan01.m is End');
toc;