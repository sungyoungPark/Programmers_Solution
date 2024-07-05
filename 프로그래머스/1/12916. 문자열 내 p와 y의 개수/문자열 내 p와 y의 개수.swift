import Foundation

func solution(_ s:String) -> Bool
{
        let str = s.lowercased()
    var p_count = 0
    var y_count = 0
    for i in str {
        if i == "p"{
            p_count += 1
        }
        else if i == "y"{
            y_count += 1
        }
    }
    if p_count == y_count {
        return true
    }
    else {
        return false
    }
    
}