function [ output_args ] = backwardDifferences( number, Xi, Fi)
    %Xi vector of Xs
    %Fi vector of Fs
    %number number of points
    
    [Xi, Fi] = chap3.sortByX(number, Xi, Fi);
    
    syms x;
    syms r;
    P = 0;
    table = zeros(number, number);
    coeff = sym(zeros(1, number));
    for row = 1 : number
        table(row, 1) = Fi(row);
    end
    for col = 2 : number
        for row = 1: number-col + 1
            table(row, col) = vpa( table(row+1, col-1) - table(row, col-1), digits  );
        end
    end
    coeff(1) = 1;
    for i = 2: number
        coeff(i) = vpa( (coeff(i-1) *(r+i-2))/ (i-1), digits);   
    end
    
    
    for i = 1: number
        P = vpa(P + coeff(i) * table(number - i + 1, i), digits);
    end
    h = Xi(2) - Xi(1);
    P = subs(P, r, (x-Xi(number)) / h);
    P = simplify(P);
    output_args = P;

end

