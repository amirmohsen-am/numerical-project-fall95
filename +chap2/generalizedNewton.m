function [ output_args ] = generalizedNewton( equations,  initial_values)
n = length(equations);
sym_values = sym('a%d',[n,1]);

Jacobian = sym('tmp',[n,n]);
for i=1:n
    for j=1:n
        Jacobian(i,j)=diff(equations(i),sym_values(j));
    end
end
F = sym('tmp',[n,1]);
for i=1:n
    F(i) = equations(i);
end
initial_values = initial_values - subs(inv(Jacobian)*F,sym_values,initial_values);
plot(initial_values(1),initial_values(2),'ro');
end

