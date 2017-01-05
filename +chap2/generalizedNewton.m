function [ output_args ] = generalizedNewton(equations,  tmp_initial_values, steps, handles)


n = length(equations);
sym_values = sym('a%d',[n,1]);

Jacobian = sym('tmp',[n,n]);
for i=1:n
    for j=1:n
        Jacobian(i,j)=diff(sym(equations(i)),sym_values(j));
    end
end
F = sym('tmp',[n,1]);
initial_values = zeros(n,1);
for i=1:n
    F(i) = sym(equations(i));
    initial_values(i) = str2double(tmp_initial_values(i));
end
texty=0;
folan_step = 0.05;
global precision
for i=1:steps+1
    axes(handles.axesLog);
    text(0.1, texty-folan_step/2, sprintf('$Step %d:$',i-1), 'Interpreter', 'latex');
    texty = texty-folan_step;
    for j=1:n
        text(0.1, texty-folan_step/2, sprintf(sprintf('$a_%%d = %%.%df$', precision) ,j,initial_values(j)), 'Interpreter', 'latex');
        texty = texty-folan_step;
    end
    axes(handles.axesPlot);
    initial_values = eval(vpa(eval(initial_values - subs(inv(Jacobian)*F,sym_values,initial_values)),digits));
end

% plot(initial_values(1),initial_values(2),'ro');
end

