function [a,b] = aerbisection(fun,a0,b0,tol)
    f1 = fun(a0);
    f2 = fun(b0);
    ai = a0;
    bi = b0;
    count = 0;
    if sign(f1) == sign(f2)
        error("ERROR: Input can not find a roots, consider choosing a diffrent [a0,b0]")
    else
        while bi-ai > tol
            count = count + 1;
            c = (ai+bi)/2;
            f = fun(c);
            f1 = fun(ai);
            if sign(f) == sign(f1)
                ai = c;
            else
                bi = c;
            end
        end
        disp(count)
        a = ai;
        b = bi;
    end
end