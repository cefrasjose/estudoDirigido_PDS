# Resumo Teórico: Filtros Digitais


## 1. Conceito de Filtro Digital
Filtros digitais são sistemas lineares invariantes no tempo (LTI) projetados para modificar o conteúdo espectral de um sinal discreto. Fisicamente, eles atuam como "peneiras matemáticas" que permitem a passagem de determinadas frequências (informação útil) e bloqueiam outras (ruídos ou interferências indesejadas).

## 2. Filtros FIR vs. IIR
Existem duas arquiteturas principais de filtros digitais:
* **FIR (Finite Impulse Response):** A resposta ao impulso tem duração finita. Eles não possuem realimentação na sua equação matemática (dependem apenas de entradas passadas e presentes). 
  * *Vantagem:* São sempre estáveis e podem ser projetados com fase perfeitamente linear.
  * *Desvantagem:* Exigem uma ordem muito alta (muitos cálculos) para atingir cortes abruptos.
* **IIR (Infinite Impulse Response):** A resposta ao impulso teoricamente não tem fim, pois o sistema possui realimentação (a saída atual depende de saídas passadas).
  * *Vantagem:* Atingem excelente seletividade espectral (cortes abruptos) com ordens muito menores, poupando poder de processamento em microcontroladores.
  * *Desvantagem:* Podem se tornar instáveis e causam distorção na fase do sinal.

## 3. Resposta em Frequência e de Fase
A **resposta em frequência** descreve o ganho (atenuação ou amplificação) que o filtro aplica em cada componente senoidal. 
A **resposta de fase** determina como o filtro atrasa cada frequência no tempo. 
* **Fase Linear:** Em um filtro FIR com fase linear, todas as frequências sofrem o mesmo atraso temporal. Isso preserva o "desenho" (forma temporal) do sinal, o que é crucial em telecomunicações e processamento de imagens. Filtros IIR distorcem o sinal pois atrasam frequências diferentes de forma desigual.

## 4. Atraso de Grupo e Estabilidade
O **atraso de grupo** é a derivada da resposta de fase e representa o tempo físico que um "pacote" de frequências leva para atravessar o filtro. Em sistemas IIR, a **estabilidade** é avaliada pela posição dos polos da função de transferência: para que o filtro não sature, todos os polos devem estar estritamente dentro do círculo unitário no plano-Z.

## 5. Aplicações Práticas
As técnicas de filtragem são fundamentais para:
* **Condicionamento de sinais:** Limpeza de ruído branco em sensores industriais e estabilização de leituras.
* **Áudio e Telecomunicações:** Separação de canais de voz e eliminação de ecos.
* **Inteligência Artificial:** Pré-processamento de dados (TinyML) embarcados para garantir que a rede neural receba dados limpos e coerentes.