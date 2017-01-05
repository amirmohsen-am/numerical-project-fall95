function answer = rungeKutta_Midpoint(f, initial, h)
    syms x y(x) F 
    f = subs(f, 'y', 'y(x)');
    F = sym(f);
    a = initial(1);
    b = initial(2);
    
    k1 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a, b}))))));
    k2 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a + (h/2), b + (k1/2)}))))));

    answer = eval(vpa(b + k2));
end