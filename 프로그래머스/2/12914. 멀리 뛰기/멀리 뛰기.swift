import Foundation

func solution(_ n:Int) -> Int {
    var arr = [1,2]
    if n < 3{
        return arr[n-1] % 1234567
    }
    else{
        for _ in 3...n{
            let temp = arr[1]
            arr[1] = (arr[0] + arr[1]) % 1234567
            arr[0] = temp
        }
    }
    return arr.last!
}