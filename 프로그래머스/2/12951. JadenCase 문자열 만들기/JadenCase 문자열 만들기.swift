import Foundation

func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ")
    var check = 0
    var result = ""
    var check_first = 0
    print(arr)
    for i in arr {
        check += 1
        for j in i{
            if check_first == 0{
                check_first = 1
                result.append(j.uppercased())
            }
            else{
                result.append(j.lowercased())
            }
        }
        check_first = 0
        if check != arr.count{
            result.append(" ")
        }
    }
    
    return result
}