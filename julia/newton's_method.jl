using Plots

function df(f, x, h)    #微分の実行
    return (f(x+h) - f(x)) / h 
end

function Newton(f, x, n)    #ニュートン法
    h = 1.0e-10
    ϵ = 1.0e-11
    sq = [x]
    println("Step 0: $x")
    for i = 1:n
        if abs(f(x)) < ϵ   #許容可能な誤差に収まった場合
            ans = 2*x 
            println("successfully calculated within tolerance!")
            println("the root is $ans")
            break
        end
        x = x - f(x) / df(f, x, h)
        println("Step $i: $x")
        sq = vcat(sq, [x])
    end
    plot(sq, marker = :auto)
end

f(x) = cos(x)
Newton(f, 1.0, 100)