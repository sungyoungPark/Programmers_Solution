import Foundation

func solution(_ s:String) -> String {
    var ans = ""
    var input = s.components(separatedBy: " ")
    var trans = [Int]()
    for i in input{
        var new = Int(i)!
        trans.append(new)
    }
    trans = trans.sorted()
    ans.append(String(trans[trans.startIndex]))
    ans.append(" ")
    ans.append(String(trans[trans.endIndex-1]))
    return ans
}