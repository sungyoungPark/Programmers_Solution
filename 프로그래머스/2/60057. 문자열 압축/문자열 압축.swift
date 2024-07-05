import Foundation

func solution(_ s:String) -> Int {
    var arr = s
    var a = (s.count) / 2
    var k = 1
    var x = 0
    var temp = ""
    var temp_all = ""
    var min_count = arr.count
    var flag = 1
    
    if s.count <= 1{
        return s.count
    }
    
    var range1 = arr.index(arr.startIndex, offsetBy: x)..<arr.index(arr.startIndex,offsetBy: x + k)
    var range2 = arr.index(arr.startIndex, offsetBy: x + k)..<arr.index(arr.startIndex,offsetBy: x + 2 * k )
    
    for i in 0...a {
        if k > a{
            break
        }
        while true{
            if x + 2 * k  >= arr.count + 1 {
                
                if flag != 1 {
                    temp.append(String(flag))
                    temp.append(String(arr[range2]))
                }
                else{
                    
                    temp.append(String(arr[range2]))
                }
                range2 = arr.index(arr.startIndex, offsetBy: x + k)..<arr.index(arr.startIndex,offsetBy: arr.count  )
                temp.append(String(arr[range2]))
                flag = 1
                
                break
            }
            
            range1 = arr.index(arr.startIndex, offsetBy: x)..<arr.index(arr.startIndex,offsetBy: x + k)
            range2 = arr.index(arr.startIndex, offsetBy: x + k)..<arr.index(arr.startIndex,offsetBy: x + 2 * k )
            
            if arr[range1] == arr [range2]{
                flag += 1
            }
                
            else if arr[range1] != arr[range2]{
                if flag != 1 {
                    temp.append(String(flag))
                    temp.append(String(arr[range1]))
                }
                else{
                    temp.append(String(arr[range1]))
                }
                flag = 1
            }
            
            x = x + k
            
        }//while end
        if min_count > temp.count {
            min_count = temp.count
        }
        temp.removeAll()
        x = 0
        k += 1
    }
    
    return min_count
}