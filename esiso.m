function [e11,e12,e13,e21,e22,e23,e31,e32,e33]= esiso(etax,etay,etaz,N,Rt,Rb,h)

load XQD.mat;
eta=sqrt(etax.^2+etay.^2+etaz.^2);

aM=3.112;
aQD=3.189;

eo=(aM-aQD)/aQD;

C12=137;
C44=116;



e11=eo*Xtotal.*(1-((3*C12+C44)*etax.^2)./((C12+2*C44)*eta.^2));

e22=eo*Xtotal.*(1-((3*C12+C44)*etay.^2)./((C12+2*C44)*eta.^2));

e33=eo*Xtotal.*(1-((3*C12+C44)*etaz.^2)./((C12+2*C44)*eta.^2));

e12=eo*Xtotal.*(-((3*C12+C44)*etax.*etay)./((C12+2*C44)*eta.^2));

e21=e12;

e13=eo*Xtotal.*(-((3*C12+C44)*etax.*etaz)./((C12+2*C44)*eta.^2));

e31=e13;

e23=eo*Xtotal.*(-((3*C12+C44)*etay.*etaz)./((C12+2*C44)*eta.^2));

e32=e23;

