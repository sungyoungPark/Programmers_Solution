import Foundation

func solution(_ s:String) -> Bool
{
    var stack : [String] = []
    var a = 0
    
    for i in s {
        if String(i) == ")" && a == 0{
            return false
        }
        if String(i) == "(" {
            a += 1
        }
        else if String(i) == ")" && a != 0 {
            a -= 1
        }
        
    }
    if a != 0 {
        return false
    }
    else {
        return true
    }
}