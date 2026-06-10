# Resumo Teórico: Análise no Domínio da Frequência

## 1. Representação Temporal vs. Espectral
A representação no domínio do tempo descreve a evolução da amplitude de um sinal ao longo das amostras ($x[n]$). No entanto, muitos fenômenos ocultam suas características no tempo. A representação espectral (frequência) resolve isso ao evidenciar quais frequências estão presentes e com que intensidade elas contribuem para a formação do sinal observado. Fisicamente, é como olhar para um acorde tocado em um piano: no tempo, vemos uma onda complexa embaraçada; na frequência, vemos exatamente quais teclas foram pressionadas.

## 2. DTFT, DFT e FFT
* **Transformada de Fourier em Tempo Discreto (DTFT):** Representa uma sequência discreta através de uma função contínua da frequência. É essencial para entender o comportamento espectral de sistemas lineares invariantes no tempo (LTI) e fenômenos de filtragem.
* **Transformada Discreta de Fourier (DFT):** Como computadores não lidam com funções contínuas infinitas, a DFT é utilizada como uma versão amostrada e finita da representação espectral. Ela permite a análise numérica de sinais, sendo vital em telecomunicações e áudio.
* **Fast Fourier Transform (FFT):** Não é uma nova transformada, mas sim um algoritmo altamente eficiente para calcular a DFT. A FFT reduz drasticamente o custo computacional, o que a torna indispensável em sistemas embarcados e diagnósticos industriais operando em tempo rea.

## 3. A Transformada-Z e a Estabilidade
A Transformada-Z amplia a análise de sinais ao representar sequências no plano complexo matemático. Diferente da Transformada de Fourier, que analisa apenas a resposta em frequência, a Transformada-Z permite investigar propriedades estruturais profundas de um sistema discreto, como estabilidade, causalidade e sua região de convergência (ROC). Fisicamente, a localização dos pólos de um sistema no plano-Z dita se uma vibração mecânica irá se atenuar (sistema estável) ou se amplificar até a falha do equipamento (sistema instável).

## 4. Aliasing e Janelamento
A análise de sinais reais exige cuidados com o processo de digitalização:
* **Aliasing:** Ocorre quando a frequência de amostragem de um ADC é insuficiente para capturar a dinâmica do fenômeno. Fisicamente, frequências altas acabam "se disfarçando" de frequências baixas, provocando distorções irreversíveis (sobreposição). É o mesmo efeito visual que faz as rodas de um carro parecerem girar para trás em um vídeo.
* **Janelamento:** Ao extrair uma parte finita de um sinal contínuo para análise computacional, geramos cortes bruscos (descontinuidades) nas bordas. Isso causa o "vazamento espectral", onde a energia de uma frequência se espalha no gráfico. O janelamento suaviza essas bordas, reduzindo o vazamento e melhorando a precisão da identificação das frequências.