import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    let y_index = arr2[arr2.startIndex].count - 1
    var x_value = 0
    var y_value = 0
    var add = 0
    var final_result : [[Int]] = [[]]
    var result : [Int] = []
    final_result.removeAll()
    for i in arr1{
        for _ in 0...y_index{
            for j in i {
                add = add + j * arr2[arr2.index(arr2.startIndex, offsetBy: x_value)][arr2.index(arr2.startIndex, offsetBy: y_value)]
                x_value += 1
            }
            result.append(add)
            add = 0
            y_value += 1
            x_value = 0
        }
        x_value = 0
        y_value = 0
        final_result.append(result)
        result.removeAll()

    }
    
    return final_result
}