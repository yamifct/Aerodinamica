clear
clc
%%GEOMETRIA
% coordenadas do centro

%NACA0012
% p=-0.12;
% q=0;
%NACA4412
p=-0.12;
q=0.08;

centro = (p+i*q);
a=sqrt((1-p)^2+q^2);
% Geometria da circunferência/círculo gerador
theta = linspace(0,2*pi,50);
zeta = centro +a*exp(i*theta);
hold on
plot(zeta);

% Aplicação da tranformação de Joukowski
z = zeta + 1./zeta;
figure(1)
plot(z);
axis ([-2.1,2.1,-2.1,2.2])
hold off

%%Obtenção do Cp
alfa=0*pi/180;
beta = atan(q/(1-p));
xi=zeta-centro;
%Definição da velocidade complexa
U_zeta =(exp(-i*alfa)-(a./xi).^2*exp(i*alfa))+ i*((4*a*pi*sin(alfa+beta))./(2*pi.*xi));
dz = 1-(1./(zeta.^2));
U_z = U_zeta.*(1./dz);
%Calcular Cp
Cp =-(1 - abs(U_z).^2);
figure(2)
plot (zeta,Cp);




 