load QDsize.mat;
load CubicSize.mat;
theta=(2*pi)/N;
for i=1:N
    x1(i)=Rb*cos(i*theta+pi/N);
    y1(i)=Rb*sin(i*theta+pi/N);
    z1=zeros(size(x1));
    
    x2(i)=Rt*cos(i*theta+pi/N);
    y2(i)=Rt*sin(i*theta+pi/N);
    z2=h*ones(size(x2));
end

x3=[x2(2:end) x2(1)];
y3=[y2(2:end) y2(1)];
z3=[z2(2:end) z2(1)];

x4=[x1(2:end) x1(1)];
y4=[y1(2:end) y1(1)];
z4=[z1(2:end) z1(1)];
X = [x1;x2;x3;x4];
Y = [y1;y2;y3;y4];
Z = [z1;z2;z3;z4];

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
%fill3(X,Y,Z,[0.5 0.5 0.5]);hold on;
mesh(X,Y,Z);hold on;
%fill3(CX,CY,CZ,[0.5 0.5 0.5]);
mesh(CX,CY,CZ,[0.5 0.5 0.5]);
alpha 0.25
%hidden off;
axis([-dx/2 dx/2 -dy/2 dy/2 -dz/2 dz/2]);