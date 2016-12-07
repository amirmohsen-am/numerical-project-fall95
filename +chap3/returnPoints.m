function [ n, xlar , y] = returnPoints( number, min, max, func )
    
    %when the user doesnt specify some points and instead give us the
    %function, this function returns some points from [min:max] 
    
    syms x;
    
    xlar = zeros(1, number);
    
    h = (max - min) / (number-1);
    t = min - h;
    for i=1: number
        t = t+h;
        xlar(i) = t;
    end
    n = number;
    y = eval(subs(func, x, xlar));


end

