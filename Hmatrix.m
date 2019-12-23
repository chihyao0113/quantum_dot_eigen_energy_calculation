disp('Hmatrix.mat Start');
clear all;
load n.mat;
nx=nx/2;ny=ny/2;nz=nz/2;
load CubicSize.mat;
Eg = 3.5;
Delta1 = 0.022;
Delta2 = 0.005;
Delta3 = 0.005;
A1 = -7.24;
A2 = -0.51;
A3 = 6.73;
A4 = -3.36;
A5 = -3.35;
A6 = -4.72;
D1 = 0.7;
D2 = 2.1;
D3 = 1.4;
D4 = -0.7;
D5 = -0.7;
D6 = 1.4;
m0 = 9.1095e-31;
hbar=6.5822e-16;
%hbar=1.055e-34;
mev =0.2*m0;
mep =0.18*m0;
ac = - 4.08;




Pp = sqrt((hbar^2/(2*m0))*(m0/mep-1)*(((Eg+Delta1+Delta2)*(Eg+2*Delta2)-2*Delta3^2)/(Eg+2*Delta2)));
Pv = sqrt( (hbar^2/(2*m0))*(m0/mev-1)*( Eg*((Eg+Delta1+Delta2)*(Eg+2*Delta2)-2*Delta3^2)/((Eg+Delta2)*(Eg+Delta1+Delta2)-Delta3^2    ) ) );

A1tilt = A1 + (2*m0/(hbar^2))*(Pv.^2/Eg);
A2tilt = A2;
A3tilt = A3 - (2*m0/(hbar^2))*(Pv.^2/Eg);
A4tilt = A4 + (m0/hbar^2)*(Pp.^2/Eg);
A5tilt = A5 + (m0/hbar^2)*(Pp.^2/Eg);
A6tilt = A6 + sqrt(2)*(m0/hbar^2)*((Pp.*Pv)/Eg);

[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
p = zeros(size(etax));

% kx=(p-etax);
% ky=(p-etay);
% kz=(p-etaz);
kx=0.195504*(p-etax);
ky=0.195504*(p-etay);
kz=0.195504*(p-etaz);



kpositive = kx+j*ky;
knegative = kx-j*ky;

H    = j*A6tilt.*kz.*kpositive;
Hstar= -j*A6tilt.*kz.*knegative;

K     = A5tilt.*(kx.^2-ky.^2+2*j*kx.*ky);
Kstar = A5tilt.*(kx.^2-ky.^2-2*j*kx.*ky);

Lambda = -Delta1+A1tilt.*kz.^2+A2tilt.*(kx.^2+ky.^2);
Theta = A3tilt.*kz.^2+A4tilt.*(kx.^2+ky.^2);
F= Delta1+Lambda+Theta;




Ho11=zeros(size(kpositive));
Ho12=zeros(size(kpositive));
Ho13=zeros(size(kpositive));
Ho14=zeros(size(kpositive));
Ho21=zeros(size(kpositive));
Ho22=zeros(size(kpositive));
Ho23=zeros(size(kpositive));
Ho24=zeros(size(kpositive));
Ho31=zeros(size(kpositive));
Ho32=zeros(size(kpositive));
Ho33=zeros(size(kpositive));
Ho34=zeros(size(kpositive));
Ho41=zeros(size(kpositive));
Ho42=zeros(size(kpositive));
Ho43=zeros(size(kpositive));
Ho44=zeros(size(kpositive));
tic;
%**************************************************************************
% for l=1:numel(kpositive)
%
%     Ho11(l)= Eg;
%     Ho12(l)=Pv*kpositive(l)/sqrt(2);
%     Ho13(l)=Pv*knegative(l)/sqrt(2);
%     Ho14(l)=Pp*kz(l);
%
%     %Ho21(l)=Pv*knegative(l)/sqrt(2);
%     Ho21(l)=conj(Ho12(l));
%     Ho22(l)=F(l);
%     Ho23(l)=Kstar(l);
%     Ho24(l)=-Hstar(l);
%
%     %Ho31(l)=Pv*kpositive(l)/sqrt(2);
%     Ho31(l)=conj(Ho13(l));
%     %Ho32(l)=K(l);
%     Ho32(l)=conj(Ho23(l));
%     Ho33(l)=F(l);
%     Ho34(l)=H(l);
%
% %     Ho41(l)=Pp*kz(l);
% %     Ho42(l)=-H(l);
% %     Ho43(l)=Hstar(l);
% %     Ho44(l)=Lambda(l);
%
%     Ho41(l)=conj(Ho14(l));
%     Ho42(l)=conj(Ho24(l));
%     Ho43(l)=conj(Ho34(l));
%     Ho44(l)=Lambda(l);
%
% end
%**************************************************************************



for r=1:size(etax,1)
    for s=1:size(etax,2)
        for t=1:size(etax,3)
            %Htest{r,s,t}=[r,s,t];
            
            %rst=[r,s,t];
            Ho11(r,s,t)= Eg;
            Ho12(r,s,t)=Pv*kpositive(r,s,t)/sqrt(2);
            Ho13(r,s,t)=Pv*knegative(r,s,t)/sqrt(2);
            Ho14(r,s,t)=Pp*kz(r,s,t);

            %Ho21(l)=Pv*knegative(l)/sqrt(2);
            Ho21(r,s,t)=conj(Ho12(r,s,t));
            Ho22(r,s,t)=F(r,s,t);
            Ho23(r,s,t)=Kstar(r,s,t);
            Ho24(r,s,t)=-Hstar(r,s,t);

            %Ho31(l)=Pv*kpositive(l)/sqrt(2);
            Ho31(r,s,t)=conj(Ho13(r,s,t));
            %Ho32(l)=K(l);
            Ho32(r,s,t)=conj(Ho23(r,s,t));
            Ho33(r,s,t)=F(r,s,t);
            Ho34(r,s,t)=H(r,s,t);

            %     Ho41(l)=Pp*kz(l);
            %     Ho42(l)=-H(l);
            %     Ho43(l)=Hstar(l);
            %     Ho44(l)=Lambda(l);

            Ho41(r,s,t)=conj(Ho14(r,s,t));
            Ho42(r,s,t)=conj(Ho24(r,s,t));
            Ho43(r,s,t)=conj(Ho34(r,s,t));
            Ho44(r,s,t)=Lambda(r,s,t);
        end
    end
end








%Htest=reshape(Htest,[1,numel(Htest)]);



Ho11=reshape(Ho11,[1 numel(Ho11)]);Ho12=reshape(Ho12,[1 numel(Ho12)]);Ho13=reshape(Ho13,[1 numel(Ho13)]);Ho14=reshape(Ho14,[1 numel(Ho14)]);

Ho21=reshape(Ho21,[1 numel(Ho21)]);Ho22=reshape(Ho22,[1 numel(Ho22)]);Ho23=reshape(Ho23,[1 numel(Ho23)]);Ho24=reshape(Ho24,[1 numel(Ho24)]);

Ho31=reshape(Ho31,[1 numel(Ho31)]);Ho32=reshape(Ho32,[1 numel(Ho32)]);Ho33=reshape(Ho33,[1 numel(Ho33)]);Ho34=reshape(Ho34,[1 numel(Ho34)]);

Ho41=reshape(Ho41,[1 numel(Ho41)]);Ho42=reshape(Ho42,[1 numel(Ho42)]);Ho43=reshape(Ho43,[1 numel(Ho43)]);Ho44=reshape(Ho44,[1 numel(Ho44)]);



save Ho.mat Ho11 Ho12 Ho13 Ho14 Ho21 Ho22 Ho23 Ho24 Ho31 Ho32 Ho33 Ho34 Ho41 Ho42 Ho43 Ho44;
disp('Hmatrix.mat End');