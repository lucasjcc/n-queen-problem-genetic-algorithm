function [filhosMutados] = mutacao(filhos,probabilidadeMutacao, numeroRainhas)
    aleatorio = rand();
    if aleatorio < probabilidadeMutacao
        indexTroca = randperm(numeroRainhas, 2);
        for i = 1:2
            clone = filhos(i, indexTroca(1));
            filhos(i, indexTroca(1)) = filhos(i, indexTroca(2));
            filhos(i, indexTroca(2)) = clone;
        end
    end
    filhosMutados = filhos;
end

