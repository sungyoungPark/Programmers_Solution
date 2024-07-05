import Foundation

func solution(_ n:Int) -> Int {
    return sqrt(Double(n)) == ceil(sqrt(Double(n))) ? 1 : 2
}