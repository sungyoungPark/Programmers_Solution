import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var arr = priorities
    var sort_val = priorities.sorted(by: >)
    var cur_index = 0  //priorities에 인덱스
    var order = 1  //순서
    var result : [Int:Int] = [:]
    for i in sort_val{
        while true{
            if arr[arr.index(arr.startIndex, offsetBy: cur_index)] == i
            {
                result.updateValue(order, forKey: cur_index % priorities.count)
                arr.append(arr[arr.index(arr.startIndex, offsetBy: cur_index)])
                cur_index += 1
                break
            }
            else{
                arr.append(arr[arr.index(arr.startIndex, offsetBy: cur_index)])
                cur_index += 1
            }
        }
        order += 1
    }
    return result[location]!
}