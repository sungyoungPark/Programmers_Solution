import Foundation

func solution(_ numbers:[Int]) -> Int {
    
    var i = 0
    var ans = 0
    var numbers = numbers.sorted()
    
    var index = 0
    for i in 0...9 {
        
        if numbers.count == index {
            ans += i
        }
        
        else if numbers[index] != i {
            ans += i
        }
        else {
            index += 1
        }
        
    }
    
    return ans
}
