function out=Xcone(etax,etay,etaz,R,h)
etap = sqrt(etax.^2+etay.^2);
out = (2*pi*sqrt(-1)/etaz).*(exp(-sqrt(-1)*h*etaz).*I2(etap*R,etaz*h)-(R/etap).*besselj(1,R*etap)          );


