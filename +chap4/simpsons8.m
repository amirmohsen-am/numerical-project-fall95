function out = simpsons8(f, a, b, h)
    n = round((b-a)/h);
    if mod(n,3)~=0
        out='N must be multiple of 3 for simpson 3/8';
        return
    end
    m=[1 repmat([3 3 2],1,n/3)];
    m(n+1)=1;
    out = eval(subs(f,a:h:b));
    out = m.*out;
    out = sum(out)*h*3/8;
end