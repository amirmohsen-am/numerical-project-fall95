function answer = taylorMethod(f, initial, h, n)
    syms x y(x) F 
    f = subs(f, 'y', 'y(x)');
    F = sym(f);
    expressions = y(x);
    expressions = [expressions; h * F];
    F1 = F;
    for i = 2 : n + 1
        G = diff(F, x);
        G = subs(G, diff(y(x), x), F1);
        expressions = [expressions; G * (h ^ i) / factorial(i)];
        F = G;
    end
    answer = 0;
%     initial
    for i = 1 : n + 1
%         eval(subs(expressions(i), {x, y(x)}, {initial(1), initial(2)}))
        answer = answer + eval(subs(expressions(i), {x, y(x)}, {initial(1), initial(2)}));
    end
end