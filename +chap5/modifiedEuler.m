function answer = modifiedEuler(f, initial, h)
    syms x y(x) F 
    f = subs(f, 'y', 'y(x)');
    F = sym(f);
    a = initial(1);
    b = initial(2);
    yStar = b + h * eval(subs(F, {x, y(x)}, {a, b}));
    answer = b + (h/2) * (eval(subs(F, {x, y(x)}, {a, b})) + eval(subs(F, {x, y(x)}, {a + h, yStar})));
end