function [ output_args ] = backwardCentralDifferences( number, Xi, Fi)
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
        for row = 1 : number - col + 1
            table(row, col) = vpa( table(row+1, col-1) - table(row, col-1), digits  );
        end
    end
    coeff(1) = 1;
    if ( mod(number,2)==1)
        for i = 2 : number
            k = i-1;
            t = floor(k/2);
            if ( mod(k,2)==0  ) 
                coeff(i) = vpa( (coeff(i-1) *(r+t))/ (i-1), digits);
            else
                coeff(i) = vpa( (coeff(i-1) *(r-t))/ (i-1), digits);
            end
        end
    else
        for i = 2 : number
            k = i-1;
            t = floor(k/2);
            if ( mod(k,2)==0  ) 
                coeff(i) = vpa( (coeff(i-1) *(r-t))/ (i-1), digits);
            else
                coeff(i) = vpa( (coeff(i-1) *(r+t))/ (i-1), digits);
            end
        end 
    end
    for i = 1: number
        P = vpa(P + coeff(i) * table( floor((number + 2 - i)/2), i), digits);
    end
    
    h = Xi(2) - Xi(1);
    P = subs(P, r, (x - Xi(ceil(number/2)))/h );
    P = simplify(P);
    output_args = P;
    
            
    
    
    


end

