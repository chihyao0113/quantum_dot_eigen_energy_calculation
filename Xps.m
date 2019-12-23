function out=Xps(eta1,eta2,eta3,N,R,hseg)
alpha = pi/N;
x0=R*cos(alpha);
y0=R*sin(alpha);



out=(1./(eta2.*eta3)).*(Gamae(x0,-eta1-(y0/x0)*eta2)-Gamae(x0,-eta1+(y0/x0)*eta2)+exp(-j*hseg*eta3).*Gamae(x0,-eta1+(y0/x0)*eta2+(hseg/x0)*eta3)-exp(-j*hseg*eta3).*Gamae(x0,-eta1-(y0/x0)*eta2+(hseg/x0)*eta3));
