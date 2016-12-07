classdef fixedPoint < chap2.rootFindingMethod
    methods(Access = public)
        function res = getHeader(obj, F)
            F=char(simplify(subs(F,sym('x'))));
            G = F + sym('x');
            res = { sprintf('$$f(x) = %s = 0$$',texlabel(F)),...
                sprintf('$$g(x) = %s $$',texlabel(G)),...
                '$$x_{i+1} = g(x_i)$$'};
        end
        function res = getNext(obj,F, x0, x1, y0, y1)
            G = F + sym('x');
            x2 = eval(subs(G,sym('x'),x1));
            res=[x1,x2,x2];
        end
    end  
end