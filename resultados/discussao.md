Problema: *Como representar matematicamente o comportamento temporal de um sensor real e quais propriedades estruturais devem ser analisadas para garantir o correto processamento digital desse sinal?*

A representação matemática de um sensor real é feita através do processo de amostragem, convertendo o sinal analógico contínuo $x(t)$ em uma sequência numérica discreta $x[n]$. Para garantir o correto processamento digital, analisamos as seguintes propriedades:

1. Causalidade e Estabilidade: Em aplicações de sensores industriais e sinais elétricos, o sistema deve ser estritamente causal (não depender de amostras futuras, permitindo operação em tempo real) e possuir estabilidade BIBO para evitar que ruídos de leitura levem o controlador à saturação.

2. Análise de Energia e Potência:
    - Como demonstrado nas simulações, sinais transitórios (como o impacto isolado em uma análise de vibração mecânica) são caracterizados como sinais de energia.

    - Sinais contínuos e repetitivos (como a oscilação térmica de um forno ou o ruído estacionário de uma rede elétrica) são caracterizados como sinais de potência. O cálculo computacional da potência (realizado através da média dos quadrados da amplitude, resultando em $P = 4.5$ no script) permite dimensionar filtros digitais apropriados para isolar a frequência fundamental do ruído.
    
3. Exponenciais Complexas: São a base matemática para transpor sinais do domínio do tempo para o domínio da frequência, etapa crucial para processar e identificar assinaturas de falhas em sinais de vibração mecânica e oscilações de sensores térmicos.