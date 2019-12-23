clear all;
disp('plotBandEdge.m Start');

load es.mat;
load potential.mat;
load n.mat;
load CubicSize.mat;
load BandParameter.mat;
load delDeltax.mat;
load acx.mat;
load DxQD.mat;
load delAx.mat;
load delDx.mat;
load eximxx.mat;



delEC= Uc*XQDm+acQD*(e11+e22+e33)- psi + delac*(exim11 + exim22 + exim33);

delLambda = -Uv*XQDm+ D1QD*e33+D2QD*(e11+e22)- psi +delD1*exim33+ delD2*(exim11+exim22);

delTheta = D3QD*e33+ D4QD*(e11+e22) + delD3*exim33+ delD4*(exim11+exim22);

delF =  delDelta1*XQDm+ delLambda+ delTheta;

load eta.mat;
load es.mat;
load CubicSize.mat;
z = linspace(-dz/2,dz/2,301);
x1=zeros(size(z));
x2=(dx/1.99)*ones(size(z));
y = zeros(size(z));

%**************************************************************************
tic;
for i=1:length(z)
    CB1(i)=real(sum(sum(sum(delEC.*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
    CB2(i)=real(sum(sum(sum(delEC.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));
    CB3(i)=real(sum(sum(sum((delEC+psi).*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
    VB1(i)=real(sum(sum(sum(delF.*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
    VB2(i)=real(sum(sum(sum(delF.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));
    VB3(i)=real(sum(sum(sum((delF+psi).*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
end
Eg=3.5;
subplot(2,1,1);plot(z,CB1+Eg,z,CB2+Eg,':',z,CB3+Eg);axis([-7 7 2 7.5]);xlabel('z(nm)');ylabel('Band edge(eV)');
subplot(2,1,2);plot(z,VB1,z,VB2,':',z,VB3,'--');axis([-7 7 -2 2]);xlabel('z(nm)');ylabel('Band edge(eV)');

%plot(z,CB1+Eg,z,CB2+Eg,':',z,CB3+Eg,'--',z,VB1,z,VB2,':',z,VB3,'--');
legend('x=0','x=dx/2','x=0,without piezoelectric effect');
print('-dbmp','Band Edge diagram along [0001]');
disp('plotBandEdge.m is finished');
