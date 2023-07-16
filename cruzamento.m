function [offspring] = CutAndCrossfill_Crossover(parents)
    N = size(parents, 2);
    offspring = zeros(2,N);
    pos = floor(1+N*rand());
    offspring(1,1:pos) = parents(1,1:pos);
    offspring(2,1:pos) = parents(2,1:pos);
    s1 = pos+1;
    s2 = pos+1;
    for i = 1:N
        check1 = 0;
        check2 = 0;
        for j = 1:pos
            if parents(2,i) == offspring(1,j)
                check1 = 1;
            end
            if parents(1,i) == offspring(2,j)
                check2 = 1;
            end
        end
        if check1 == 0
            offspring(1,s1) = parents(2,i);
            s1 = s1 + 1;
        end
        if check2 == 0
            offspring(2,s2) = parents(1,i);
            s2 = s2 + 1;
        end
    end
    
end

