function answers = DE2ndOrderRunge_Kutta(f, initial, h)
    syms  v u V F U
    
    xi = initial(1);
    yi = initial(2);
    yprimei = initial(3);
    
    
    f = subs(f, {'y', 'y''', 'y'''''}, {'y', 'u', 'v'});

    
    V = solve(f, v);
    U = u;

    
    if(isempty(V))
        V = 0;
    end

    x = xi;
    y = yi;
    u = yprimei;
    k1f = eval(vpa(eval(U)));
    if(V ~= 0)
        k1g = eval(vpa(eval(V)));
    else
        k1g = 0;
    end
    
    x = xi + h/2;
    y = eval(vpa(yi + (h/2) * k1f));
    u = eval(vpa(yprimei + (h/2) * k1g));
    k2f = eval(vpa(eval(U)));
    if(V ~= 0)
    k2g = eval(vpa(eval(V)));
    else
        k2g = 0;
    end
    x = xi + h/2;
    y = eval(vpa(yi + (h/2) * k2f));
    u = eval(vpa(yprimei + (h/2) * k2g));
    k3f = eval(vpa(eval(U)));
    if( V ~= 0)
    k3g = eval(vpa(eval(V)));
    else
        k3g = 0;
    end
    x = xi + h;
    y = eval(vpa(yi + (h) * k2f));
    u = eval(vpa(yprimei + (h) * k3g));
    k4f = eval(vpa(eval(U)));
    if(V ~= 0)
    k4g = eval(vpa(eval(V)));
    else
        k4g = 0;
    end
    ans2 = eval(vpa(eval(vpa((h/6) * (k1f + 2*k2f + 2*k3f + k4f))) + yi));
    ans1 = eval(vpa(eval(vpa((h/6) * (k1g + 2*k2g + 2*k3g + k4g))) + yprimei));
    
    answers = [ans1; ans2];
end