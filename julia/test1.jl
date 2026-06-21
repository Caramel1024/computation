using Plots

function f(x)
    if x < 0
        return 0
    elseif x < 1
        return x
    else
        sqrt(x)
    end
end

function g(x)
    if (x + 1) <= (3 - 2 * x)
        return x + 1
    else
        return 3 - 2 * x
    end
    
end

function ff(x)
    a = 1
    for i = 1:x
        a = a * i
    end
    return a 
    
end

ff(5.3)