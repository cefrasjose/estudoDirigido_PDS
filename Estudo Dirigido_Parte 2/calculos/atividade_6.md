## Atividade 6: Análise de estabilidade e causalidade

**a) y[n] = x[n] + x[n-1]**
* **Causal:** Sim. Depende apenas do tempo presente (n) e do passado (n-1).
* **Estável:** Sim. Se a entrada é limitada a M, a saída máxima será 2M.

**b) y[n] = x[n+1]**
* **Causal:** Não. A saída atual requer conhecimento de uma entrada futura (n+1).
* **Estável:** Sim. O sistema apenas adianta o sinal, mantendo a amplitude limitada.

**c) h[n] = (0.5)^n u[n]**
* **Causal:** Sim. A função degrau u[n] garante que a resposta seja zero para n < 0.
* **Estável:** Sim. A soma infinita converge para 2, que é menor que infinito (critério BIBO).

**d) h[n] = 2^n u[n]**
* **Causal:** Sim, pelo mesmo motivo do item C (presença de u[n]).
* **Estável:** Não. À medida que n cresce, 2^n tende ao infinito, violando a condição de soma finita.