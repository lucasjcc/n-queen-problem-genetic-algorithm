function [campeoes] = torneio(populacao, tamanhoPopulacao, numeroRainhas)
    %Seleciona 6 indivíduos para o torneio
    %aleatorio = randperm(tamanhoPopulacao, 6);
    aleatorio = randperm(tamanhoPopulacao, 8);
    aleatorioDecrescente = sort(aleatorio);
    campeoes = zeros(2, numeroRainhas);
    %Pegar os dois indivíduos com o menor indíce (maior aptidão)
    %dos que foram selecionados
    for i = 1:2
        for j = 1:numeroRainhas
            campeoes(i,j) = populacao(aleatorioDecrescente(i), j);
        end
    end
end

