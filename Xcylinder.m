function out = Xcylinder(etax,etay,etaz,D,h)

etap = sqrt(etax.^2+etay.^2);
Z    = D*etap/2;
out = (2*pi*D)/(etap.*etaz).*sin(etaz*h/2).*besselj(1,Z);
