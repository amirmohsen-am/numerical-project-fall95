function out = simpsons8(f, a, b, h)
    n = (b-a)/h;
    if mod(n,3)~=0
        'Some Error'
    end
    m=[1 repmat([3 3 2],1,n/3)];
    m(n+1)=1;
    out = eval(subs(f,a:h:b));
    out = m.*out;
    out = sum(out)*h*3/8;
end