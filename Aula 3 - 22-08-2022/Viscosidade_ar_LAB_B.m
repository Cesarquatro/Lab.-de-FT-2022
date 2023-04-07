%% Este código le arquivos e ajusta um curve fit
clear; close all; clc

%% Leitura dos arquivos excel
% dados = xlsread('Viscosidade_ar_turmaB.xls', 'Página1');
% 
% TempC =  dados(:, 1);   %temp em Celcius
% Rho = dados(:, 2);      %densidade kg/m^3
% mu = dados(:, 3);       %viscosidade absoluta
% nu = dados(:, 4);       %viscosidad cinematica 

%% Carregar o arquivo .mat
load('matrix_numerica.mat')

%% Leitura dos arquivos .mat

TempC =  ViscosidadearturmaB1(:, 1);   %temp em Celcius
Rho = ViscosidadearturmaB1(:, 2);      %densidade kg/m^3
mu = ViscosidadearturmaB1(:, 3);       %viscosidade absoluta
nu = ViscosidadearturmaB1(:, 4);       %viscosidad cinematica 

%%Usando a saida do CFTOOL
load Poly3_Rho.mat

tempInteresse = 0:3:100;
RhoInteresse = ajuste_poly3_rho(tempInteresse);

%% Ajuste por polinomio
polyajuste = polyfit(TempC, Rho, 3);

ypoly = polyval(polyajuste, tempInteresse);

%% plot
plot(TempC, Rho, '.k', 'MarkerSize',20)
hold on
plot(tempInteresse, RhoInteresse, '--r', 'LineWidth',2)
plot(tempInteresse, ypoly, 'ob', 'MarkerSize',8)

legend("Experimental", "CFTOOL", "Poly Fit")
xlabel("Temperadura em Celcius")
ylabel("densidade kg/m^3")
title("Densidade em funcao da temperatura")