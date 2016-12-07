classdef falsePosition < chap2.rootFindingMethod
    methods(Access = public)
        function res = getHeader(obj, F)
            F=char(simplify(subs(F,sym('x'))));
            res = { sprintf('$$f(x) = %s = 0$$',texlabel(F)),...
                '$$x_{i+1} = x_i - \frac{x_i - x_{i-1}}{f_i - f_{i-1}}f_i$$'};
        end
        function res = getNext(obj,F, x0, x1,y0,y1)
            x2 = x1 - ((x1-x0)/(y1-y0))*y1;
            y2 = eval(subs(F,'x',x2));
            
            if abs(x0)~=Inf && abs(x1)~=Inf
                plot(x0:0.01:x1,eval(subs(F,'x',x0:0.01:x1)),'r');
            end
            
            if(y2*y0<0)
                x1=x2;
            else
                x0=x2;
            end
            if abs(x0)~=Inf && abs(x1)~=Inf
                plot(x0:0.01:x1,eval(subs(F,'x',x0:0.01:x1)),'g');
            end
            res=[x0,x1,x2];
        end
    end  
end