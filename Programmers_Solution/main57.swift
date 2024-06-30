import Foundation

func solution(_ n:Int) -> Int {
    
    var n = n
    var str = ""
    while true {
        str += String(n % 3)
        n = n / 3
        if n == 0 {
            break
        }
    }
    
    var ans = 0
    var k = 1
    while true {
        if str.isEmpty {
            break
        }
        let t = str.removeLast()
        ans += k * Int(String(t))!
        k = k * 3
    }
    
    return ans
}
