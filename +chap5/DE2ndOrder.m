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
    
    if(isempty(V))
        V = 0;
    end

    
    x = xi;
    y = yi;
    u = yprimei;
    
    
    ans2 = eval(vpa(h * eval(U) + yi));
    if( V ~= 0)
    ans1 = eval(vpa(h * eval(V) +  yprimei));
    else
        ans1 = yprimei;
    end
    answers = [ans1; ans2];
end