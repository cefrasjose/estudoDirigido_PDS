## Atividade 2: Cálculo manual de convolução

**Dados:** x[n] = {1, 2, 1} e h[n] = {1, 1}

**1) Cálculo manual:**
Utilizando a fórmula da convolução y[n] = x[n] * h[n]:
* Para n = 0: y[0] = x[0]h[0] = (1)(1) = 1
* Para n = 1: y[1] = x[0]h[1] + x[1]h[0] = (1)(1) + (2)(1) = 3
* Para n = 2: y[2] = x[1]h[1] + x[2]h[0] = (2)(1) + (1)(1) = 3
* Para n = 3: y[3] = x[2]h[1] = (1)(1) = 1

**2) Resultado em forma de sequência:**
y[n] = {1, 3, 3, 1}

**3) Significado do resultado:**
O filtro realizou a soma de amostras adjacentes do sinal de entrada. O sinal x[n] sofreu um espalhamento no tempo (passou de 3 para 4 amostras), evidenciando a propriedade de "memória" do sistema sobre o sinal original.