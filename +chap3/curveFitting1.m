function [ fittedFunc,   error ] = curveFitting1( number, xlar,y)
    %fittedFunc = fitted function
    %error = rms of this curve fitting
    
    syms x;
    X = xlar;
    Y = vpa(log(y), digits);
    Sx0 = number;
    Sx1 = vpa(sum(X), digits);
    Sx2 = vpa(sum(X.^2), digits);
    Sy = vpa(sum(Y), digits);
    Sxy = vpa(sum(X.*Y), digits);
    
    A = [Sx0 Sx1; Sx1 Sx2];
    B = [Sy; Sxy];
    C = vpa(linsolve(A, B), digits);
    alpha = vpa(exp(C(1)), digits);
    beta = C(2);
    
    fitted = vpa(alpha * exp(beta * x ), digits);
    fittedFunc = fitted;
    Plar = zeros(1, number);
    for i=1 : number
        Plar(i) = vpa(eval(subs(fittedFunc, x, xlar(i))), digits);
    end
    error = rms( y-Plar );
       
    

end

