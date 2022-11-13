import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    let sort_arr = score.sorted(by: >)
    var res = 0
    for i in stride(from: m - 1, to: score.count, by: m) {
        res += sort_arr[i] * m
    }
    
    return res
}
