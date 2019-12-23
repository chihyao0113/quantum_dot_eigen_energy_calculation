function [e11,e12,e13,e21,e22,e23,e31,e32,e33]= es(etax,etay,etaz,N,Rt,Rb,h)

load XQD.mat;

aM=3.112;
cM=4.982;


aQD=3.189;
cQD=5.185;

ea=(aM-aQD)/aQD;
ec=(cM-cQD)/cQD;

C11=396;
C12=137;
C13=108;
C33=373;
C44=116;


R=(C11+C12+C13)*ea+C13*(ec-ea);
S=(C33+C13-C12-C11)*ea+(C33-C13)*(ec-ea);

P=(C33-2*C44-C13)*etaz.^2+C44*(etax.^2+etay.^2+etaz.^2);
I=(C13+C44)*etaz.^2;
Q=(C33-2*C13-4*C44+C11)*(etaz.^2)+(C13+2*C44-C11)*(etax.^2+etay.^2+etaz.^2);
F=(C13+2*C44-C11)*etaz.^2+C11*(etax.^2+etay.^2+etaz.^2);

% e11=XQD(etax,etay,etaz,N,Rt,Rb,h).*(ea+((R*P-I*S)./(I.*Q-F.*P)).*etax.^2);
% 
% e12=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etay);
% 
% e13=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etax.*etaz);
% 
% e21=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etay);
% 
% e22=XQD(etax,etay,etaz,N,Rt,Rb,h).*(ea+((R*P-I*S)./(I.*Q-F.*P)).*etay.^2);
% 
% e23=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etay.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etay.*etaz);
% 
% e31=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etax.*etaz);
% 
% e32=XQD(etax,etay,etaz,N,Rt,Rb,h).*(((R*P-I*S)./(I.*Q-F.*P)).*etay.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etay.*etaz);
% 
% e33=XQD(etax,etay,etaz,N,Rt,Rb,h).*(ec+((R*P-I*S)./(I.*Q-F.*P)).*etaz.^2+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etaz.^2);

e11=Xtotal.*(ea+((R*P-I*S)./(I.*Q-F.*P)).*etax.^2);

e12=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etay);

e13=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etax.*etaz);

e21=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etay);

e22=Xtotal.*(ea+((R*P-I*S)./(I.*Q-F.*P)).*etay.^2);

e23=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etay.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etay.*etaz);

e31=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etax.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etax.*etaz);

e32=Xtotal.*(((R*P-I*S)./(I.*Q-F.*P)).*etay.*etaz+((S*F-R*Q)./(2*(I.*Q-F.*P))).*etay.*etaz);

e33=Xtotal.*(ec+((R*P-I*S)./(I.*Q-F.*P)).*etaz.^2+((S*F-R*Q)./(I.*Q-F.*P)).*etaz.^2);