import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var count = 0
    var drawId = 0
    section.forEach { sect in
        if drawId < sect {
            count += 1
            drawId = sect + m - 1
        }
        if drawId >= n {
            return
        }
    }
    
    return count
}
