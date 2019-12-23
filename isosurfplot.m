clear all;
load n.mat;
load potential.mat;
load CubicSize.mat;
tic;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,y,z]=meshgrid(-dx/2:1:dx/2,-dy/2:1:dy/2,-dz/2:1:dz/2);


for i=1:size(x,1)
    for j=1:size(y,2)
        for k=1:size(z,3)
            
         
            psispont(i,j,k)=real(sum(sum(sum( psi_spont.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));
            psistrain(i,j,k)=real(sum(sum(sum(psi_strain.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));
       
        end
    end  
end

psitotal=psispont+psistrain;
save real_psitotal.mat psitotal;
%**************************************************************************
plotQDshape;

hold on;

load real_psitotal.mat;


maxpsi=max(max(max(psitotal)));
p = patch(isosurface(x,y,z,psitotal,0.8*maxpsi));
isonormals(x,y,z,psitotal,p)
set(p,'FaceColor','red','EdgeColor','none');
camlight;
lighting gouraud
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);

hold on;

maxpsi=max(max(max(psitotal)));
p = patch(isosurface(x,y,z,psitotal,-0.8*maxpsi));
isonormals(x,y,z,psitotal,p)
set(p,'FaceColor','cyan','EdgeColor','none');
camlight;
lighting gouraud
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);
