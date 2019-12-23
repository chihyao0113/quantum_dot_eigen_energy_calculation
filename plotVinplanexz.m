clear all;
load n.mat;
load potential.mat;
load CubicSize.mat;


[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,z]=meshgrid(-dx/2:0.5:dx/2,-dz/2:0.5:dz/2);
y =dy*(0/8)*ones(size(x));



for i=1:size(x,1)
    for j=1:size(y,2)
            
            psitot(i,j)=real(sum(sum(sum( psi.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
%             psispont(i,j)=real(sum(sum(sum( psi_spont.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
%             psistrain(i,j)=real(sum(sum(sum(psi_strain.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
            
            
    end
end
[C,h] = contourf(x,z,psitot,15);hold on;plot2DQDShape;hold off;xlabel('nm');ylabel('nm');title('Electric potential in xz-plane');colorbar;axis square;


clabel(C,h);
colormap jet;
%axis square;
print('-dbmp','electric potential in xz-plane');
