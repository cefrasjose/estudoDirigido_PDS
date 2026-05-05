clc; clear; close all;

% 1) Execução do código base
x = [1 2 1];
h = [1 1];
y = conv(x,h);

disp('Sequencia x[n]:'); disp(x);
disp('Sequencia h[n]:'); disp(h);
disp('Convolucao y[n] = x[n]*h[n]:'); disp(y);

figure;
n = 0:length(y)-1;
stem(n, y, 'filled'); grid on;
xlabel('n'); ylabel('y[n]'); title('Resultado da convolucao discreta - Original');

% 3) Modificação da entrada
x_mod = [1 1 1 1];
y_mod = conv(x_mod, h);

figure;
n_mod = 0:length(y_mod)-1;
stem(n_mod, y_mod, 'filled'); grid on;
xlabel('n'); ylabel('y[n]'); title('Resultado com entrada modificada');
disp('Convolucao com x[n] = {1, 1, 1, 1}:'); disp(y_mod);
pause;