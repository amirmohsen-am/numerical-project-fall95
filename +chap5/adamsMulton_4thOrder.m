function answer = adamsMulton_4thOrder(f1, initial, h)
    format long
    syms x y(x) F 
    f = subs(f1, 'y', 'y(x)');
    F = sym(f);
    xi_3 = initial(1);
    yi_3 = initial(2);
    
    xi_2 = xi_3 + h;
    yi_2 = taylorMethod(f1, [xi_3 yi_3], h, 5);
    
    xi_1 = xi_2 + h;
    yi_1 = taylorMethod(f1, [xi_2 yi_2], h, 5);
    
    xi = xi_1 + h;
    yi = taylorMethod(f1, [xi_1 yi_1], h, 5);
    
    fi = eval(subs(F, {x, y(x)}, {xi, yi}));
    fi_1 = eval(subs(F, {x, y(x)}, {xi_1, yi_1}));
    fi_2 = eval(subs(F, {x, y(x)}, {xi_2, yi_2}));
    fi_3 = eval(subs(F, {x, y(x)}, {xi_3, yi_3}));
    
    yStar = yi + (h/24) * (55 * fi - 59 * fi_1 + 37 * fi_2 - 9 * fi_3);
    
    answer = yi + (h/24) * (9 * eval(subs(F, {x, y(x)}, {xi + h, yStar})) + 19 * fi - 5 * fi_1 + fi_2);
        
end