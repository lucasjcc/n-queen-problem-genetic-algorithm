function [populacaoInicial] = gerar_populacao(populacao,tamanhoPopulacao,numeroRainhas)
    %Geração aleatória através de uma permutação
    populacaoInicial = zeros(tamanhoPopulacao,numeroRainhas);
    for i = 1:tamanhoPopulacao
        for j = 1:numeroRainhas
            populacaoInicial(i,:) = randperm(numeroRainhas, numeroRainhas);
        end
    end
end

