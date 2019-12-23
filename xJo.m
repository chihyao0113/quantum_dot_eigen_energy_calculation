function out = xJo(x,alpha,beta)

out = x.*besselj(0,alpha*x).*exp(sqrt(-1)*beta*x);
