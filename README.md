# Algoritmo genético para solução do problema das N-Rainhas

## Introdução
Dado um tabuleiro de xadrez regular $(NxN)$ e $N$ rainhas, o problema das $N$-rainhas consiste em posicioná-las
no tabuleiro de forma que nenhuma rainha seja capaz de capturar outra rainha.

O problema pode ser formulado como um problema de Satisfação de Restrições, no qual o objetivo é
encontrar uma configuração das rainhas sobre o tabuleiro que não viole nenhuma restrição.

## Descrição
A representação dos indivíduos é vetor obtido permutando-se os valores que vão de 1 a N. Cada posição do vetor indica em qual linha a rainha está. Desta forma, evita-se *checks* nas horizontais e verticais.

