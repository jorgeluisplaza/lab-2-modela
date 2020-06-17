
% Parte 2: 
% Graficar  la  respuesta  al  escalón  del  siguiente  diagrama  
% de  bloque  utilizando  las  funciones  de  la consola de MATLAB
% ademas entregue el valor tomado por la función de transferencia 
% del sistema(mostrar todos los pasos):
%
% Se definen las Funciones a continuación
%Funcion 1
num1 = [0 0 4 0];
den1 = [0 10 0 4];
%Funcion 2
num2 = [0 0 0 3];
den2 = [0 0 6 16];
%Funcion 3
num3 = [0 0 4 10];
den3 = [4 9 4 0];
%Funcion 4
num4 = [0 0 0 1];
den4 = [0 0 7 10];
%Funcion 5
num5 = [0 0 8 8];
den5 = [1 2 3 0];
%Funcion 6
num6 = [0 0 3 2];
den6 = [0 5 7 10];

%---------------------------------------------------------------------
%Funcion 1 con Funcion 2
[numI,denI] = parallel(num1,den1,num2,den2);

%---------------------------------------------------------------------
%Funcion 3 con Sumador 1
[numA,denA] = feedback(num3,den3,1,1,+1);

%Funcion 3 con Funcion 4
[numB,denB] = series(numA,denA,num4,den4);

%Funcion 3 con Funcion 5
[numC,denC] = series(numA,denA,num5,den5);

%Funcion 4 y Funcion 5 en Paralelo, incluye el Sumador 2 
[numD,denD] = parallel(numB,denB,numC,denC);

%Sumador 2 con Funcion 6
[numII,denII] = series(numD,denD,num6,den6);

%######################################################################
%######################################################################

%Funciones 1,2 y 6 en Paralelo, incluye el Sumador 3
[numFinal,denFinal] = parallel(numI,denI,numII,denII)

% Grafico que representa la respuesta al escalon de la funcion generada anteriormente
sys = tf(numFinal, denFinal);
figure(1);
step(sys);
title('Respuesta al escalon');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
xlabel('Segundos');
ylabel('Amplitud');
grid;
