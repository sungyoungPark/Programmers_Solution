import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    
    var boxArr = [Int](repeating: -1, count: n+1)
    var boxIndex = 0
    var isPlus = true
    
    for i in 1 ..< n + 1 {
        boxArr[i] = boxIndex
        
        if isPlus {
            boxIndex += 1
        }
        else {
            boxIndex -= 1
        }
        
        if boxIndex == w {
            boxIndex -= 1
            isPlus = false
        }
        else if boxIndex == -1 {
            boxIndex = 0
            isPlus = true
        }
    }
    return Array(boxArr[num...n]).filter {
        $0 == boxArr[num]
    }.count
}