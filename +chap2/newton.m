classdef newton < chap2.rootFindingMethod
    methods(Access = public)
        function res = getHeader(obj, F)
            F=char(simplify(subs(F,sym('x'))));
            res = { sprintf('f(x) = %s = 0',texlabel(F)),...
                'x_{i+1} = \frac{x_i+x_{i-1}}{2}'};
        end
        function res = getNext(obj,F, x0, x1,y0,y1)
            x2 = x1 - y1/eval(subs(diff(F,sym('x')),'x',x1));
            res=[x1,x2,x2];
        end
    end  
end