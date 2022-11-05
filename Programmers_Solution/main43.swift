import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var res = 0
    var stack : [Int] = []
    
    for item in ingredient{
        
        stack.append(item)
        
        if stack.count >= 4 {
            let lastIndex = stack.count - 1
            if stack[lastIndex] == 1 && stack[lastIndex - 1] == 3 &&
                stack[lastIndex - 2] == 2 && stack[lastIndex - 3] == 1 {
                res += 1
                stack.removeLast()
                stack.removeLast()
                stack.removeLast()
                stack.removeLast()
            }
        }
        
    }
    
    return res
}
