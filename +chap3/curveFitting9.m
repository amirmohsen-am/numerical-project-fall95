function [ fittedFunc, rmserror ] = curveFitting9( number, xlar, y )
    
    %y = acotx + b
    
    syms x;
    
    for i=1:number
        if ( xlar(i)==0 )
            fittedFunc = 1;
            rmserror = -1;
            return;
        end
    end
    
    
    X = vpa(cot(xlar), digits);
    Y = y;
    Sx0 = number;
    Sx1 = vpa(sum(X), digits);
    Sx2 = vpa(sum(X.^2), digits);
    Sy = vpa(sum(Y), digits);
    Sxy = vpa(sum(X.*Y), digits);
    
    
    A = [Sx0 Sx1; Sx1 Sx2];
    B = [Sy; Sxy];
    C = vpa(linsolve(A, B), digits);
    b = C(1);
    a = C(2);
    fitted = vpa(b + a*cot(x), digits);
    fittedFunc = fitted;
    
    
    Plar = zeros(1, number);
    for i=1 : number
        Plar(i) = vpa(eval(subs(fittedFunc, x, xlar(i))), digits);
    end
    rmserror = rms( y-Plar );
   
    
end

