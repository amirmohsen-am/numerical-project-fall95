function out = simpsons3(f, a, b, h)
    n = (b-a)/h;
    if mod(n,2)~=0
        out='n must be even for simpson 1/3';
        return
    end
    m=[1 repmat([4 2],1,n/2)];
    m(n+1)=1;
    out = eval(subs(f,a:h:b));
    size(out)
    size(m)
    out = m.*out;
    out = sum(out)*h/3;
end