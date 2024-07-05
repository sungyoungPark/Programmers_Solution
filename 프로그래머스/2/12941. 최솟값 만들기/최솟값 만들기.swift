import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var a = A.sorted(by: >)
    var b = B.sorted(by: <)
    
    for i in 0...A.count-1{
        ans = ans + a[a.index(a.startIndex, offsetBy: i)] * b[b.index(b.startIndex, offsetBy: i)]
    }
    return ans
}