import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var arr = [Int]()
    
    for i in left...right {
        let k = max(Int(i) / n + 1 , Int(i) % n + 1)
        arr.append(k)
    }
  
    return arr
}