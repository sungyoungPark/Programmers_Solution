import Foundation

func solution(_ n:Int) -> Int
{
    var input = n
    var ans = 0
    while(input != 0){
        if input % 2 == 0{
            input = input / 2
        }
        else{
            input = input - 1
            ans = ans + 1
        }
    }
    return ans
}