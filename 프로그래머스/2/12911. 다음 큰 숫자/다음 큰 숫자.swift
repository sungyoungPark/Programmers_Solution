import Foundation

func solution(_ n:Int) -> Int
{
    var answer = ""
    var check = n
    var count_1 = 0
    var count_re = 0
    answer = String(n,radix: 2)
    for i in answer{
        if String(i) == "1"{
            count_1 += 1
        }
    }
    while true {
        check += 1
        answer = String(check, radix: 2)
        for i in answer{
               if String(i) == "1"{
                   count_re += 1
               }
           }
        if count_re == count_1 {
            return check
        }
        else{
            count_re = 0
        }
    }
}