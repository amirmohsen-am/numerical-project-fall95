classdef newton < chap2.rootFindingMethod
    methods(Access = public)
        function res = getHeader(obj, F)
            F=char(simplify(subs(F,sym('x'))));
            Fdiff=char(simplify(subs(diff(F,sym('x')),sym('x'))));
            res = { sprintf('$$f(x) = %s = 0$$',texlabel(F)),...
                sprintf('$$f''(x) = %s = 0$$',texlabel(Fdiff)),...
                '$$x_{i+1} = x_i - \frac{f(x_i)}{f''(x_i)}$$'};
        end
        function res = getNext(obj,F, x0, x1,y0,y1)
            x2 = x1 - y1/eval(subs(diff(F,sym('x')),'x',x1));
            res=[x1,x2,x2];
        end
    end  
end