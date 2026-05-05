## Desafio Proposto

**Como a convolução com um filtro de média móvel melhora a qualidade do sinal medido:**
* **O papel da resposta ao impulso:** O h[n] define o "tamanho da janela" e os pesos. Em uma média simples, ele pondera o presente e o passado imediato de forma igualitária para compor o resultado.
* **Por que ocorre a suavização:** A média de pontos adjacentes faz com que variações bruscas (como ruídos rápidos) se cancelem, revelando a dinâmica real do sinal.
* **Limitações:** A principal limitação é o atraso (delay) introduzido na leitura. Além disso, variações reais e muito rápidas do sensor podem ser "borradas" pelo filtro, sendo confundidas com ruído.