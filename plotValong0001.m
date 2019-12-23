clear all;
load n.mat;
load potential.mat;
load CubicSize.mat;

[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
z = linspace(-dz/2,dz/2,301);
x = zeros(size(z));
y = zeros(size(z));



for i=1:length(z)
 
%             psitotal(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum( psi.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
%             psispont(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum( psi_spont.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
%             psistrain(i)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(psi_strain.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
            
            psispont(i)=real(sum(sum(sum( psi_spont.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
            psistrain(i)=real(sum(sum(sum(psi_strain.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
            psitotal(i)=real(sum(sum(sum(psi.*exp(sqrt(-1)*(etax*x(i)+etay*y(i)+etaz*z(i)))))));
            

end

E=-gradient(psitotal);
E=E*10^7;
plot(z,psispont,'--',z,psistrain,'-.',z,psitotal);

xlabel('z(nm)');
ylabel('Potential(eV)');
legend('\psi spont','\psi strain','\psi total');
axis square;



print('-dbmp','built-in electric potential along [0 0 0 1]');

filename=mfilename;
disp([filename ' is finished']);











