import Foundation

func solution(_ n:Int) -> Int {
    var res = 0
    var target = n
    for i in 0...7{
        res +=  target % 10
        target = target / 10
    }
    
    return res
}