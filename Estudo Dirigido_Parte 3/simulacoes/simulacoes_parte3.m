clc; close all;
graphics_toolkit('qt');

%% Questão 1: Senoide f0 = 0.1 e N = 128
N = 128;
n = 0:N-1;
f0 = 0.1;
x1 = sin(2*pi*f0*n);

X1 = abs(fft(x1));
freq_axis = (0:N-1)/N; % Eixo de frequência normalizada

figure('Name', 'Questão 1');
subplot(2,1,1); stem(n(1:50), x1(1:50)); title('Sinal no Tempo (Q1)');
subplot(2,1,2); stem(freq_axis, X1); title('Espectro (FFT) - Freq dominante em 0.1');

%% Questão 2: Soma de duas senoides
f1 = 0.1; f2 = 0.25;
x2 = sin(2*pi*f1*n) + sin(2*pi*f2*n);
X2 = abs(fft(x2));

figure('Name', 'Questão 2');
subplot(2,1,1); stem(n(1:50), x2(1:50)); title('Sinal no Tempo (Difícil distinção)');
subplot(2,1,2); stem(freq_axis, X2); title('Espectro - Picos em 0.1 e 0.25');

%% Questão 3: Aliasing
t = 0:0.001:1; % Tempo contínuo simulado
f_real = 50;   % Frequencia de 50 Hz
x_cont = sin(2*pi*f_real*t);

fs_boa = 150; % Acima de Nyquist
ts_boa = 0:1/fs_boa:1;
x_boa = sin(2*pi*f_real*ts_boa);

fs_ruim = 60; % Abaixo de Nyquist (Aliasing)
ts_ruim = 0:1/fs_ruim:1;
x_ruim = sin(2*pi*f_real*ts_ruim);

figure('Name', 'Questão 3: Aliasing');
plot(t, x_cont, 'k', ts_boa, x_boa, 'bo-', ts_ruim, x_ruim, 'ro-');
legend('Contínuo', 'Amostragem Correta', 'Amostragem com Aliasing');
title('O sinal vermelho aparenta ser de menor frequência (Aliasing)');

%% Questão 4: Janelamento (Vazamento Espectral)
n4 = 0:63;
x4 = sin(2*pi*0.15*n4); % Frequencia não múltipla da janela (gera vazamento)
X4_no_window = abs(fft(x4, 256)); % Zero-padding para melhor visualização

w = 0.54 - 0.46*cos(2*pi*n4/63); % Janela de Hamming matemática
x4_windowed = x4 .* w;
X4_windowed = abs(fft(x4_windowed, 256));

figure('Name', 'Questão 4: Janelamento');
subplot(2,1,1); plot(X4_no_window); title('FFT sem Janela (Vazamento espectral alto)');
subplot(2,1,2); plot(X4_windowed); title('FFT com Janela Hamming (Lobos laterais atenuados)');

%% Questão 5: Senoide com Ruído Aditivo
ruido = 2 * randn(1, N); % Ruído forte
x5 = x1 + ruido;
X5 = abs(fft(x5));

figure('Name', 'Questão 5: Sinal e Ruído');
subplot(2,1,1); plot(n, x5); title('Tempo: Impossível ver a senoide');
subplot(2,1,2); plot(freq_axis, X5); title('Frequência: Pico em 0.1 permanece visível');

%% Questão 6: DFT Direta vs FFT
N6 = 16;
n6 = 0:N6-1;
x6 = rand(1, N6);

% DFT Manual
X_dft = zeros(1, N6);
for k = 0:N6-1
    for i = 0:N6-1
        X_dft(k+1) = X_dft(k+1) + x6(i+1) * exp(-1i*2*pi*k*i/N6);
    end
end
X_fft = fft(x6);

% Validação matemática no terminal
disp('Questão 6: Diferença máxima entre DFT manual e FFT nativa:');
disp(max(abs(X_dft - X_fft))); % Deve ser um valor minúsculo (próximo de zero)

% Geração do Gráfico para comparar visualmente
figure('Name', 'Questão 6: DFT Direta vs FFT');
subplot(2,1,1); 
stem(n6, abs(X_dft), 'b', 'filled'); 
title('Espectro calculado via DFT Manual (Equação)');
xlabel('Índice de Frequência (k)'); ylabel('Magnitude');
grid on;

subplot(2,1,2); 
stem(n6, abs(X_fft), 'r', 'filled'); 
title('Espectro calculado via algoritmo nativo FFT');
xlabel('Índice de Frequência (k)'); ylabel('Magnitude');
grid on;

%% Questão 7: Transformada Z e Estabilidade (H(z) = 1 / (1 - 0.8z^-1))
% Resposta ao impulso equivale a aplicar um impulso na equação de diferenças
n7 = 0:30;
impulso = n7 == 0;
h7 = filter(1, [1 -0.8], impulso);

figure('Name', 'Questão 7: Estabilidade');
stem(n7, h7); title('Resposta ao Impulso h[n]: O sistema é ESTÁVEL (decai para zero)');

%% Questão 8: Resolução Espectral (Número de Amostras)
f0_8 = 0.12;
n_curto = 0:31; x_curto = sin(2*pi*f0_8*n_curto);
n_longo = 0:255; x_longo = sin(2*pi*f0_8*n_longo);

figure('Name', 'Questão 8: Resolução');
subplot(2,1,1); stem(abs(fft(x_curto))); title('N=32 (Picos largos, baixa resolução)');
subplot(2,1,2); stem(abs(fft(x_longo))); title('N=256 (Pico fino, alta resolução espectral)');

%% Questão 9: Frequência Principal e Harmônica (Vibração Mecânica)
x9 = sin(2*pi*0.1*n) + 0.4*sin(2*pi*0.2*n) + 0.1*sin(2*pi*0.3*n);
X9 = abs(fft(x9));

figure('Name', 'Questão 9: Harmônicas');
stem(freq_axis(1:N/2), X9(1:N/2)); title('Diagnóstico: Fundamental em 0.1, Harmônicas em 0.2 e 0.3');

%% Questão 10: Aplicação em Sinal Real Simulado
% Simulando a vibração de um motor com uma falha no rolamento
t_motor = 0:0.005:2;
motor_normal = 1.5 * sin(2*pi*30*t_motor); % Rotação base 30Hz
falha_rolamento = 0.8 * sin(2*pi*120*t_motor); % Impactos periódicos
ruido_chao = 0.5 * randn(1, length(t_motor));

sinal_real = motor_normal + falha_rolamento + ruido_chao;
Espectro_real = abs(fft(sinal_real));
freqs_motor = linspace(0, 1/(2*0.005), length(t_motor)/2);

figure('Name', 'Questão 10: Diagnóstico de Máquina');
subplot(2,1,1); plot(t_motor, sinal_real); title('Acelerômetro no Motor (Domínio do Tempo)');
subplot(2,1,2); plot(freqs_motor, Espectro_real(1:length(freqs_motor))); 
title('Espectro (FFT): Revela pico da falha em 120Hz sob o ruído');
xlim([0 150]);

disp('Pressione Enter no terminal para finalizar os gráficos.');
pause;
