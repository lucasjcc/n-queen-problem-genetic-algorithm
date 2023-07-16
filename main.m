clear all;
close all;
clc;

%Medição do tempo de execução
tic

%Parâmetros iniciais
tamanhoTabuleiro = 8;
numeroRainhas = tamanhoTabuleiro;
tamanhoPopulacao = 16;
geracao = 0;
quantidadeGeracoes = 500;
probabilidadeMutacao = 0.75;

populacao = zeros(tamanhoPopulacao,numeroRainhas);

%Gerar população aleatória
populacao = gerar_populacao(populacao,tamanhoPopulacao, numeroRainhas);

%Cálculo da aptidão de cada indivíduo
for i = 1:tamanhoPopulacao
    populacao(i,numeroRainhas+1) = fitness(populacao(i,:),tamanhoTabuleiro);
end

%Ordenar por ordem decrescente de aptidão
populacao = sortrows(populacao, numeroRainhas+1, 'descend');

%Verificar se a condição ótima foi atinginda pela população inicial
individuoOtimoPopulacaoInicial = false;

if populacao(1,numeroRainhas+1) == (numeroRainhas*(numeroRainhas-1)/2)
    melhorInidviduo = zeros(1, numeroRainhas);
    for i = 1:numeroRainhas
        melhorInidviduo(1,i) = populacao(1,i);
    end
    individuoOtimoPopulacaoInicial = true;
    disp("Indivíduo com zero checks encontrado na população inicial:");
    disp(melhorInidviduo);  
end

if individuoOtimoPopulacaoInicial == false

    %Realizar as etapas do algortimo até completar a quantidade de gerações
    while geracao < quantidadeGeracoes
        geracao = geracao + 1; 
        %Vencedores do torneio
        paisCampeoes = torneio(populacao, tamanhoPopulacao, numeroRainhas);

        %Realizar o cruzamento entre os vencedores do torneio
        filhos = cruzamento(paisCampeoes);
        
        %Realizar mutação
        filhos = mutacao(filhos, probabilidadeMutacao, numeroRainhas);

        %Cálculo da aptidão dos filhos
        for i = 1:2
            filhos(i,numeroRainhas+1) = fitness(filhos(i,:),tamanhoTabuleiro);
        end
        
        %Inserir os filhos na população
        for i = 1:2
            populacao(tamanhoPopulacao+i,:) = filhos(i,:);
        end
        
        %Ordenar por ordem decrescente de aptidão
        populacao = sortrows(populacao, numeroRainhas+1, 'descend');
        
        %Excluir os 2 piores indivíduos da população
        populacao([tamanhoPopulacao+1, tamanhoPopulacao+2], :) = [];

        melhorAptidao(geracao) = populacao(1, numeroRainhas+1);
        aptidaoMedia(geracao) = sum(populacao(:, numeroRainhas+1))/length(populacao);
   
        %Indivíduos ótimos encontrados
        otimoEncontrado = false;
        if populacao(1, numeroRainhas+1) == (numeroRainhas*(numeroRainhas-1)/2)
            melhorInidviduo = zeros(1, numeroRainhas);
            for i = 1:numeroRainhas
                melhorInidviduo(1,i) = populacao(1,i);
            end
            disp("Indivíduo com zero checks:");
            disp(melhorInidviduo);  
            disp("Esse indivíduo foi encontrado na geração:");
            disp(geracao);
            plot(aptidaoMedia);
            hold on;
            plot(melhorAptidao, '-');
            xlabel("Geração");
            ylabel("Melhor fitness e fitness médio da população");
            otimoEncontrado = true;
            break
        end 
        if geracao == quantidadeGeracoes && otimoEncontrado == false
            disp("Indivíduo com zero checks não encontrado! Melhor indivíduo:");
            melhorInidviduo = zeros(1, numeroRainhas);
            for i = 1:numeroRainhas
                melhorInidviduo(1,i) = populacao(1,i);
            end
            disp(melhorInidviduo);
            plot(aptidaoMedia);
            hold on;
            plot(melhorAptidao, '-');
            xlabel("Geração");
            ylabel("Melhor fitness e fitness médio da população");
            break
        end
    end
end

toc
