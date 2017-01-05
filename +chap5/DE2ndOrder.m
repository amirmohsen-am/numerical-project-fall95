function answers = DE2ndOrder(f, initial, h)
    syms  v u V F U
    
    xi = initial(1);
    yi = initial(2);
    yprimei = initial(3);
    
    
    f = subs(f, {'y', 'y''', 'y'''''}, {'y', 'u', 'v'});
%     f
%     F = sym(f);
%     F
    V = solve(f, v);
    U = u;
    
    
    x = xi;
    y = yi;
    u = yprimei;
    
    
    ans2 = h * eval(U) + yi;
    ans1 = h * eval(V) +  yprimei;
    
    answers = [ans1; ans2];
end