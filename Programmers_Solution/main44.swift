import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var str = A
    var res = 0
    if str == B {
        return 0
    }
    
    for _ in 0...str.count-1 {
        let index = str.index(str.startIndex, offsetBy: 0)
    
        str.insert(str.last!, at: index)
        str.removeLast()
        res += 1
        if str == B {
            return res
        }
    }
    
    return -1
}
