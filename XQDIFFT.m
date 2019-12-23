clear all;
load n.mat;
load CubicSize.mat;
load XQD.mat;
tic;
[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));
[x,y,z]=meshgrid(-dx/2:1:dx/2,-dy/2:1:dy/2,-dz/2:1:dz/2);

XQDreal=zeros(size(x));

for i=1:size(x,1)
    for j=1:size(y,2)
        for k=1:size(z,3)
            
            XQDreal(i,j,k)=real(sum(sum(sum( Xtotal.*exp(sqrt(-1)*(etax*x(i,j,k)+etay*y(i,j,k)+etaz*z(i,j,k)))))));
           
       
        end
    end  
end
save XQDreal.mat XQDreal;



plotQDshape;
%plotRingShape;

p = patch(isosurface(x,y,z,XQDreal,0.3));
isonormals(x,y,z,XQDreal,p);
set(p,'FaceColor','yellow','EdgeColor','none');
camlight;
lighting gouraud
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);

view([45 45]);
