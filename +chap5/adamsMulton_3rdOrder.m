function answer = adamsMulton_3rdOrder(f1, initial, h)
    format long
    syms x y(x) F 
    f = subs(f1, 'y', 'y(x)');
    F = sym(f);
    xi_2 = initial(1);
    yi_2 = initial(2);
    
    xi_1 = xi_2 + h;
    yi_1 = chap5.rungeKutta_4thOrder(f1, [xi_2 yi_2], h);
    
    xi = xi_1 + h;
    yi = chap5.rungeKutta_4thOrder(f1, [xi_1 yi_1], h);
    
    fi = eval(vpa(eval(subs(F, {x, y(x)}, {xi, yi}))));
    fi_1 = eval(vpa(eval(subs(F, {x, y(x)}, {xi_1, yi_1}))));
    fi_2 = eval(vpa(eval(subs(F, {x, y(x)}, {xi_2, yi_2}))));
    
    yStar = eval(vpa(yi + (h/12) * (23 * fi - 16 * fi_1 + 5 * fi_2)));
    
    answer = eval(vpa(yi + (h/12) * (5 * eval(vpa(eval(subs(F, {x, y(x)}, {xi + h, yStar})))) + 8 * fi - fi_1)));
    
    
end