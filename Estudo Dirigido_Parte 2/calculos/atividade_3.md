## Atividade 3: Sistema descrito por equação de diferenças

**Sistema:** y[n] = 0.8 y[n-1] + x[n]
**(Condição inicial nula e entrada impulso x[n] = degrau unitário/impulso)**

**1) Primeiros valores de h[n] para 0 <= n <= 5:**
* h[0] = 0.8(0) + 1 = 1
* h[1] = 0.8(1) + 0 = 0.8
* h[2] = 0.8(0.8) + 0 = 0.64
* h[3] = 0.8(0.64) + 0 = 0.512
* h[4] = 0.8(0.512) + 0 = 0.4096
* h[5] = 0.8(0.4096) + 0 = 0.32768

**2) Análise de Estabilidade:**
O sistema é estável. Os valores decaem progressivamente para zero (a equação é análoga a h[n] = (0.8)^n u[n]). A soma absoluta de h[n] será convergente e finita, satisfazendo a condição BIBO.

**3) Análise de Causalidade:**
O sistema é causal. A saída atual y[n] depende apenas da entrada presente x[n] e da saída passada y[n-1], não exigindo valores futuros.