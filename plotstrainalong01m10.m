clear all;
load eta.mat;
load es.mat;
load CubicSize.mat;
y=linspace(-dy/2,dy/2,301);
x=zeros(size(y));
z=zeros(size(y));

%**************************************************************************
tic;
for i=1:length(y)
    
%     strain11(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(e11.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
%     
%     strain22(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(e22.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
%     
%     strain23(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(e23.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
%     
%     strain33(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(e33.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
    
    strain11(i)=real(sum(sum(sum(e11.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
    
    strain22(i)=real(sum(sum(sum(e22.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
    
    strain23(i)=real(sum(sum(sum(e23.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
    
    strain33(i)=real(sum(sum(sum(e33.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
    
end
plot(y,strain11,y,strain22,'--',y,strain33,'-.',y,strain23,':');
legend('exx','eyy','ezz','eyz');
xlabel('y(nm)');
ylabel('strain tensor');
text(0,1.5,'[01-10]');
axis square;
toc;
print('-dbmp','strain tensor along [0 1 -1 0]');
disp('plotstrainalong01m10 is finished');
