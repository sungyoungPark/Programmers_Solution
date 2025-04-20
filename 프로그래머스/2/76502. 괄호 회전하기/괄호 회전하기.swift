import Foundation

func solution(_ s:String) -> Int {
    if s.count % 2 != 0 {
        return 0
    }
    
    var res = 0
    
    var newString = s
    var i = 0
    var recentOpen : [Int] = []
    while true {
        
        var open1 = 0   // {
        var open2 = 0   // [
        var open3 = 0   // (
        
        for char in newString {
            if char == "{" {
                open1 += 1
                recentOpen.append(1)
            }
            else if char == "[" {
                open2 += 1
                recentOpen.append(2)
            }
            else if char == "(" {
                open3 += 1
                recentOpen.append(3)
            }
            else if char == "}" {
                guard let recent = recentOpen.last else { open1 = -1; break }
                if recent == 1 {
                    open1 -= 1
                    recentOpen.removeLast()
                    if open1 < 0 {
                        break
                    }
                }
                else {
                    open1 = -1
                    break
                }
            }
            else if char == "]" {
                guard let recent = recentOpen.last else { open2 = -1; break }
                if recent == 2 {
                    open2 -= 1
                    recentOpen.removeLast()
                    if open2 < 0 {
                        break
                    }
                }
                else {
                    open2 = -1
                    break
                }
            }
            else if char == ")" {
                guard let recent = recentOpen.last else { open3 = -1; break }
                if recent == 3 {
                    open3 -= 1
                    recentOpen.removeLast()
                    if open3 < 0 {
                        break
                    }
                }
                else {
                    open3 = -1
                    break
                }
            }
        }
        
        if open1 == 0 && open2 == 0 && open3 == 0 {
            
            res += 1
        }
        
        let original = newString
        newString = String(original.dropFirst()) + String(original.first!)
        
        i += 1
        
        if i >= s.count {
            break
        }
        
    }
    
    return res
}