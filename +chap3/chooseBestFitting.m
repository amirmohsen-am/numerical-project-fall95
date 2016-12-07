function [ fittedFunc, error ] = chooseBestFitting( number, xlar, y)
    

    %this function is called when the user doesnt choose a function to be
    %fitted, so we calculate the rms's of 5 different funtions and choose
    %the best
    
    syms x;
    
    errors = zeros(1, 5);
    funcs = sym(zeros(1,5));
    [funcs(1), errors(1)] = curveFitting1(number, xlar, y);
    [funcs(2), errors(2)] = curveFitting2(number, xlar, y);
    [funcs(3), errors(3)] = curveFitting3(number, xlar, y);
    [funcs(4), errors(4)] = curveFitting4(number, xlar, y);
    [funcs(5), errors(5)] = curveFitting5(number, xlar, y);
     
    min = 1;
    for i=2:5
        if (  errors(i)< errors(min)  )
            min = i;
        end
    end
        
    fittedFunc = funcs(min);
    error = errors(min);
            
end

