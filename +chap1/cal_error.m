function [value, error, relError] = cal_error(exp, input, error, isChopping)
    format long
    syms a b c d e f e_a e_b e_c e_d e_e e_f
    
    aStr = char(input(1));
    bStr = char(input(2));
    cStr = char(input(3));
    dStr = char(input(4));
    eStr = char(input(5));
    fStr = char(input(6));
    
    errAStr = char(error(1));
    errBStr = char(error(2));
    errCStr = char(error(3));
    errDStr = char(error(4));
    errEStr = char(error(5));
    errFStr = char(error(6));
    
    errA = chap1.calculate_absolute_error(aStr, errAStr, isChopping);
    errB = chap1.calculate_absolute_error(bStr, errBStr, isChopping);
    errC = chap1.calculate_absolute_error(cStr, errCStr, isChopping);
    errD = chap1.calculate_absolute_error(dStr, errDStr, isChopping);
    errE = chap1.calculate_absolute_error(eStr, errEStr, isChopping);
    errF = chap1.calculate_absolute_error(fStr, errFStr, isChopping);
    
    
    A = str2double(aStr);
    B = str2double(bStr);
    C = str2double(cStr);
    D = str2double(dStr);
    E = str2double(eStr);
    F = str2double(fStr);
    
    if (errA < 0)
        A = a;
        errA = e_a;
    end
    
    if (errB < 0)
        B = b;
        errB = e_b;
    end
    
    if (errC < 0)
        C = c;
        errC = e_c;
    end
       
    if (errD < 0)
        D = d;
        errD = e_d;
    end
    
    if (errE < 0)
        E = e;
        errE = e_e;
    end
    
    if (errF < 0)
        F = f;
        errF = e_f;
    end
    
    
    
    if(isempty(char(error(1))) == 0)
        errA = str2num(char(error(1)));
    end
    if(isempty(char(error(2))) == 0)
        errB = str2num(char(error(2)));
    end
    if(isempty(char(error(3))) == 0)
        errC = str2num(char(error(3)));
    end
    if(isempty(char(error(4))) == 0)
        errD = str2num(char(error(4)));
    end
    if(isempty(char(error(5))) == 0)
        errE = str2num(char(error(5)));
    end
    if(isempty(char(error(6))) == 0)
        errF = str2num(char(error(6)));
    end
    
    
    values = [A;B;C;D;E;F];
    errors = [errA;errB;errC;errD;errE;errF];
    in = ['a';'b';'c';'d';'e';'f'];
    
    [final, in, values, errors] = chap1.Calcualte_error_2(exp, in, values, errors);
    
    try
        error = double(errors(length(errors)));
        value = double(values(length(values)));
        relError = double(error / value);
    catch
        error = (errors(length(errors)));   
        value = (values(length(values)));
        relError = (error / value);
    end
    
    
    
    
end