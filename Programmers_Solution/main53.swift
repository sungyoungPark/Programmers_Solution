import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var n = n
    var ans = 0
    while true {
        ans += b * (n / a)
        n = b * (n / a) + (n % a)
        if n < a {
            break
        }
    }
    
    return ans
}
