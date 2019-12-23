clear all;
load n.mat;
load potential.mat;
load CubicSize.mat;
tic;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));



  [x,y]=meshgrid(-dx/2:0.25:dx/2,-dy/2:0.25:dy/2);
  z =-0.75*ones(size(x));


for i=1:size(x,1)
    for j=1:size(y,2)
            %psitotal(i,j,k)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum( psi.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));
            psispont(i,j)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum( psi_spont.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
            psistrain(i,j)=real((2*pi/dx)*(2*pi/dy)*(2*pi/dz)*sum(sum(sum(psi_strain.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
    end
end

[C,h] = contourf(x,y,psispont+psistrain,10);
clabel(C,h);
colormap hot;
axis square;
print('-dbmp','countourplotinplanexy');
toc;
