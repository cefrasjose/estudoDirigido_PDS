# Estudo Dirigido - Parte 2: Convolução e Sistemas LTI

## Contexto Acadêmico
* **Instituição:** Instituto Federal da Paraíba (IFPB) — Campus Campina Grande.
* **Curso:** Engenharia da Computação.
* **Disciplina:** Processamento Digital de Sinais.
* **Aluno:** Cefras José Ferreira Mandú de Almeida
* **Professor:** Moacy Pereira da Silva.

## Objetivos desta Etapa
As atividades aqui desenvolvidas visam consolidar a capacidade de:
* Compreender e aplicar o conceito de sistemas LTI .
* Interpretar a resposta ao impulso ($h[n]$) como a "assinatura" de um sistema.
* Executar cálculos de convolução discreta (manual e computacional).
* Relacionar equações de diferenças com o comportamento temporal de sistemas.
* Analisar propriedades fundamentais como causalidade, estabilidade BIBO e resposta transitória.
* Aplicar filtros digitais para suavização e filtragem de ruído em sinais de sensores.

## Estrutura de Pastas e Organização
Para manter a clareza e o rigor técnico exigido pelo portfólio, os arquivos foram subdivididos da seguinte forma:

* **`/teoria`**: Contém as respostas conceituais e interpretações sobre sistemas LTI, causalidade e estabilidade (Atividades 1 e 6).
* **`/calculos`**: Demonstração passo a passo dos cálculos manuais de convolução e determinação de resposta ao impulso via equações de diferenças (Atividades 2 e 3) .
* **`/simulacoes`**: Scripts desenvolvidos em Octave/MATLAB para implementação computacional da convolução e filtros de média móvel (Atividades 4 e 5).
* **`/resultados`**: Gráficos gerados, incluindo a comparação entre sinais originais ruidosos e sinais suavizados.

## Destaques das Atividades
* **Filtragem Digital**: Implementação de um filtro de média simples para suavização de sinais ruidosos de sensores.
* **Análise de Estabilidade**: Verificação matemática da condição de estabilidade BIBO ($\sum|h[n]| < \infty$) em diferentes sistemas.
* **Desafio PBL**: Discussão técnica sobre o uso da convolução na melhoria da qualidade de sinais em sistemas de aquisição de dados.

---
*Este material compõe o portfólio técnico individual do estudante para a unidade 2026.1.*