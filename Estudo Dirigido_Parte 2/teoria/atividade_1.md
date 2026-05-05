## Atividade 1: Interpretação Conceitual

**1) O que significa afirmar que um sistema é linear e invariante no tempo?**
Um sistema linear obedece ao princípio da superposição (a resposta a uma soma de sinais é a soma das respostas individuais). A invariância no tempo significa que um deslocamento no sinal de entrada resultará em um deslocamento idêntico no sinal de saída, sem alterar o seu formato.

**2) Por que a resposta ao impulso é suficiente para caracterizar um sistema LTI?**
Porque qualquer sequência de entrada pode ser decomposta em uma soma de impulsos deslocados e escalonados. Sendo o sistema LTI, conhecer a resposta a um único impulso (h[n]) permite calcular a saída para qualquer entrada através da convolução.

**3) Qual o significado físico da convolução em sistemas discretos?**
A convolução representa como o sistema reage aos estímulos ao longo do tempo. A saída atual é uma composição ponderada de versões deslocadas da resposta ao impulso, mostrando como entradas passadas continuam afetando o sistema no momento atual.

**4) Qual a diferença entre resposta transitória e regime permanente?**
A resposta transitória é o comportamento inicial do sistema logo após a aplicação de uma entrada, enquanto o sistema se ajusta. O regime permanente é o comportamento assumido após esse período de instabilidade inicial passar.

**5) O que se entende por sistema causal?**
É um sistema onde a saída em um determinado instante depende apenas de valores presentes e passados da entrada, não dependendo de valores futuros.

**6) O que se entende por sistema estável?**
Um sistema é estável (sentido BIBO) quando toda entrada limitada em amplitude produz uma saída também limitada.