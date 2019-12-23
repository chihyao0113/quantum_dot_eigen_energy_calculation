function [e11,e12,e13,e21,e22,e23,e31,e32,e33]= esZB(etax,etay,etaz)

eta=sqrt(etax.^2+etay.^2+etaz.^2);
load XQD.mat;

[aM,C11,C12,C44] =MaterialParameters('AlN','ZB');
[aQD,C11,C12,C44]=MaterialParameters('GaN','ZB');

ea=(aM-aQD)/aQD;

Can=C11-C12-2*C44;

xx=(etax.^2)./(eta.^2);
yy=(etay.^2)./(eta.^2);
zz=(etaz.^2)./(eta.^2);
xy=(etax.*etay)./(eta.^2);
xz=(etax.*etaz)./(eta.^2);
yz=(etay.*etaz)./(eta.^2);
p=(etax.^2./(C44*eta.^2+Can*etax.^2)+etay.^2./(C44*eta.^2+Can*etay.^2)+etaz.^2./(C44*eta.^2+Can*etaz.^2));


e11=ea.*Xtotal.*(1-(C11+2*C12).*xx./((C44+Can*xx).*(1+(C12+C44).*p)));
e22=ea.*Xtotal.*(1-(C11+2*C12).*yy./((C44+Can*yy).*(1+(C12+C44).*p)));
e33=ea.*Xtotal.*(1-(C11+2*C12).*zz./((C44+Can*zz).*(1+(C12+C44).*p)));
e12=ea.*Xtotal.*( -(C11+2*C12).*xy./(2*(1+(C12+C44).*p)).*(1./(C44+Can*xx)+1./(C44+Can*yy)));
e21=e12;
e13=ea.*Xtotal.*( -(C11+2*C12).*xz./(2*(1+(C12+C44).*p)).*(1./(C44+Can*xx)+1./(C44+Can*zz)));
e31=e13; 
e23=ea.*Xtotal.*( -(C11+2*C12).*yz./(2*(1+(C12+C44).*p)).*(1./(C44+Can*yy)+1./(C44+Can*zz)));
e32=e23;