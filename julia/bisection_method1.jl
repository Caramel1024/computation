using Plots

function bisec(f, a, b, n)
    sq = [a b]  #区間を保管
    println("Step0: [$a, $b]")
    for i = 1:n 
        if f(a) * f(b) > 0  #解の存在が保証できない場合
            println("No root guaranteed in [$a, $b]")
            break
        else
            m = (a + b) / 2
            if abs(b - a) < 1.0e-7  #許容可能な誤差に収まった場合
                tol = abs(b - a)
                println("successfully calculated within tolerance!")
                println("the root is $m")
                println("the tolerance is $tol")
                break
            end
            if f(m) == 0    #厳密解と一致した場合
                println("Step$i: [$a, $b]")
                println("$m is a root of $f")
                break
            elseif f(a) * f(m) > 0  #f(a)とf(m)の符号が同符号かで場合分け
                a = m
            else
                b = m        
            end
            println("Step$i: [$a, $b]")
        end
        sq = vcat(sq, [a b])
    end
    plot(sq, marker = :auto)    #区間の変遷をプロット
end

f(x) = cos(x)
bisec(f, 1.0, 2.0, 100)