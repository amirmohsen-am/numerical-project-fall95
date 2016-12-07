function [ fittedFunc, rmserror ] = curveFitting4( number, xlar,  y)
    

    %fittedFunc = fitted function
    %error = rms of this curve fitting

    for i = 1:number
        if ( y(i) == 0)
            %error('Y Values Should Not Be Zero. Y(%d) Is Zero', i);
            fittedFunc = 1;
            rmserror = -1;
            return;
        end
    end
    
    syms x;
    Y = vpa(1./y, digits);
    X = xlar;
    
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
    
    fitted = vpa(1/(a*x + b));
    fittedFunc = fitted;
    
    Plar = zeros(1, number);
    for i=1 : number
        Plar(i) = vpa(eval(subs(fittedFunc, x, xlar(i))), digits);
    end
    rmserror = rms( y-Plar );
    
    
end

