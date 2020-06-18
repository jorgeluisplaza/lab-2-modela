%%%% PRIMERA PARTE %%%%

%%% Primera funcion %%%

% Lazo abierto 
figure, step(18, [6 2]);
title('Respuesta');
ylabel('Amplitud');
xlabel('Tiempo');

% Lazo cerrado
[num, den] = cloop([0 18], [6 2]);
figure, step(num, den);
title('Respuesta');
ylabel('Amplitud');
xlabel('Tiempo');

%%% Segunda funcion %%%

% Lazo abierto
figure, step([5 6], [1 6 3]);
title('Respuesta');
ylabel('Amplitud');
xlabel('Tiempo');

% Lazo cerrado
[num, den] = cloop([0 5 6], [1 6 3]);
figure, step(num, den);
title('Respuesta');
ylabel('Amplitud');
xlabel('Tiempo');

