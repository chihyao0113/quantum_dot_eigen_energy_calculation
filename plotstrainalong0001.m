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
                               
                         
                         strain1(i)=real(sum(sum(sum(e11.*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
                         strain2(i)=real(sum(sum(sum(e33.*exp(sqrt(-1)*(etax*x1(i)+etay*y(i)+etaz*z(i)))))));
                         strain3(i)=real(sum(sum(sum(e11.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));
                         strain4(i)=real(sum(sum(sum(e22.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));
                         strain5(i)=real(sum(sum(sum(e33.*exp(sqrt(-1)*(etax*x2(i)+etay*y(i)+etaz*z(i)))))));          
end
% strain1=(8*pi^3/Volume)*strain1;
% strain2=(8*pi^3/Volume)*strain2;
% strain3=(8*pi^3/Volume)*strain3;
% strain4=(8*pi^3/Volume)*strain4;
% strain5=(8*pi^3/Volume)*strain5;

plot(z,strain1,z,strain2,z,strain3,z,strain4,z,strain5);
legend('exx,x=0','ezz,x=0','exx x=dx/2','eyy x=dx/2','ezz x=dx/2');
xlabel('z(nm)');
ylabel('strain tensor ');
axis square;
text(0,2.5,'[0001]');
print('-dbmp','strain tensor along [0 0 0 1]');
toc;
disp('plotstrainalong0001 is finished');
