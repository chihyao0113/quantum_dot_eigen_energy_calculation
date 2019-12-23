clear all;
load n.mat;
load potential.mat;
load CubicSize.mat;
tic;

[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,y,z]=meshgrid(-dx/2:.5:dx/2,-dy/2:.5:dy/2,-dz/2:.5:dz/2);

eta=sqrt(etax.^2+etay.^2+etaz.^2);

epislon=9.6*8.85e-12;
rho=eta.^2.*psi;

for i=1:size(x,1)
    for j=1:size(y,2)
        for k=1:size(z,3)
            
%             psi_real(i,j,k)=real(sum(sum(sum(psi.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));
              rho_real(i,j,k)=real(sum(sum(sum(rho.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));

        end
    end  
end
rho_real=epislon*rho_real;

%**************************************************************************
%epislon=9.6*8.85e-12;
%rho=-del2(psi_real);
maxrho=max(max(max(rho_real)));
meanrho=mean(mean(mean(rho_real)));
minrho=min(min(min(rho_real)));

plotQDshape;
p = patch(isosurface(x,y,z,rho_real,0.7*maxrho));

isonormals(x,y,z,rho_real,p)
set(p,'FaceColor','red','EdgeColor','none');
camlight;
lighting gouraud;
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);
view([45 45]);
hold on;
q= patch(isosurface(x,y,z,rho_real,-0.7*maxrho))
isonormals(x,y,z,rho_real,q);
set(q,'FaceColor','blue','EdgeColor','none');
camlight;
lighting gouraud;
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);
view([45 45]);