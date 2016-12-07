function value = calculate_value(F, input)
    format long
    syms a b c d e f
    
    aStr = num2str(input(1));
    bStr = num2str(input(2));
    cStr = num2str(input(3));
    dStr = num2str(input(4));
    eStr = num2str(input(5));
    fStr = num2str(input(6));
  
    a = str2double(aStr);
    b = str2double(bStr);
    c = str2double(cStr);
    d = str2double(dStr);
    e = str2double(eStr);
    f = str2double(fStr);
    
	F(isspace(F)) = [];
	F = chap1.Parentheses2(F); 
    
    value = eval(F);
    
end