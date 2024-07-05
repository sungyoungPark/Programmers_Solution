import Foundation

func solution(_ citations:[Int]) -> Int {
    var arr = citations.sorted(by: >)
    var h_index = 0
    var count = 0 //h_index보다 크거나 같음
   
    for i in (0...arr.first!).reversed(){
        h_index = i
        for j in citations{
            if j >= h_index {
                count += 1
            }
        }
        if arr.count - count <= h_index && count >= h_index{
            return h_index
        }
        count = 0
    }

    return 1
}