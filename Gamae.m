function out = Gamae(a,eta)

if eta==0;
    out=a;
elseif a==0
    out=0;
else
    %out = (1/(sqrt(-1).*b)).*(exp(j*b.*a)-1);
    out = (exp(j*eta.*a)-1)./(sqrt(-1).*eta);
end
