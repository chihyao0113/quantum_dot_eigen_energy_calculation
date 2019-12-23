clear all;
disp('reshapeV.m Start');

load es.mat;
load potential.mat;
load n.mat;
load CubicSize.mat;
load BandParameter.mat;
load delDeltax.mat;
load acx.mat;
load DxQD.mat;
load delAx.mat;
load delDx.mat;
load eximxx.mat;

nx=nx/2;ny=ny/2;nz=nz/2;

[etax,etay,etaz]=meshgrid((-nx:nx)*((2*pi)/dx),(-ny:ny)*((2*pi)/dy),(-nz:nz)*((2*pi)/dz));

px=0;py=0;pz=0;

kx=px-etax;ky=py-etay;kz=pz-etaz;
kxp=px-etax;kyp=py-etay;kzp=pz-etaz;

kx=0.1955045*kx;ky=0.1955045*ky;kz=0.1955045*kz;
kxp=0.1955045*kxp;kyp=0.1955045*kyp;kzp=0.1955045*kzp;



% 
dimension=[2*ny+1,2*nx+1,2*nz+1,2*ny+1,2*nx+1,2*nz+1];
delEC=zeros(dimension);
delLambda=zeros(dimension);
delTheta=zeros(dimension);
delF=zeros(dimension);
delK=zeros(dimension);
delKstar=zeros(dimension);
delH=zeros(dimension);
delHstar=zeros(dimension);
% a=zeros(dimension);
% b=zeros(dimension);
% c=zeros(dimension);

for r=1:(2*ny+1)
    for s=1:(2*nx+1)
        for t= 1:(2*nz+1)
            for w= 1:(2*nz+1)
                for v= 1:(2*nx+1)
                    for u = 1:(2*ny+1)
                        
                        ru=r-u+2*ny+1;
                        sv=s-v+2*nx+1;
                        tw=t-w+2*nz+1;
%                         a(r,s,t,u,v,w)=Uc*XQDm(ru,sv,tw);
%                         b(r,s,t,u,v,w)=acQD*(e11(ru,sv,tw)+e22(ru,sv,tw)+e33(ru,sv,tw));
%                         c(r,s,t,u,v,w)=psi(ru,sv,tw);
                        %rstuvw=[r,s,t,u,v,w];
                       % delEC(r,s,t,u,v,w) = Uc*XQDm(ru,sv,tw)+acQD*(e11(ru,sv,tw)+e22(ru,sv,tw)+e33(ru,sv,tw))- psi(ru,sv,tw) + delac*(exim11(ru,sv,tw) + exim22(ru,sv,tw) + exim33(ru,sv,tw));
                         delEC(r,s,t,u,v,w) = Uc*XQDm(ru,sv,tw)+acQD*(e11(ru,sv,tw)+e22(ru,sv,tw)+e33(ru,sv,tw))- psi(ru,sv,tw) + delac*(exim11(ru,sv,tw) + exim22(ru,sv,tw) + exim33(ru,sv,tw));

                        delLambda(r,s,t,u,v,w) =  -Uv*XQDm(ru,sv,tw) + D1QD*e33(ru,sv,tw)+D2QD*(e11(ru,sv,tw)+e22(ru,sv,tw))- psi(ru,sv,tw) +delD1*exim33(ru,sv,tw) + delD2*(exim11(ru,sv,tw)+exim22(ru,sv,tw)) + (delA1*kzp(u,v,w)*kz(r,s,t)+delA2*(kxp(u,v,w)*kx(r,s,t)+kyp(u,v,w)*ky(r,s,t)))*XQDm(ru,sv,tw);

                        delTheta(r,s,t,u,v,w)  =   D3QD*e33(ru,sv,tw)+ D4QD*(e11(ru,sv,tw)+e22(ru,sv,tw)) + delD3*exim33(ru,sv,tw)+ delD4*(exim11(ru,sv,tw)+exim22(ru,sv,tw)) + (delA3*kzp(u,v,w)*kz(r,s,t)+delA4*(kxp(u,v,w)*kx(r,s,t)+kyp(u,v,w)*ky(r,s,t))).*XQDm(ru,sv,tw);

                        delF(r,s,t,u,v,w)      =  delDelta1*XQDm(ru,sv,tw) + delLambda(r,s,t,u,v,w) + delTheta(r,s,t,u,v,w);

                        delK(r,s,t,u,v,w)         =   D5QD*(e11(ru,sv,tw)+2*j*e12(ru,sv,tw)-e22(ru,sv,tw))+delD5*(exim11(ru,sv,tw)+2*j*exim12(ru,sv,tw)-exim22(ru,sv,tw))+delA5*(kxp(u,v,w)+j*kyp(u,v,w))*(kx(r,s,t)+j*ky(r,s,t))*XQDm(ru,sv,tw);
                        
                        delKstar(r,s,t,u,v,w)     =   D5QD*(e11(ru,sv,tw)-2*j*e12(ru,sv,tw)-e22(ru,sv,tw))+delD5*(exim11(ru,sv,tw)-2*j*exim12(ru,sv,tw)-exim22(ru,sv,tw))+delA5*(kxp(u,v,w)-j*kyp(u,v,w))*(kx(r,s,t)-j*ky(r,s,t))*XQDm(ru,sv,tw);

                        delH(r,s,t,u,v,w)    =       D5QD*(e13(ru,sv,tw)+j*e23(ru,sv,tw))+delD6*(exim13(ru,sv,tw)+j*exim23(ru,sv,tw))+(delA6/2)*( kzp(u,v,w)*(kx(r,s,t)+j*ky(r,s,t))*pz*(kxp(u,v,w)+j*kyp(u,v,w)) )*XQDm(ru,sv,tw);
                        
                        delHstar(r,s,t,u,v,w)    =   D5QD*(e13(ru,sv,tw)-j*e23(ru,sv,tw))+delD6*(exim13(ru,sv,tw)-j*exim23(ru,sv,tw))+(delA6/2)*( kzp(u,v,w)*(kx(r,s,t)-j*ky(r,s,t))*pz*(kxp(u,v,w)-j*kyp(u,v,w)) )*XQDm(ru,sv,tw);


%                         delEC(t,s,r,w,v,u) = Uc*XQDm(ru,sv,tw)+acQD*(e11(ru,sv,tw)+e22(ru,sv,tw)+e33(ru,sv,tw))- psi(ru,sv,tw) + delac*(exim11(ru,sv,tw) + exim22(ru,sv,tw) + exim33(ru,sv,tw));
% 
%                         delLambda(t,s,r,w,v,u) =  -Uv*XQDm(ru,sv,tw) + D1QD*e33(ru,sv,tw)+D2QD*(e11(ru,sv,tw)+e22(ru,sv,tw))- psi(ru,sv,tw) +delD1*exim33(ru,sv,tw) + delD2*(exim11(ru,sv,tw)+exim22(ru,sv,tw)) + (delA1*kzp(u,v,w)*kz(r,s,t)+delA2*(kxp(u,v,w)*kx(r,s,t)+kyp(u,v,w)*ky(r,s,t)))*XQDm(ru,sv,tw);
% 
%                         delTheta(t,s,r,w,v,u)  =   D3QD*e33(ru,sv,tw)+ D4QD*(e11(ru,sv,tw)+e22(ru,sv,tw)) + delD3*exim33(ru,sv,tw)+ delD4*(exim11(ru,sv,tw)+exim22(ru,sv,tw)) + (delA3*kzp(u,v,w)*kz(r,s,t)+delA4*(kxp(u,v,w)*kx(r,s,t)+kyp(u,v,w)*ky(r,s,t))).*XQDm(ru,sv,tw);
% 
%                         delF(t,s,r,w,v,u)      =  delDelta1*XQDm(ru,sv,tw) + delLambda(r,s,t,u,v,w) + delTheta(r,s,t,u,v,w);
% 
%                         delK(t,s,r,w,v,u)         =   D5QD*(e11(ru,sv,tw)+2*j*e12(ru,sv,tw)-e22(ru,sv,tw))+delD5*(exim11(ru,sv,tw)+2*j*exim12(ru,sv,tw)-exim22(ru,sv,tw))+delA5*(kxp(u,v,w)+j*kyp(u,v,w))*(kx(r,s,t)+j*ky(r,s,t))*XQDm(ru,sv,tw);
%                         
%                         delKstar(t,s,r,w,v,u)     =   D5QD*(e11(ru,sv,tw)-2*j*e12(ru,sv,tw)-e22(ru,sv,tw))+delD5*(exim11(ru,sv,tw)-2*j*exim12(ru,sv,tw)-exim22(ru,sv,tw))+delA5*(kxp(u,v,w)-j*kyp(u,v,w))*(kx(r,s,t)-j*ky(r,s,t))*XQDm(ru,sv,tw);
% 
%                         delH(t,s,r,w,v,u)    =       D5QD*(e13(ru,sv,tw)+j*e23(ru,sv,tw))+delD6*(exim13(ru,sv,tw)+j*exim23(ru,sv,tw))+(delA6/2)*( kzp(u,v,w)*(kx(r,s,t)+j*ky(r,s,t))*pz*(kxp(u,v,w)+j*kyp(u,v,w)) )*XQDm(ru,sv,tw);
%                         
%                         delHstar(t,s,r,w,v,u)    =   D5QD*(e13(ru,sv,tw)-j*e23(ru,sv,tw))+delD6*(exim13(ru,sv,tw)-j*exim23(ru,sv,tw))+(delA6/2)*( kzp(u,v,w)*(kx(r,s,t)-j*ky(r,s,t))*pz*(kxp(u,v,w)-j*kyp(u,v,w)) )*XQDm(ru,sv,tw);

                      %delEC{r,s,t,u,v,w} = [r,s,t,u,v,w];


                    end
                end
            end
        end
    end
end


% a=reshape(a,[sqrt(numel(a)),sqrt(numel(a))]);
% 
% b=reshape(b,[sqrt(numel(b)),sqrt(numel(b))]);
% 
% c=reshape(c,[sqrt(numel(c)),sqrt(numel(c))]);




delEC=reshape(delEC,[sqrt(numel(delEC)),sqrt(numel(delEC))]);


delLambda=reshape(delLambda,[sqrt(numel(delLambda)),sqrt(numel(delLambda))]);

delTheta=reshape(delTheta,[sqrt(numel(delTheta)),sqrt(numel(delTheta))]);

delF=reshape(delF,[sqrt(numel(delF)),sqrt(numel(delF))]);

delK=reshape(delK,[sqrt(numel(delK)),sqrt(numel(delK))]);

delH=reshape(delH,[sqrt(numel(delH)),sqrt(numel(delH))]);

delKstar=reshape(delKstar,[sqrt(numel(delKstar)),sqrt(numel(delKstar))]);

delHstar=reshape(delHstar,[sqrt(numel(delHstar)),sqrt(numel(delHstar))]);



clear kx kxp ky kyp kz kzp etaz etax etay psi_strain psi_spont psi exim33 e21 e22 e23 e13 XQDm e11 e31 exim13 exim22 exim23 exim12 e32 e33 exim11 e12; 

pack;

delEC=sparse(delEC);

%save delEc.mat delEC;

delLambda=sparse(delLambda);

delTheta=sparse(delTheta);

delF=sparse(delF);

delK=sparse(delK);

delH=sparse(delH);

delKstar=sparse(delKstar);

delHstar=sparse(delHstar);


V=zeros(4*size(delEC));


V=[delEC,             zeros(size(delEC)), zeros(size(delEC)), zeros(size(delEC));
   zeros(size(delEC)) delF              , delKstar          , -delHstar         ;
   zeros(size(delEC)) delK              , delF              ,  delH             ;
   zeros(size(delEC)) -delH             , delHstar          ,  delLambda        ];

V=sparse(V);
   
   
save V.mat V;
    
    
disp('reshapeV.m End');

