load QDSize.mat;
load CubicSize.mat;
gridx = [-0.5*dx -0.5*dx -Rb -Rt Rt Rb 0.5*dx 0.5*dx];
gridz = [-w   0   0   h  h  0  0 -w];
fill(gridx,gridz,'w')
%axis([-dx/2 dx/2 -dz/2 dz/2]);
hidden off;
