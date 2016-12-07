function [ output_args ] = dividedDifferences( number, Xi, Fi )
    
    %Xi vector of Xs
    %Fi vector of Fs
    %number number of points
    
    [Xi, Fi] = sortByX(number, Xi, Fi);
    format long;
    table = zeros(number, number);
    syms x;
    P = 0;
    coeff = sym(zeros(1, number));
    for row = 1: number
        table(row, 1) = Fi(row);
    end
    for col = 2: number
        for row = col:number
            table(row, col) = vpa((table(row, col-1) - table(row-1, col-1)) / (Xi(row) - Xi(row - col + 1)), digits); 
        end
    end
    coeff(1) = 1;
    for i = 2: number
        coeff(i) = coeff(i-1) * (x-Xi(i-1));
    end
    for i = 1: number
       P = P + vpa(coeff(i)*table(i, i), digits); 
    end
    P = simplify(P);
    output_args = P;
    
end

