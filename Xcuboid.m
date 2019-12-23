function out = Xcuboid(etax,etay,etaz,a,b,c)

out = 4*j*(exp(-j*c*etaz)-1).*sin(etax*a/2).*sin(etay*b/2)./(etax.*etay.*etaz);