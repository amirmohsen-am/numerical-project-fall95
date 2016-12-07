function [ fittedFunc, error ] = curveFitting5( number, xlar, y)
    

    %fittedFunc = fitted function
    %error = rms of this curve fitting
    
    syms x;
    X = xlar;
    Y = y;
    Sx0 = number;
    Sx1 = vpa(sum(X), digits);
    Sx2 = vpa(sum(X.^2), digits);
    Sx3 = vpa(sum(X.^3), digits);
    Sx4 = vpa(sum(X.^4), digits);
    Sx5 = vpa(sum(X.^5), digits);
    Sx6 = vpa(sum(X.^6), digits);
    
    Sy = vpa(sum(Y), digits);
    Sxy = vpa(sum(X.*Y), digits);
    Sx2y = vpa(sum( (X.^2) .*Y), digits);
    Sx3y = vpa(sum( (X.^3) .*Y), digits);
    
    A = [Sx0 Sx1 Sx2 Sx3; Sx1 Sx2 Sx3 Sx4; Sx2 Sx3 Sx4 Sx5; Sx3 Sx4 Sx5 Sx6];
    B = [Sy; Sxy; Sx2y; Sx3y];
    C = vpa( linsolve(A, B),digits);
    
    a0 = C(1);
    a1 = C(2);
    a2 = C(3);
    a3 = C(4);
    
    fitted = vpa(a0 + a1*x + a2* (x^2) + a3*(x^3) );
    fittedFunc = fitted;
    
    Plar = zeros(1, number);
    for i=1 : number
        Plar(i) = vpa(eval(subs(fittedFunc, x, xlar(i))), digits);
    end
    error = rms( y-Plar );
    
end

