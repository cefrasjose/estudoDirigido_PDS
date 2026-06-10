# Discussão Técnica e Solução PBL
**Etapa 4:** Filtros Digitais

## Problema Norteador (PBL)
> *Um sistema de monitoramento agrícola utiliza sensores para medir variáveis ambientais e operacionais. Entretanto, os sinais adquiridos apresentam ruídos e interferências... Como projetar e validar filtros digitais capazes de reduzir os ruídos sem comprometer as informações relevantes?*

### Resolução Aplicada
Em um ambiente de monitoramento agrícola, as variáveis de interesse (como temperatura do solo, umidade ou nível de silos) geralmente possuem variação muito lenta no tempo (baixa frequência). Por outro lado, as interferências de inversores de frequência em tratores, ruído elétrico dos circuitos ($60$Hz) e vibrações mecânicas constituem componentes de alta frequência.

Para resolver o problema sem comprometer os dados, o projeto do filtro digital segue estes passos:
1. **Análise Espectral Prévia:** Avalia-se a Transformada de Fourier do sinal ruidoso para identificar exatamente onde termina a banda de dados úteis (ex: até $2$Hz) e onde começa o ruído.
2. **Seleção da Arquitetura (FIR vs. IIR):** * Sendo um sistema agrícola, os sensores geralmente estão acoplados a microcontroladores de baixo custo (baixo poder de processamento). 
   * Um filtro **IIR** passa-baixa (como um Butterworth de baixa ordem) é a escolha ideal. Ele fornecerá uma forte atenuação de alta frequência exigindo poucas operações matemáticas por amostra, economizando bateria do nó sensor
   * Como a temperatura/umidade não exige que a "fase" exata do sinal seja preservada milissegundo a milissegundo, a distorção de fase do IIR não será um problema para a tomada de decisão.
3. **Validação:** A validação é feita checando o plano-Z para garantir que o filtro projetado é estável (polos dentro do círculo unitário) e aplicando o algoritmo em dados históricos para confirmar que a curva ambiental não foi achatada excessivamente pela frequência de corte.