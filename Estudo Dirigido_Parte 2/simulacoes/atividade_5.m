clc; clear; close all;

% Definição dos sinais conforme o roteiro
x = [2 5 4 6 8 7 5 4];
h = (1/3) * [1 1 1];
y = conv(x,h);

% 1. Adicionando saída de texto no terminal para validação
disp('--- Execução da Atividade 5 ---');
disp('Sinal original x[n]:');
disp(x);
disp('Sinal suavizado y[n]:');
disp(y);

% 2. Geração dos Gráficos
figure;
subplot(2,1,1);
stem(0:length(x)-1, x, 'filled'); grid on;
xlabel('n'); ylabel('x[n]'); title('Sinal original do sensor');

subplot(2,1,2);
stem(0:length(y)-1, y, 'filled'); grid on;
xlabel('n'); ylabel('y[n]'); title('Sinal suavizado (Filtro Média Simples)');

disp('>> Gráfico gerado em uma nova janela!');
disp('>> Pressione "Enter" NESTE TERMINAL para fechar o gráfico e encerrar...');
pause;