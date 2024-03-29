function answer = rungeKutta_4thOrder(f, initial, h)
    format long
    syms x y(x) F 
    f = subs(f, 'y', 'y(x)');
    F = sym(f);
    a = initial(1);
    b = initial(2);
    
    k1 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a, b}))))));
    k2 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a + (h/2), b + (k1/2)}))))));
    k3 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a + (h/2), b + (k2/2)}))))));
    k4 = eval(vpa(h * eval(vpa(eval(subs(F, {x, y(x)}, {a + h, (b + k3)}))))));
    
    answer = eval(vpa(b + ((k1 + 2*k2 + 2*k3 + k4) / 6)));
end