function [fValue, fError, fRelError] = final_cal_error(exp, input, error, isChopping)
    format long
        
    counter = 0;
    for i = 1 : length(exp)
        if(exp(i) == '(')
            counter = counter + 1;
        elseif (exp(i) == ')')
            counter = counter - 1;
        end
    end
    
    if(counter ~= 0)
        error('Expression not valid');
    end
    
    if(isnan(input(1)))
        strA = ' ';
    else
        strA = num2str(input(1));
    end
    
    if(isnan(input(2)))
        strB = ' ';
    else
        strB = num2str(input(2));
    end
    
    if(isnan(input(3)))
        strC = ' ';
    else
        strC = num2str(input(3));
    end
    
    if(isnan(input(4)))
        strD = ' ';
    else
        strD = num2str(input(4));
    end
    
    if(isnan(input(5)))
        strE = ' ';
    else
        strE = num2str(input(5));
    end
    
    if(isnan(input(6)))
        strF = ' ';
    else
        strF = num2str(input(6));
    end
    
    
    %
    if(isnan(error(1)))
        strerrA = ' ';
    else
        strerrA = num2str(error(1));
    end
    
    if(isnan(error(2)))
        strerrB = ' ';
    else
        strerrB = num2str(error(2));
    end
    
    if(isnan(error(3)))
        strerrC = ' ';
    else
        strerrC = num2str(error(3));
    end
    
    if(isnan(error(4)))
        strerrD = ' ';
    else
        strerrD = num2str(error(4));
    end
    
    if(isnan(error(5)))
        strerrE = ' ';
    else
        strerrE = num2str(error(5));
    end
    
    if(isnan(error(6)))
        strerrF = ' ';
    else
        strerrF = num2str(error(6));
    end
    %
    
    a = cellstr(strA);
    b = [a; cellstr(strB)];
    c = [b; cellstr(strC)];
    d = [c; cellstr(strD)];
    e = [d; cellstr(strE)];
    values = [e; cellstr(strF)];
    
    erra = cellstr(strerrA);
    errb = [erra; cellstr(strerrB)];
    errc = [errb; cellstr(strerrC)];
    errd = [errc; cellstr(strerrD)];
    erre = [errd; cellstr(strerrE)];
    errors = [erre; cellstr(strerrF)];
    
    [fValueVal, fErrorVal, fRelErrorVal] = chap1.cal_error(exp, values, errors, isChopping);
    
    try
        fValue = num2str(fValueVal);
    catch
        fValue = char(fValueVal);
    end
    
    try
        fError = num2str(fErrorVal);
    catch
        fError = char(fErrorVal);
    end
    
    try
        fRelError = num2str(fRelErrorVal);
    catch
        fRelError = char(fRelErrorVal);
    end
    
end