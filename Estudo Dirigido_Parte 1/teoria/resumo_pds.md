1. Sinais Contínuos e Discretos

- Definição: Sinais discretos são representados por uma sequência de números, denotados por $x[n]$, onde a variável independente $n$ assume apenas valores inteiros. Geralmente, são obtidos pela amostragem de um sinal contínuo no tempo $x(t)$, tal que $x[n] = x(nT_s)$, onde $T_s$ é o período de amostragem.

- Interpretação Física: Representam a captura pontual de fenômenos do mundo real (como temperatura ao longo do dia) por um conversor analógico-digital (ADC).

2. Exponenciais Complexas e Sequências Elementares

- Formulações:
    
    Impulso Unitário: $\delta[n] = 1$ se $n = 0$, e $0$ se $n \neq 0$.
    
    Degrau Unitário: $u[n] = 1$ se $n \ge 0$, e $0$ se $n < 0$.
    
    Exponencial Complexa: $x[n] = A e^{j\omega n} = A(\cos(\omega n) + j\sin(\omega n))$, fundamental para a análise de Fourier e processamento de frequência.

- Exemplo: A resposta ao impulso de um sistema ($h[n]$) caracteriza completamente um sistema Linear Invariante no Tempo (LTI).

3. Energia e Potência de Sinais

- Definição Matemática:

    Energia ($E$): $E = \sum_{n=-\infty}^{\infty} |x[n]|^2$. Um sinal é "de energia" se $0 < E < \infty$.
    
    Potência Média ($P$): $P = \lim_{N\to\infty} \frac{1}{2N+1} \sum_{n=-N}^{N} |x[n]|^2$. Um sinal é "de potência" se $0 < P < \infty$.
    
    Interpretação Física: Sinais de energia geralmente têm duração finita (como o impacto de um martelo em uma engrenagem). Sinais de potência têm duração infinita e energia infinita, mas potência finita (como o zumbido constante da rede elétrica em 60Hz).

4. Classificação de Sistemas e Estabilidade BIBO

- Linearidade: O sistema obedece à superposição. Se $x_1[n] \to y_1[n]$ e $x_2[n] \to y_2[n]$, então $a x_1[n] + b x_2[n] \to a y_1[n] + b y_2[n]$.

- Causalidade: A saída $y[n]$ depende apenas das entradas presentes e passadas ($x[n], x[n-1], \dots$), nunca de entradas futuras ($x[n+1]$).

- Estabilidade BIBO (Bounded-Input Bounded-Output): * Formulação: Para qualquer entrada limitada $|x[n]| \le M_x < \infty$, a saída deve ser limitada $|y[n]| \le M_y < \infty$.

    Condição LTI: Um sistema LTI é estável se e somente se sua resposta ao impulso for absolutamente somável: $\sum_{n=-\infty}^{\infty} |h[n]| < \infty$.
    
5. Aplicações Tecnológicas e Exemplos

- Vibração Mecânica: Análise de sinais discretos capturados por acelerômetros para prever falhas em máquinas rotativas (ex: detectar frequências anômalas no espectro do sinal).

- Sinais Térmicos: Monitoramento de fornos usando sensores industriais, onde a temperatura é amostrada discretamente para alimentar controladores PID.

- Sinais Elétricos e Sensores Industriais: Filtragem digital de ruído em sinais de tensão elétrica amostrados por sistemas embarcados em chão de fábrica.