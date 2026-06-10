import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

#Configuracoes globais
fs = 1000  #Frequencia de amostragem
t = np.arange(0, 1.0, 1/fs)
nyq = 0.5 * fs

#==========================================
#Q1: Duas senoides e Filtro Passa-Baixa (FIR)
#==========================================
f1, f2 = 10, 150 #10Hz e 150Hz
x1 = np.sin(2*np.pi*f1*t) + np.sin(2*np.pi*f2*t)
taps_q1 = signal.firwin(51, 50/nyq) #Corte em 50Hz
y1 = signal.lfilter(taps_q1, 1.0, x1)

plt.figure(figsize=(10, 4))
plt.plot(t[:100], x1[:100], label='Original (10Hz + 150Hz)')
plt.plot(t[:100], y1[:100], label='Filtrado (Apenas 10Hz)', linewidth=2)
plt.title('Q1: Filtro Passa-Baixa em Senoides')
plt.legend(); plt.grid(True)

#==========================================
#Q2 & Q3: Ruído Branco + FIR vs IIR
#==========================================
x_clean = np.sin(2*np.pi*5*t)
ruido = 0.5 * np.random.normal(size=len(t))
x_ruido = x_clean + ruido

#Q2: FIR Passa-Baixa
taps_fir = signal.firwin(101, 20/nyq)
y_fir = signal.lfilter(taps_fir, 1.0, x_ruido)

#Q3: IIR Butterworth (Ordem menor para o mesmo corte)
b_iir, a_iir = signal.butter(4, 20/nyq, btype='low')
y_iir = signal.lfilter(b_iir, a_iir, x_ruido)

plt.figure(figsize=(10, 4))
plt.plot(t[:200], x_ruido[:200], alpha=0.5, label='Com Ruído')
plt.plot(t[:200], y_fir[:200], label='FIR (Ordem 100)')
plt.plot(t[:200], y_iir[:200], label='IIR Butter (Ordem 4)')
plt.title('Q2 e Q3: Redução de Ruído Aditivo')
plt.legend(); plt.grid(True)

#==========================================
#Q4: Resposta em Frequência (FIR vs IIR)
#==========================================
w_fir, h_fir = signal.freqz(taps_fir, 1.0, worN=8000)
w_iir, h_iir = signal.freqz(b_iir, a_iir, worN=8000)

plt.figure(figsize=(10, 4))
plt.plot(w_fir*fs/(2*np.pi), 20*np.log10(np.abs(h_fir)), label='FIR')
plt.plot(w_iir*fs/(2*np.pi), 20*np.log10(np.abs(h_iir)), label='IIR')
plt.title('Q4: Resposta em Frequência (Magnitude)')
plt.ylabel('Amplitude [dB]'); plt.xlabel('Frequência [Hz]')
plt.legend(); plt.grid(True)

#==========================================
#Q5: Polos e Zeros (IIR)
#==========================================
z, p, k = signal.tf2zpk(b_iir, a_iir)
plt.figure(figsize=(5, 5))
plt.scatter(np.real(z), np.imag(z), marker='o', edgecolors='b', facecolors='none', label='Zeros')
plt.scatter(np.real(p), np.imag(p), marker='x', color='r', label='Polos')
circle = plt.Circle((0, 0), 1, color='gray', fill=False, linestyle='--')
plt.gca().add_patch(circle)
plt.title('Q5: Plano-Z (Sistema Estável, polos dentro do círculo)')
plt.legend(); plt.grid(True)

#==========================================
#Q6: Resposta ao Impulso
#==========================================
impulso = signal.unit_impulse(150)
imp_fir = signal.lfilter(taps_fir, 1.0, impulso)
imp_iir = signal.lfilter(b_iir, a_iir, impulso)

plt.figure(figsize=(10, 4))
plt.plot(imp_fir, label='FIR (Zera completamente)')
plt.plot(imp_iir, label='IIR (Decai exponencialmente)')
plt.title('Q6: Resposta ao Impulso')
plt.legend(); plt.grid(True)

#==========================================
#Q7: Filtro Passa-Faixa
#==========================================
#Projeto do filtro passa-faixa entre 40Hz e 60Hz
taps_bp = signal.firwin(101, [40/nyq, 60/nyq], pass_zero=False)

#Sinal composto por 3 frequencias: 10Hz, 50Hz (alvo) e 120Hz
x_bp = np.sin(2*np.pi*10*t) + np.sin(2*np.pi*50*t) + np.sin(2*np.pi*120*t)
y_bp = signal.lfilter(taps_bp, 1.0, x_bp)

#Calculo da FFT para verificar no dominio da frequencia
X_bp = np.abs(np.fft.fft(x_bp))
Y_bp = np.abs(np.fft.fft(y_bp))
freqs = np.fft.fftfreq(len(t), 1/fs)

#Pegando apenas a parte positiva do espectro
metade = len(t) // 2

#Plotagem no dominio da frequencia
plt.figure(figsize=(10, 4))
plt.plot(freqs[:metade], X_bp[:metade], label='Sinal Original (Picos em 10, 50 e 120 Hz)', alpha=0.5)
plt.plot(freqs[:metade], Y_bp[:metade], label='Sinal Filtrado (Sobrou apenas o 50 Hz)', linewidth=2, color='red')
plt.title('Q7: Filtro Passa-Faixa no Domínio da Frequência')
plt.xlabel('Frequência [Hz]')
plt.ylabel('Magnitude')
plt.xlim(0, 150)
plt.legend()
plt.grid(True)

#==========================================
#Q8 & Q9: Resposta de Fase e Atraso de Grupo
#=========================================
fase_fir = np.unwrap(np.angle(h_fir))
fase_iir = np.unwrap(np.angle(h_iir))

plt.figure(figsize=(10, 4))
plt.plot(w_fir, fase_fir, label='FIR (Fase Linear)')
plt.plot(w_iir, fase_iir, label='IIR (Fase Não-Linear)')
plt.title('Q8: Resposta de Fase')
plt.legend(); plt.grid(True)

w, gd_iir = signal.group_delay((b_iir, a_iir))
w, gd_fir = signal.group_delay((taps_fir, 1.0))
plt.figure(figsize=(10, 4))
plt.plot(w, gd_fir, label='FIR (Atraso Constante)')
plt.plot(w, gd_iir, label='IIR (Atraso Variável)')
plt.title('Q9: Atraso de Grupo')
plt.legend(); plt.grid(True)

#==========================================
#Q10: Aplicação Prática - Suavização de Sinal em Sensor
#==========================================
t_sensor = np.linspace(0, 0.5, 500)

impacto_ideal = np.exp(-15*t_sensor) * np.sin(2*np.pi*25*t_sensor) * (t_sensor > 0.05)

ruido_sensor = 0.3 * np.random.randn(len(t_sensor))
leitura_bruta = impacto_ideal + ruido_sensor

taps_sensor = signal.firwin(41, 40/(0.5*(len(t_sensor)/0.5)))
leitura_limpa = signal.filtfilt(taps_sensor, 1.0, leitura_bruta)

plt.figure(figsize=(10, 5))
plt.plot(t_sensor, leitura_bruta, color='lightgray', label='Leitura Bruta do Sensor (Ruído)')
plt.plot(t_sensor, impacto_ideal, 'k--', label='Impacto Real no Alvo')
plt.plot(t_sensor, leitura_limpa, 'r', linewidth=2, label='Sinal Pós-Filtragem Digital')
plt.title('Q10: Filtragem de Ruído em Sensor de Precisão ao Alvo')
plt.xlabel('Tempo [s]'); plt.ylabel('Amplitude')
plt.legend(); plt.grid(True)

plt.show()