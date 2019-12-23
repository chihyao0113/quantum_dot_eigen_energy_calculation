clear all;
clc;
load EigenVector.mat;
load n.mat;
load CubicSize.mat;
nx=nx/2; ny=ny/2; nz=nz/2;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,y,z]=meshgrid(-dx/2:0.5:dx/2,-dy/2:0.5:dy/2,-dz/2:0.5:dz/2);

phi_eta=Cmn(21,1:size(Cmn,1)/4);
phi_eta=reshape(phi_eta,[3 3 3]);

for i=1:size(x,1)
    for j=1:size(y,2)
        for k=1:size(z,3)
            
            
            phi_r(i,j,k)=sum(sum(sum( phi_eta.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));
            
       
        end
    end  
end



prob=phi_r.*conj(phi_r);
prob=prob/sum( sum( sum(prob)    )   );
meanprob=mean(mean(mean(prob)));
maxprob=max(max(max(prob)));

plotQDshape;

p = patch(isosurface(x,y,z,prob,meanprob));
isonormals(x,y,z,prob,p)
set(p,'FaceColor','green','EdgeColor','none');
camlight;
lighting gouraud
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);