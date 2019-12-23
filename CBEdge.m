clear all;
disp('CBEdge.m Start');

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
end
Eg=0;
plot(z,CB1+Eg,z,CB2+Eg,':',z,CB3+Eg,'--');
legend('x=0','x=dx/2','x=0,without piezoelectric effect');
xlabel('z(nm)');
ylabel('CB edge(eV)');
%axis([-7.5 7.5 2 7.5]);
text(0,2.5,'(0001)');
print('-dbmp','Valence Band Edge');
toc;
disp('plotstrainalong0001 is finished');
