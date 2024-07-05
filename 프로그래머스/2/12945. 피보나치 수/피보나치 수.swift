import Foundation

func solution(_ n:Int) -> Int {
   var val1 = 0
    var val2 = 1
    var temp = 0
    
    if n == 0 {
        return val1
    }
    else if n == 1 {
        return val2
    }
    
    for _ in 2...n{
        temp = (val1 + val2 ) % 1234567
        val1 = val2
        val2 = temp
    }
    

    return temp % 1234567
}