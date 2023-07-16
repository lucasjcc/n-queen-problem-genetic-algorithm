function [aptidao] = fitness(individuo, tamanhoTabuleiro)
    %Montar o tabuleiro
    diagonalPositiva = zeros(tamanhoTabuleiro,tamanhoTabuleiro);
    diagonalNegativa = zeros(tamanhoTabuleiro,tamanhoTabuleiro);

    for i = 1:tamanhoTabuleiro
        for j = 1:tamanhoTabuleiro
            diagonalPositiva(i,j) = i+j;
            diagonalNegativa(i,j) = i-j;
        end
    end

    %Cálculo do valor de aptidão de cada indivíduo
    quantidadeCheques = 0;
    nRainhas = tamanhoTabuleiro;
    localizacaoDiagonalPositiva = zeros(1,tamanhoTabuleiro);
    localizacaoDiagonalNegativa = zeros(1,tamanhoTabuleiro);
    for i = 1:nRainhas
        localizacaoDiagonalPositiva(1,i) = diagonalPositiva(i, individuo(1,i));
        localizacaoDiagonalNegativa(1,i) = diagonalNegativa(i, individuo(1,i));
    end

    %Comparar a localização de cada rainha e, caso estejam na mesma
    %localização em relação às diagonais, soma-se um na quantidade de
    %cheques presentes naquele indivíduo
    for i = 1:nRainhas
        for j = 1:nRainhas
            if i ~= j
                if localizacaoDiagonalPositiva(1,i) == localizacaoDiagonalPositiva(1,j)
                    quantidadeCheques = quantidadeCheques + 1;
                end
                if localizacaoDiagonalNegativa(1,i) == localizacaoDiagonalNegativa(1,j)
                    quantidadeCheques = quantidadeCheques + 1;
                end
            end
        end
    end
    
    quantidadeCheques = quantidadeCheques/2;
    quantidadeMaximaCheques = nRainhas*(nRainhas-1)/2;

    aptidao = quantidadeMaximaCheques - quantidadeCheques;

end

