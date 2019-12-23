clear all;
disp('VBEdge.m Start');

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

delLambda = -Uv*XQDm+ D1QD*e33+D2QD*(e11+e22)- psi +delD1*exim33+ delD2*(exim11+exim22);

delTheta = D3QD*e33+ D4QD*(e11+e22) + delD3*exim33+ delD4*(exim11+exim22);

delF =  delDelta1*XQDm+ delLambda+ delTheta;









load eta.mat;
load es.mat;
load CubicSize.mat;
z = linspace(-dz/2,dz/2,301);
x1=zeros(size(z));
x2=(dx/2)*ones(size(z));
y = zeros(size(z));

%**************************************************************************
tic;
for i=1:length(z)


    VB1(i)=real(sum(sum(sum(delF.*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
    VB2(i)=real(sum(sum(sum(delF.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));
    VB3(i)=real(sum(sum(sum((delLambda+psi).*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
end

plot(z,VB1,z,VB2,':',z,VB3,'--');

legend('x=0','x=dx/2','x=0,without piezoelectric effect');
xlabel('z(nm)');
ylabel('VB edge(eV)');
axis([-7 7 -2 1.25]);
text(-6,1,'(0001)');
print('-dbmp','Valence Band Edge');
toc;
disp('plotstrainalong0001 is finished');
