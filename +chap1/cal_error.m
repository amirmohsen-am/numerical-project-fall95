function [value, error, relError] = cal_error(exp, input, error, isChopping)
    format long
    syms A B C D E F eA eB eC eD eE eF
    
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
    
    a = str2double(aStr);
    b = str2double(bStr);
    c = str2double(cStr);
    d = str2double(dStr);
    e = str2double(eStr);
    f = str2double(fStr);
    
    if (errA < 0)
        a = A;
        errA = eA;
    end
    
    if (errB < 0)
        b = B;
        errB = eB;
    end
    
    if (errC < 0)
        c = C;
        errC = eC;
    end
       
    if (errD < 0)
        d = D;
        errD = eD;
    end
    
    if (errE < 0)
        e = E;
        errE = eE;
    end
    
    if (errF < 0)
        f = F;
        errF = eF;
    end
    
    values = [a;b;c;d;e;f];
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