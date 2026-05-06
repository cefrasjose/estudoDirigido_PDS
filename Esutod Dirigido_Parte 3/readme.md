# Estudo Dirigido - Parte 3: Análise no Domínio da Frequência

## Estrutura de Pastas
* **`/teoria`**: Contém o resumo conceitual abordando DTFT, DFT, estabilidade no Plano-Z, o fenômeno de aliasing e a influência do janelamento em amostras finitas.
* **`/simulacoes`**: Código-fonte integral (`simulacoes_parte3.m`) cobrindo as 10 questões solicitadas. Foram implementadas rotinas usando a FFT para distinguir componentes em meio ao ruído e análises de vazamento espectral.
* **`/resultados`**: Arquivo de discussão relacionando a prática computacional com o problema de Diagnóstico de Falhas sugerido pela metodologia PBL.

## Principais Resultados Alcançados
* Análise gráfica demonstrando como a Transformada Discreta de Fourier facilita a leitura de informações que seriam ininteligíveis apenas na observação da forma de onda no tempo.
* Simulação controlada de Aliasing (efeito de espelhamento por amostragem deficiente).
* Análise de estabilidade na Transformada-Z a partir do plot da resposta ao impulso.
* Identificação de falha periódica (harmônica) inserida num sinal simulado de vibração mecânica rotativa.