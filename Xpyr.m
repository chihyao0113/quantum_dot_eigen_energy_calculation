function out=Xpyr(etax,etay,etaz,N,R,h)

temp=zeros([size(etax)]);
for p = 0 : (N-1)
    temp = temp+Xps(cos((2*p*pi)/N)*etax+sin((2*p*pi)/N)*etay,-sin((2*p*pi)/N)*etax+cos((2*p*pi)/N)*etay,etaz,N,R,h);
end
out=temp;