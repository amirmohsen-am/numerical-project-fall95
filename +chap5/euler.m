function answer = euler(f, initial, h)
    syms x y(x) F 
    f = subs(f, 'y', 'y(x)');
    F = sym(f);
    answer = initial(2) + h * eval(subs(f, {x, y(x)}, {initial(1), initial(2)}));
    
end
