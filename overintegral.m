clear all;
load EigenEnergy.mat;
load EigenVector.mat;
load n.mat;
load CubicSize.mat;
nx=nx/2; ny=ny/2; nz=nz/2;
load index.mat;
Ep=14.0;

for i=1:5
    for j=1:5
        deltaE(i,j)=Ee(i)-Eh(j);
        osc_str(i,j)=(Ep/deltaE(i,j))*abs(sum(Ve(:,i).*conj(Vh(:,j))))^2*Volume;
    end
end


refractive_index=3.04   %GaN Refractive index.
tau=(23.203e-9)./(refractive_index*deltaE.^2.*osc_str);%23.03 was from JVST B 22 2190 eq13 the const  2*pi....


save Recombine_rate.mat osc_str deltaE tau;