function [ fittedFunc, error ] = chooseBestFitting( number, xlar, y)
    

    %this function is called when the user doesnt choose a function to be
    %fitted, so we calculate the rms's of 5 different funtions and choos
    %the best
    
    syms x;
    
    errors = zeros(1, 9);
    funcs = sym(zeros(1,9));
    [funcs(1), errors(1)] = chap3.curveFitting1(number, xlar, y);
    [funcs(2), errors(2)] = chap3.curveFitting2(number, xlar, y);
    [funcs(3), errors(3)] = chap3.curveFitting3(number, xlar, y);
    [funcs(4), errors(4)] = chap3.curveFitting4(number, xlar, y);
    [funcs(5), errors(5)] = chap3.curveFitting5(number, xlar, y);
    
    [funcs(6), errors(6)] = chap3.curveFitting6(number, xlar, y);
    [funcs(7), errors(7)] = chap3.curveFitting7(number, xlar, y);
    [funcs(8), errors(8)] = chap3.curveFitting8(number, xlar, y);
    [funcs(9), errors(9)] = chap3.curveFitting9(number, xlar, y);
    
    min = 100;
    rmsError = realmax;
    for i=1:9
        if ( errors(i)>= 0  && errors(i) < rmsError  )
            min = i;
            rmsError = errors(i);
        end
    end
        
    fittedFunc = funcs(min);
    error = errors(min);
            
end

