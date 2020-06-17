

% Parte 2: 
% Graficar  la  respuesta  al  escalón  del  siguiente  diagrama  de  bloque  utilizando  las  funciones  de  la consola de MATLAB
% ademas entregue el valor tomado por la función de transferencia del sistema(mostrar todos los pasos):
% Se definen las Funciones a continuación
%
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

%Funcion 1 con Funcion 2
[num7,den7] = parallel(num1,den1,num2,den2);

%Funcion 3 sumador 1
[num8,den8] = feedback(num3,den3,1,1,+1);

%Funcion 3 con funcion 4
[num9,den9] = series(num8,den8,num4,den4);

%Funcion 3 con funcion 5
[num10,den10] = series(num8,den8,num5,den5);

%Funcion 4 y 5
[num11,den11] = parallel(num9,den9,num10,den10);

%Sumador 2 con Funcion 6
[num12,den12] = series(num11,den11,num6,den6);

%Funcion 1,2 y 6 (Sumador 3)
[num13,den13] = parallel(num7,den7,num12,den12)

% Respuesta al escalon de la funcion
sys = tf(num13, den13);
figure(1);
step(sys);
title('Respuesta al escalon');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
xlabel('Segundos');
ylabel('Amplitud');
grid;
