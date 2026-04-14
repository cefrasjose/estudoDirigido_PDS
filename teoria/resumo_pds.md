1. Sinais Contínuos e Discretos

Conforme Oppenheim e Schafer, sinais discretos ($x[n]$) são frequentemente sequências matemáticas obtidas através da amostragem de sinais contínuos ($x(t)$). Essa conversão é o que permite que fenômenos físicos (como temperatura ou vibração) sejam processados no domínio digital.

2. Sequências Elementares e Operações

Para a análise de sistemas, utilizamos sinais fundamentais:Impulso Unitário ($\delta[n]$): Vale $1$ em $n = 0$ e $0$ nos demais instantes.Degrau Unitário ($u[n]$): Vale $1$ para $n \ge 0$ e $0$ para $n < 0$.Exponenciais Complexas: Fundamentais para a análise de frequência.
As operações básicas aplicadas a esses sinais incluem deslocamento no tempo ($x[n-k]$), inversão temporal ($x[-n]$) e escalonamento de amplitude.

3. Classificação de Sistemas Discretos

Segundo Lathi, modelar um sistema exige identificar suas propriedades dinâmicas na relação entrada-saída. Um sistema discreto pode ser classificado como:Com ou Sem Memória: Sem memória se a saída em $n$ depende apenas da entrada no mesmo instante $n$.Linear ou Não Linear: Lineares obedecem ao princípio da superposição (aditividade e homogeneidade).Causal ou Não Causal: Causais não dependem de entradas futuras, o que é mandatório para sistemas operando em tempo real.Invariante no Tempo (SIT/LTI): Um atraso na entrada provoca um atraso idêntico na saída, sem alterar o formato do sinal.Estabilidade BIBO (Bounded-Input Bounded-Output): Entradas limitadas geram saídas limitadas, evitando que o sistema "estoure".Invertibilidade: É possível recuperar a entrada a partir da saída do sistema.

4. Energia e Potência

Com base em Proakis, a caracterização de um sinal como de energia (energia total finita) ou de potência (potência média finita) é uma etapa essencial para o desenvolvimento de algoritmos de processamento.