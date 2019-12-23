function out = XQD(etax,etay,etaz,N,Rt,Rb,h)

hs=(Rt*h)/(Rb-Rt);

hl=(Rb*h)/(Rb-Rt);

out = Xpyr(etax,etay,etaz,N,Rb,hl)-exp(-j*h*etaz).*Xpyr(etax,etay,etaz,N,Rt,hs);
