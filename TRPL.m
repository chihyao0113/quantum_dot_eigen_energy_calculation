clear all;
clc;
load Recombine_rate.mat;
%tau=[6 8.2 15.2 33.6 70.8 170];
tau=reshape(tau,[1,numel(tau)]);
I  =reshape(osc_str,[1,numel(osc_str)]);
deltaE=reshape(deltaE,[1,numel(osc_str)]);
[t,Energy]=ndgrid(0:0.1:1.1*mean(tau),0.9*min(deltaE):0.005:1.1*max(deltaE));
%[t,Energy]=ndgrid(tau,deltaE);
tauconst1=2;
tauconst2=0.1;

for i=1:length(I)
    Ipeak(i,:,:)=I(i)*exp(-t/(tauconst1*tau(i)))./(1+exp(-(t-tau(i))/  (tauconst2*tau(i))  )).*exp(-(deltaE(i)-Energy).^2/(2*0.0005));;
end

PLintensity=sum(Ipeak,1);
PLintensity=reshape(PLintensity,size(Energy));
t     =t(:,1);
Energy=Energy(1,:);




for i=1:length(t)
    plot(Energy,PLintensity(i,:)+0.001*randn(size(Energy)));
    
    axis([min(Energy),max(Energy),0,0.25]);xlabel('Energy(eV)');ylabel('PL Intensity');
    text(3.2,0.2,[num2str(t(i)) ' ' 'ns']);
    %hold on;
    m(i)=getframe(gcf);    
end
%movie(m);

%movie2avi(m,'TRPL','fps',60);
%pack;