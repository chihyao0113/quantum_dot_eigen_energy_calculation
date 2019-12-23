load Ringsize.mat;
load CubicSize.mat;
load QDSize.mat;
[X1,Y1,Z1] = cylinder([r_cyl(1),r_cyl(1)]);
[X2,Y2,Z2] = cylinder([r_cyl(2),r_cyl(2)]);
mesh(X1,Y1,h_cyl*Z1); hold on;
mesh(X2,Y2,h_cyl*Z2);
grid off;

x5=[-dx/2 dx/2 dx/2 -dx/2];
y5=[-dy/2 -dy/2 dy/2 dy/2];
z5=[0 0 0 0];

x6=x5;
y6=y5;
z6=[-w -w -w -w];

x7=[x6(2:end) x6(1)];
y7=[y6(2:end) y6(1)];
z7=[-w -w -w -w];

x8=x7;
y8=y7;
z8=[0 0 0 0];


CX=[x5;x6;x7;x8];
CY=[y5;y6;y7;y8];
CZ=[z5;z6;z7;z8];
fill3(CX,CY,CZ,[1 1 1]);
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);