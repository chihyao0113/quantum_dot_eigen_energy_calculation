clear all;

load EigenVector.mat;
load n.mat;
load CubicSize.mat;
nx=nx/2; ny=ny/2; nz=nz/2;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,y,z]=meshgrid(-dx/2:0.5:dx/2,-dy/2:0.5:dy/2,-dz/2:0.5:dz/2);
load index.mat;

col_index=Hidx(6);
% 
% phi_eta1=Ve(1:size(Ve,1)/4,col_index);
% phi_eta2=Ve(size(Ve,1)/4+1:size(Ve,1)/2,col_index);
% phi_eta3=Ve(size(Ve,1)/2+1:3*size(Ve,1)/4,col_index);
% phi_eta4=Ve(3*size(Ve,1)/4+1:size(Ve,1),col_index);
phi_eta1=Vh(1:size(Vh,1)/4,col_index);
phi_eta2=Vh(size(Vh,1)/4+1:size(Vh,1)/2,col_index);
phi_eta3=Vh(size(Vh,1)/2+1:3*size(Vh,1)/4,col_index);
phi_eta4=Vh(3*size(Vh,1)/4+1:size(Vh,1),col_index);
% 
% phi_eta1=reshape(phi_eta1,[2*ny+1 2*nx+1 2*nz+1]);
% phi_eta2=reshape(phi_eta2,[2*ny+1 2*nx+1 2*nz+1]);
% phi_eta3=reshape(phi_eta3,[2*ny+1 2*nx+1 2*nz+1]);
% phi_eta4=reshape(phi_eta4,[2*ny+1 2*nx+1 2*nz+1]);
phi_eta=phi_eta1+phi_eta2+phi_eta3+phi_eta4;
phi_eta=reshape(phi_eta,[2*ny+1 2*nx+1 2*nz+1]);
for k=1:size(z,3)
    for j=1:size(y,2)
        for i=1:size(x,1)
            phi_r(i,j,size(z,3)+1-k)=sum(sum(sum( phi_eta.*exp(-sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));

%             phi_r1(i,j,k)=sum(sum(sum( phi_eta1.*exp(-sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));
%             phi_r2(i,j,k)=sum(sum(sum( phi_eta2.*exp(-sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));
%             phi_r3(i,j,k)=sum(sum(sum( phi_eta3.*exp(-sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));
%             phi_r4(i,j,k)=sum(sum(sum( phi_eta4.*exp(-sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k))))));
        end
    end
end
%phi_r=phi_r1+phi_r2+phi_r3+phi_r4;
%phi_r=phi_r1;
prob=phi_r.*conj(phi_r);
prob=prob/sum( sum( sum(prob)    )   );

meanprob=mean(mean(mean(prob)));
maxprob=max(max(max(prob)));



%plotRingshape;

plotQDshape;
p = patch(isosurface(x,y,z,prob,0.15*maxprob));
isonormals(x,y,z,prob,p);
set(p,'FaceColor','blue','EdgeColor','none');

camlight;
lighting gouraud
hold on;
alpha 0.25
q = patch(isosurface(x,y,z,prob,0.45*maxprob));
isonormals(x,y,z,prob,q);
set(q,'FaceColor','blue','EdgeColor','none');

camlight;
lighting gouraud
hold on;
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);
xlabel('X');ylabel('Y');zlabel('Z');
view([45 45]);