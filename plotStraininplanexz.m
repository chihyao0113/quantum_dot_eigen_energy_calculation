clear all;
load n.mat;
load es.mat;
load CubicSize.mat;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,z]=meshgrid(-dx/2:0.5:dx/2,-dz/2:0.5:dz/2);
y =dy*(0/8)*ones(size(x));



for i=1:size(x,1)
    for j=1:size(y,2)

        strain1(i,j)=real(sum(sum(sum( e11.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
        strain2(i,j)=real(sum(sum(sum( e22.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
        strain3(i,j)=real(sum(sum(sum( e33.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
        strain4(i,j)=real(sum(sum(sum( e12.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
        strain5(i,j)=real(sum(sum(sum( e13.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
        strain6(i,j)=real(sum(sum(sum( e23.*exp(sqrt(-1)*(etax*x(i,j)+etay*y(i,j)+etaz*z(i,j)))))));
      


    end
end


subplot(3,2,1); [C1,h1]= contourf(x,z,strain1,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('exx');colorbar;axis square;
subplot(3,2,2); [C2,h2]= contourf(x,z,strain2,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('eyy');colorbar;axis square;
subplot(3,2,3); [C3,h3]= contourf(x,z,strain3,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('ezz');colorbar;axis square;
subplot(3,2,4); [C4,h4]= contourf(x,z,strain4,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('exy');colorbar;axis square;
subplot(3,2,5); [C5,h5]= contourf(x,z,strain5,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('exz');colorbar;axis square;
subplot(3,2,6); [C6,h6]= contourf(x,z,strain6,20);hold on;plot2DQDShape;  hold off;xlabel('nm');ylabel('nm');title('eyz');colorbar;axis square;
set([h1 h2 h3 h4 h5 h6],'Edgecolor','none');

% subplot(3,2,1); [C1,h1]= contourf(x,z,strain1,20);xlabel('nm');ylabel('nm');title('exx');colorbar;axis square; 
% subplot(3,2,2); [C2,h2]= contourf(x,z,strain2,20);xlabel('nm');ylabel('nm');title('eyy');colorbar;axis square;
% subplot(3,2,3); [C3,h3]= contourf(x,z,strain3,20);xlabel('nm');ylabel('nm');title('ezz');colorbar;axis square;
% subplot(3,2,4); [C4,h4]= contourf(x,z,strain4,20);xlabel('nm');ylabel('nm');title('exy');colorbar;axis square;
% subplot(3,2,5); [C5,h5]= contourf(x,z,strain5,20);xlabel('nm');ylabel('nm');title('exz');colorbar;axis square;
% subplot(3,2,6); [C6,h6]= contourf(x,z,strain6,20);xlabel('nm');ylabel('nm');title('eyz');colorbar;axis square;
% set([h1 h2 h3 h4 h5 h6],'Edgecolor','none');
colormap jet;
print('-dbmp','Strain tensors in xz-plane');
